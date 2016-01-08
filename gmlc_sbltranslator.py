from gmlc_compiler import CHAR_SYMBOLS
from gmlc_utils import line_to_symbols, replace_substr

pword = "kyqE?EcR:Q<7n~+U"
pword_len = len(pword)
pword_bytes = map(lambda char: ord(char), pword)

class SblTranslator(object):
    def __init__(self, resnames, scrnames, file_size):
        super(SblTranslator, self).__init__()
        self.resnames = resnames
        self.scrnames = scrnames
        self.directive = None
        self.i = file_size
        self.j = self.i % pword_len
        self.comma_prefix = False

        # Remember previous codeblock symbols
        self.prev_codeblock_sym = None
        self.prev_codeblock_ind = None

    # Input a buffer to translate, encrypt
    def feed(self, bfr):

        # Scan for resource name symbols
        symbols,_ = line_to_symbols(bfr, CHAR_SYMBOLS, False)
        sym_num = -1
        directive_line = False
        for symbol, index in symbols:

            sym_num += 1

            if symbol[0] == '@':
                self.directive = symbol
                directive_line = True
                continue

            # Determine if should translate resource names
            should_translate = True
            if directive_line:
                # Preserve names
                if (self.directive == "@obj_declare" or self.directive == "@rm_declare") and sym_num == 1:
                    should_translate = False
            else:
                # Only translate blocks outside of directive lines
                if self.directive != "@import_evt" and self.directive != "@obj_evt":
                    should_translate = False

            # Translate script executions
            if self.comma_prefix:
                if symbol != ")":
                    symbol = "," + symbol
            if symbol == "(" and self.prev_codeblock_sym != None:

                # Replace script name with string execution
                prev_scrname = None
                prev_scrind = None
                for scrname in self.scrnames:
                    if self.prev_codeblock_sym.endswith(scrname):
                        prev_scrname = scrname
                        prev_scrind = len(self.prev_codeblock_sym) - len(scrname) - 1
                        self.comma_prefix = True

                if prev_scrname:
                    new_scrname = "execute_string(global.__" + prev_scrname
                    new_prevsym = replace_substr(self.prev_codeblock_sym, prev_scrind, prev_scrname, new_scrname)
                    bfr = replace_substr(bfr, index, symbol, "")
                    bfr = replace_substr(bfr, self.prev_codeblock_ind, self.prev_codeblock_sym, new_prevsym)

            # Translate keywords
            if symbol == "this_resource":
                bfr = replace_substr(bfr, index, symbol, "global.__itp_res")

            # Translate resource names
            elif symbol in self.resnames and should_translate:

                # Replace occurance with modified version
                new_symbol = "global.__" + symbol
                bfr = replace_substr(bfr, index, symbol, new_symbol)

            # Remember previous codeblock symbols
            if not directive_line:
                self.prev_codeblock_sym = symbol
                self.prev_codeblock_ind = index
            else:
                self.prev_codeblock_sym = None
                self.prev_codeblock_ind = None

        # Encrypt
        mod_bfr = ""
        for char in bfr:

            byte = ord(char)
            mod_bfr += chr((byte + pword_bytes[self.j]) % 256)
            #mod_bfr += chr((byte + 0) % 256)

            self.i += 1
            self.j = self.i % pword_len

        return mod_bfr
        