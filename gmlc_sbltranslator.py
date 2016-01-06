from gmlc_compiler import CHAR_SYMBOLS
from gmlc_utils import line_to_symbols, replace_substr

pword = "kyqE?EcR:Q<7n~+U"
pword_len = len(pword)
pword_bytes = map(lambda char: ord(char), pword)
print pword_bytes

class SblTranslator(object):
    def __init__(self, resnames, file_size):
        super(SblTranslator, self).__init__()
        self.resnames = resnames
        self.directive = None
        self.i = file_size
        print file_size
        self.j = self.i % pword_len

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

            # Translate keywords
            if symbol == "this_resource":
                bfr = replace_substr(bfr, index, symbol, "global.__itp_res")

            # Translate resource names
            elif symbol in self.resnames and should_translate:

                # Replace occurance with modified version
                new_symbol = "global.__" + symbol
                bfr = replace_substr(bfr, index, symbol, new_symbol)

        # Encrypt
        mod_bfr = ""
        for char in bfr:

            byte = ord(char)
            mod_bfr += chr((byte + pword_bytes[self.j]) % 256)
            #mod_bfr += chr((byte + 1) % 256)
            if byte > 255: print "AHHHH"
            #mod_bfr += chr(byte + 1)

            self.i += 1
            self.j = self.i % pword_len

        return mod_bfr
        