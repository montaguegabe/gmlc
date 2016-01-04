import ast

CHAR_SYMBOLS = frozenset([
    ':',
    '{',
    '}',
    '(',
    ')',
    ','
])

KEYWORDS = frozenset([
    'object',
    'event',
    'import',
    'properties',
    'room'
])

SYMBOLS = CHAR_SYMBOLS.union(KEYWORDS)

# A context class represents a general scope of expectation
class CtxType:
    OBJ_DEC = 1
    RM_DEC = 2
    PROP = 3
    IMPORT = 4
    EVENT = 5

class Ctx(object):
    def __init__(self, typ, stage=0):
        super(Ctx, self).__init__()
        self.typ = typ
        self.stage = stage

    def advance(self):
        self.stage += 1

    def label(self):
        if self.typ == CtxType.OBJ_DEC:
            return "object declaration"
        elif self.typ == CtxType.RM_DEC:
            return "room declaration"
        elif self.typ == CtxType.PROP:
            return "resource property dict parsing"
        elif self.typ == CtxType.IMPORT:
            return "import event block"
        elif self.typ == CtxType.EVENT:
            return "event declaration"
        return ""

# The compiler is fed symbols and transpiles
class Compiler(object):

    def __init__(self):
        super(Compiler, self).__init__()

        self.has_out = False

        # The stack of contexts the the cursor has moved into
        self.context_stack = []

        # Whether the last output was import block
        self.last_out_import = False

        # Object names
        self.obj_names = set()

        # The running data block
        self.datablock = ""

        # The indendation level of the data block
        self.indent_level = 0

    # Helper to add to data block
    def datablock_add(self, symbol):
        self.datablock += symbol + " "

    def feed(self, symbol):

        returned_output = ""
        warnings = []
        errors = []

        # Helper function for appending output. Will dynamically prefix with a @import_evt line
        def output(returned_output, string, is_import=False):

            mod_string = None
            if is_import and not self.last_out_import:
                mod_string = "@import_evt\n" + string
            elif not is_import and self.last_out_import:
                mod_string = "@endimport\n" + string
            else:
                mod_string = string

            returned_output += mod_string
            self.last_out_import = is_import
            return returned_output

        # Get context information
        ctx = self.context_stack[-1] if self.context_stack else None

        #print "S, C, I:", symbol, str(ctx.typ) + "s" + str(ctx.stage) if ctx else None, self.indent_level

        # Parse global symbols
        if not ctx:
            if symbol == 'object':
                self.context_stack.append(Ctx(CtxType.OBJ_DEC))
            elif symbol == 'room':
                self.context_stack.append(Ctx(CtxType.RM_DEC))

            # Error cases
            else:
                erstr = "Unexpected symbol '" + symbol + "'."
                if symbol in KEYWORDS:
                    erstr += " Keywords of this type belong in resource declarations."
                errors.append(erstr)

        # Parse object declaration symbols
        elif ctx.typ == CtxType.OBJ_DEC:

            # Name of object
            if ctx.stage == 0:
                errors.extend(validate_varname(symbol, ctx))
                returned_output = output(returned_output, "@obj_declare " + symbol + "\n")
                self.obj_names.add(symbol)
                ctx.advance()

            # Symbol following object name
            elif ctx.stage == 1:
                errors.extend(validate_symbol(symbol, ctx, [':', '{']))
                if symbol == ':':
                    ctx.advance()
                else:
                    ctx.stage = 4

            # Name of parent
            elif ctx.stage == 2:
                errors.extend(validate_varname(symbol, ctx))
                if symbol not in self.obj_names:
                    errors.append("No declared object matches name '" + symbol + "'.")
                returned_output = output(returned_output, "object_set_parent(global.__itp_res," + symbol + ");", True)
                ctx.advance()

            elif ctx.stage == 3:
                errors.extend(validate_symbol(symbol, ctx, ['{']))
                ctx.advance()

            # Look for nested declarations
            elif ctx.stage == 4:
                errors.extend(validate_symbol(symbol, ctx, ['}', 'event', 'properties', 'import']))
                if symbol == '}':
                    self.context_stack.pop()
                elif symbol == 'event':
                    self.context_stack.append(Ctx(CtxType.EVENT))
                elif symbol == 'properties':
                    self.context_stack.append(Ctx(CtxType.PROP))
                elif symbol == 'import':
                    self.context_stack.append(Ctx(CtxType.IMPORT))

            else:
                print ctx.stage
                raise NotImplementedError()

        # Parse room declaration symbols
        elif ctx.typ == CtxType.RM_DEC:

            # Name of room
            if ctx.stage == 0:
                errors.extend(validate_varname(symbol, ctx))
                returned_output = output(returned_output, "@rm_declare " + symbol + "\n")
                ctx.advance()

            # Curly following room name
            elif ctx.stage == 1:
                errors.extend(validate_symbol(symbol, ctx, ['{']))
                ctx.advance()

            # Look for nested declarations OR list of objects
            elif ctx.stage == 2:

                # Check if symbol is object
                if symbol in self.obj_names:
                    returned_output = output(returned_output, symbol + "\n")
                    ctx.advance()

                # Check nested declarations
                elif symbol == '}':
                    self.context_stack.pop()
                elif symbol == 'properties':
                    self.context_stack.append(Ctx(CtxType.PROP))
                elif symbol == 'import':
                    self.context_stack.append(Ctx(CtxType.IMPORT))

                # Error cases
                else:
                    if valid_varname(symbol):
                        errors.append("Unknown object in room declaration: '" + symbol + "'.")
                    else:
                        errors.append("Unexpected symbol in room declaration: '" + symbol + "'.")

            elif ctx.stage == 3:

                # Check if symbol is object
                if symbol in self.obj_names:
                    errors.append("Object names must be separated by commas")

                # Check nested declarations
                elif symbol == '}':
                    self.context_stack.pop()
                elif symbol == 'properties':
                    self.context_stack.append(Ctx(CtxType.PROP))
                elif symbol == 'import':
                    self.context_stack.append(Ctx(CtxType.IMPORT))
                elif symbol == ',':
                    ctx.advance()

                # Error cases
                else:
                    errors.append("Unexpected symbol in room declaration: '" + symbol + "'.")

            # Following a comma
            elif ctx.stage == 4:

                # Only GML object can follow commas
                if symbol in self.obj_names:
                    returned_output = output(returned_output, symbol + "\n")
                    ctx.stage = 3
                else:
                    errors.append("Expecting object name after ',' but instead found '" + symbol + "'.")

            else:
                raise NotImplementedError()

        # Parse property symbols
        elif ctx.typ == CtxType.PROP:
            if ctx.stage == 0:
                errors.extend(validate_symbol(symbol, ctx, ['{']))
                self.datablock = ""
                ctx.advance()

            # Add data to block
            elif ctx.stage == 1:
                if symbol == '}':

                    # Output parsed data
                    prefix = "object" if self.context_stack[-2].typ == OBJ_DEC else "room"
                    import_block = parse_properties(self.datablock, prefix) + "\n"
                    if import_block != None:
                        returned_output = output(returned_output, import_block, True)
                    else:
                        errors.append("Syntax error while parsing properties.")
                    self.context_stack.pop()
                else:
                    self.datablock_add(symbol)
            
        # Parse import symbols
        elif ctx.typ == CtxType.IMPORT:
            if ctx.stage == 0:
                errors.extend(validate_symbol(symbol, ctx, ['{']))
                self.datablock = ""
                self.indent_level = 0
                ctx.advance()

            # Add data to block
            elif ctx.stage == 1:
                if symbol == '}' and self.indent_level == 0:
                    returned_output = output(returned_output, self.datablock + "\n", True)
                    self.context_stack.pop()

                else:
                    if symbol == '{': self.indent_level += 1
                    elif symbol == '}': self.indent_level -= 1
                    self.datablock_add(symbol)
            
        # Parse event symbols
        elif ctx.typ == CtxType.EVENT:
            raise NotImplementedError()

        else:
            raise NotImplementedError("Not all context types implemented in compiler")
            

        # Prefix with initial if first time outputting
        if not self.has_out:
            returned_output = "@gml\n" + returned_output
            self.has_out = True

        return (returned_output, warnings, errors)

    # Get lingering errors, warnings, compilation blocks
    def feed_final(self):

        errors = []
        warnings = []

        if self.indent_level != 0:
            errors.append("Curly brace mismatch. Expecting '}'.");
        if self.context_stack:
            errors.append("Source file ended in middle of " + self.context_stack[-1].label() + ".")
        return ("@end\n", warnings, errors)

