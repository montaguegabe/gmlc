from gmlc_compiler import CHAR_SYMBOLS
from gmlc_utils import line_to_symbols, replace_substr

pword = "kyqE?EcR:Q<7n~+U"
pword_len = len(pword)
pword_bytes = map(lambda char: ord(char), pword)

class SblTranslator(object):
    def __init__(self, resnames, scrnames, file_size, encrypt=True):
        super(SblTranslator, self).__init__()
        self.resnames = resnames
        self.scrnames = scrnames
        self.directive = None
        self.i = file_size
        self.j = self.i % pword_len
        self.comma_prefix = False
        self.encrypt = encrypt

        # Remember previous codeblock symbols
        self.prev_codeblock_sym = None
        self.prev_codeblock_ind = None

    # Input a buffer to translate, encrypt
    def feed(self, bfr):

        ind_offset = 0

        # Scan for resource name symbols
        symbols, _ = line_to_symbols(bfr, CHAR_SYMBOLS, False)
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
                    # Insert comma in buffer
                    split_ind = index + ind_offset
                    bfr = bfr[:split_ind ] + "," + bfr[split_ind:]
                    ind_offset += 1

            self.comma_prefix = False
            if symbol == "(" and self.prev_codeblock_sym != None:

                # Replace script name with string execution
                prev_scrname = None
                prev_scrind = None
                for scrname in self.scrnames:

                    if self.prev_codeblock_sym.endswith(scrname):
                        potential_prev_scrind = len(self.prev_codeblock_sym) - len(scrname) - 1
                        preceeding = self.prev_codeblock_sym[potential_prev_scrind - 1] if potential_prev_scrind - 1 >= 0 else None

                        # We must make sure the script name is not merely just at the end of a longer name of something else
                        if preceeding == None or ((not preceeding.isalnum()) and preceeding != '_'):

                            prev_scrname = scrname
                            prev_scrind = potential_prev_scrind
                            self.comma_prefix = True

                if prev_scrname:
                    new_scrname = "execute_string(global.__" + prev_scrname
                    new_prevsym = replace_substr(self.prev_codeblock_sym, prev_scrind, prev_scrname, new_scrname)
                    bfr = replace_substr(bfr, index + ind_offset, symbol, "")
                    ind_offset -= len(symbol)
                    bfr = replace_substr(bfr, self.prev_codeblock_ind + ind_offset, self.prev_codeblock_sym, new_prevsym)
                    ind_offset += len(new_prevsym) - len(self.prev_codeblock_sym)

            # Translate keywords
            if symbol == "this_resource":
                bfr = replace_substr(bfr, index + ind_offset, symbol, "global.__itp_res")
                ind_offset += len("global.__itp_res") - len(symbol)

            # Translate resource names
            elif symbol in self.resnames and should_translate:

                # Replace occurance with modified version
                new_symbol = "global.__" + symbol
                bfr = replace_substr(bfr, index + ind_offset, symbol, new_symbol)
                ind_offset += len(new_symbol) - len(symbol)

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
            if self.encrypt: mod_bfr += chr((byte + pword_bytes[self.j]) % 256)
            else: mod_bfr += chr((byte + 0) % 256)

            self.i += 1
            self.j = self.i % pword_len

        return mod_bfr
        