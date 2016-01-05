from gmlc_compiler import CHAR_SYMBOLS
from gmlc_utils import line_to_symbols

class SblTranslator(object):
    def __init__(self, resnames):
        super(SblTranslator, self).__init__()
        self.resnames = resnames
        self.directive = None

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

            should_translate = True
            if directive_line:
                # Preserve names
                if (self.directive == "@obj_declare" or self.directive == "@rm_declare") and sym_num == 1:
                    should_translate = False
            else:
                # Only translate blocks outside of directive lines
                if self.directive != "@import_evt" and self.directive != "@obj_evt":
                    should_translate = False

            if symbol in self.resnames and should_translate:

                # Replace occurance with modified version
                new_symbol = "global.__" + symbol
                precurs = bfr[:index]
                rest = bfr[index:]
                rest_new = rest.replace(symbol, new_symbol, 1)
                bfr = precurs + rest_new


        return bfr


        