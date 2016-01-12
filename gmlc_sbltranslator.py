from gmlc_compiler import CHAR_SYMBOLS
from gmlc_utils import line_to_symbols, replace_substr, valid_varname
from gmlc_gmnames import GM_NAMES

pword = "kyqE?EcR:Q<7n~+U"
pword_len = len(pword)
pword_bytes = map(lambda char: ord(char), pword)

HISTORY_LEN = 5

CODEBLOCK_DIRECTIVES = set([
    "obj_evt",
    "import_evt",
    "scr_declare"
])

class SblTranslator(object):
    def __init__(self, resnames, scrnames, file_size, minify=False, encrypt=True):
        super(SblTranslator, self).__init__()
        self.resnames = resnames
        self.scrnames = scrnames
        
        self.i = file_size
        self.j = self.i % pword_len
        self.encrypt = encrypt

        # The current directive defined as early as possible
        self.directive = None
        self.directive_line = False

        # Whether we are in a codeblock
        self.codeblock = False

        # Whether previous was a script
        self.script_construct_stage = 0

        self.minify = minify
        self.mini_maps = {}
        self.mini_num = 1

        # Previous code block symbols (non whitespace) added
        self.history = [" "] * HISTORY_LEN

        # Minify names
        if self.minify:
            self.resnames = map(lambda name: self.minify_symbol(name), self.resnames)
            self.scrnames = map(lambda name: self.minify_symbol(name), self.scrnames)

    def minify_symbol(self, symbol):
        if symbol and (symbol[0].isalpha() or symbol[0] == "_"):
            if symbol not in GM_NAMES:
                if symbol not in self.mini_maps:
                    if symbol[:2] == "__" and symbol[2:] in self.mini_maps:
                        new_sym = "__" + self.mini_maps[symbol[2:]]
                    else:
                        new_sym = "v" + str(self.mini_num)

                    self.mini_maps[symbol] = new_sym
                    self.mini_num += 1
                    return new_sym
                else:
                    return self.mini_maps[symbol]

        return symbol

    def feed(self, symbol):

        # Minify
        if self.minify: symbol = self.minify_symbol(symbol)

        replacement = None
        prefix = None

        # Categorize
        newline = symbol == "\n" or symbol == "\r"
        whitespace = newline or symbol == " "

        # Determine directive
        if self.history[0] == "@":
            self.directive = symbol
            self.directive_line = True
            self.codeblock = False

        # Determine whether in codeblock
        if self.directive_line and newline:
            self.codeblock = self.directive in CODEBLOCK_DIRECTIVES
            self.directive_line = False

        # Translate resource names
        should_translate = False
        if self.codeblock: should_translate = True
        if self.directive == "obj_evt": should_translate = True
        if should_translate and symbol in self.resnames:
            replacement = "global.__" + symbol

        # Translate this_resource
        if symbol == "this_resource": replacement = "global.__itp_res";

        # Translate script executions
        if self.script_construct_stage == 2:
            self.script_construct_stage = 0
            prefix = ","

        elif not whitespace:

            if self.script_construct_stage == 1 and symbol == "(":
                self.script_construct_stage = 2
                replacement = "execute_string(global.__" + self.history[0]

            elif self.codeblock and symbol in self.scrnames:
                replacement = ""
                self.script_construct_stage = 1
            else:
                self.script_construct_stage = 0

        # Add to history
        if not whitespace:
            self.history.insert(0, symbol)
            self.history.pop()

        output = replacement if replacement != None else symbol
        if prefix != None: output = prefix + output

        # Encrypt
        enc_output = ""
        for char in output:

            byte = ord(char)
            if self.encrypt: enc_output += chr((byte + pword_bytes[self.j]) % 256)
            else: enc_output += chr((byte + 0) % 256)

            self.i += 1
            self.j = self.i % pword_len

        return enc_output
        