# Checks valid GML variable name errors
def valid_varname(name):
    valid = True
    if (not name[0].isalpha()) and name[0] != '_': valid = False
    for char in name[1:]:
        if (not char.isalnum()) and char != '_': valid = False
    return valid

def validate_varname(name, ctx):

    if not valid_varname(name):
        erstr = "Invalid resource name in " + ctx.label() + "."
        erstr += " Name '" + name + "' is not a valid GML name."
        return [erstr]
    return []

# Checks that the symbol matches one of the expectations in the provided list
def validate_symbol(symbol, ctx, expectations):
    if symbol not in expectations:
        erstr = "Unexpected symbol '" + symbol + "' in " + ctx.label() + "."
        erstr += " Expected '" + "' or '".join(expectations) + "'."
        return [erstr]
    return []

# Parses a property data block into import statements. Prefix is "room" or "object"
def parse_properties(datablock, prefix):

    evalstr = "{" + datablock + "}"
    prop_dict = None
    try:
        prop_dict = ast.literal_eval(evalstr)
    except SyntaxError:
        return None

    importstr = ""
    for key, value in prop_dict.iteritems():
        isstring = isinstance(value, basestring)
        mod_value = '"' + value + '"' if isstring else value
        importstr += " " + prefix + "_set_" + key + "(global.__itp_res," + mod_value + ");"

    return importstr