import demjson
from gmlc_events import EVENTS, KEYS
from gmlc_utils import is_number

CHAR_SYMBOLS = frozenset([
    ':',
    '{',
    '}',
    '(',
    ')',
    ',',
    ';'
    """'=',
    '+',
    '-',
    '*',
    '/',
    '&',
    '|',
    '^',
    '<',
    '>',
    '!',
    '~',
    '.'"""
])

KEYWORDS = frozenset([
    'object',
    'event',
    'import',
    'properties',
    'room',
    'script'
])

KEYWORDS_SE = frozenset(['#define']).union(KEYWORDS)

# A context class represents a general scope of expectation
class CtxType:
    OBJ_DEC = 1
    RM_DEC = 2
    PROP = 3
    IMPORT = 4
    EVENT = 5
    SCR_DEC = 6
    SCR_DEC_GM = 7

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
        elif self.typ == CtxType.SCR_DEC:
            return "script declaration"
        elif self.typ == CtxType.SCR_DEC_GM:
            return "script declaration"
        return ""

# The compiler is fed symbols and transpiles
class Compiler(object):

    def __init__(self, allow_gmldef):
        super(Compiler, self).__init__()

        self.has_out = False

        # The stack of contexts the the cursor has moved into
        self.context_stack = []

        # Whether the last output was import block
        self.last_out_import = False

        # Resource names
        self.obj_names = set()
        self.rm_names = set()
        self.scr_names = set()

        self.allow_gmldef = allow_gmldef

        # Script argument list
        self.scr_args_current = None

        # The running code block
        self.codeblock = ""

        # The indendation level of the code block
        self.indent_level = 0

        # Previous code block symbol added
        self.prev_codeblock_symbols = [" "]

    # Helper to add to data block
    def codeblock_add(self, symbol):

        # Allow `var name = value`
        if len(self.prev_codeblock_symbols) >= 2:
            if symbol == '=' and self.prev_codeblock_symbols[1] == "var":
                symbol = ";" + self.prev_codeblock_symbols[0] + "="

        # Determine whether padding is necessary
        last_char = self.prev_codeblock_symbols[0][-1]
        ended_with_name = last_char.isalnum() or last_char == '_'
        starts_with_name = symbol[0].isalnum() or symbol[0] == '_'
        if last_char == ';' or last_char == '}' or last_char == '{': self.codeblock += "\n"
        if ended_with_name and starts_with_name: self.codeblock += " "

        self.codeblock += symbol
        self.prev_codeblock_symbols.insert(0, symbol);

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
            self.prev_codeblock_symbols = [" "]
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
            elif symbol == 'script':
                self.context_stack.append(Ctx(CtxType.SCR_DEC))
            elif symbol == '#define' and self.allow_gmldef:
                self.context_stack.append(Ctx(CtxType.SCR_DEC_GM))

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
                returned_output = output(returned_output, "object_set_parent(global.__itp_res," + symbol + ");\n", True)
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
                raise NotImplementedError()

        # Parse room declaration symbols
        elif ctx.typ == CtxType.RM_DEC:

            # Name of room
            if ctx.stage == 0:
                errors.extend(validate_varname(symbol, ctx))
                returned_output = output(returned_output, "@rm_declare " + symbol + "\n")
                self.rm_names.add(symbol)
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
                self.codeblock = ""
                ctx.advance()

            # Add data to block
            elif ctx.stage == 1:
                if symbol == '}':

                    # Output parsed data
                    prefix = "object" if self.context_stack[-2].typ == CtxType.OBJ_DEC else "room"
                    import_block = parse_properties(self.codeblock, prefix, errors)
                    if import_block != None:
                        returned_output = output(returned_output, import_block, True)
                    self.context_stack.pop()
                else:
                    self.codeblock_add(symbol)
            
        # Parse import symbols
        elif ctx.typ == CtxType.IMPORT:
            if ctx.stage == 0:
                errors.extend(validate_symbol(symbol, ctx, ['{']))
                self.codeblock = ""
                ctx.advance()

            # Add data to block
            elif ctx.stage == 1:
                if symbol == '}' and self.indent_level == 0:
                    returned_output = output(returned_output, self.codeblock + "\n", True)
                    self.context_stack.pop()

                else:
                    if symbol == '{': self.indent_level += 1
                    elif symbol == '}': self.indent_level -= 1
                    self.codeblock_add(symbol)
            
        # Parse event symbols
        elif ctx.typ == CtxType.EVENT:
            if ctx.stage == 0:

                # Prefix with ev_
                mod_symbol = symbol if symbol[:3] == "ev_" else "ev_" + symbol

                # Match with event names
                if mod_symbol not in EVENTS.keys():
                    errors.append("No valid event matches name: '" + mod_symbol + "'.")
                else:
                    returned_output = output(returned_output, "@obj_evt " + str(EVENTS[mod_symbol]))
                ctx.advance()

            elif ctx.stage == 1:
                errors.extend(validate_symbol(symbol, ctx, ['(']))
                ctx.advance()

            elif ctx.stage == 2:
                if is_number(symbol):
                    returned_output = output(returned_output, " " + symbol)
                else:
                    prefix = symbol[:3]
                    mod_symbol = symbol if prefix == "mb_" or prefix == "vk_" else "vk_" + symbol
                    if symbol == ')':
                        returned_output = output(returned_output, " 1\n")
                        ctx.stage = 4

                    # Look up in event keys
                    elif mod_symbol not in KEYS.keys():
                        errors.append("Unexpected event argument: '" + symbol + "'.")
                        ctx.advance()
                    else:
                        # Output the mapping
                        returned_output = output(returned_output, " " + str(KEYS[mod_symbol]) + "\n")
                        ctx.advance()

            elif ctx.stage == 3:
                errors.extend(validate_symbol(symbol, ctx, [')']))
                ctx.advance()

            elif ctx.stage == 4:
                errors.extend(validate_symbol(symbol, ctx, ['{']))
                self.codeblock = ""
                ctx.advance()

            # Add data to block
            elif ctx.stage == 5:
                if symbol == '}' and self.indent_level == 0:
                    returned_output = output(returned_output, self.codeblock + "\n")
                    self.context_stack.pop()

                else:
                    if symbol == '{': self.indent_level += 1
                    elif symbol == '}': self.indent_level -= 1
                    self.codeblock_add(symbol)

        # Parse script declaration symbols
        elif ctx.typ == CtxType.SCR_DEC:

            # Name of script
            if ctx.stage == 0:
                errors.extend(validate_varname(symbol, ctx))
                returned_output = output(returned_output, "@scr_declare " + symbol + "\n")
                self.scr_names.add(symbol)
                self.scr_args_current = []
                ctx.advance()

            # Opening parenthesis following script name
            elif ctx.stage == 1:
                errors.extend(validate_symbol(symbol, ctx, ['(']))
                ctx.advance()

            # Argument name or closing paren
            elif ctx.stage == 2:

                # Check if end of arguments
                if symbol == ")":
                    ctx.stage = 5
                else:
                    # Verify name
                    errors.extend(validate_varname(symbol, ctx))
                    self.scr_args_current.append(symbol)
                    ctx.advance()

            # Comma or end paren
            elif ctx.stage == 3:
                errors.extend(validate_symbol(symbol, ctx, [')', ',']))
                if symbol == ")":
                    ctx.stage = 5
                elif symbol == ",":
                    ctx.advance()

            # Argument name
            elif ctx.stage == 4:
                errors.extend(validate_varname(symbol, ctx))
                self.scr_args_current.append(symbol)
                ctx.stage = 3

            # Open curly
            elif ctx.stage == 5:
                errors.extend(validate_symbol(symbol, ctx, ['{']))
                self.codeblock = ""
                ctx.advance()

            # Actual code symbols
            elif ctx.stage == 6:
                if symbol == '}' and self.indent_level == 0:
                    returned_output = output(returned_output, self.codeblock + "\n")
                    self.context_stack.pop()

                else:
                    if symbol == '{': self.indent_level += 1
                    elif symbol == '}': self.indent_level -= 1
                    elif symbol in self.scr_args_current:
                        argnum = self.scr_args_current.index(symbol)
                        self.codeblock_add("argument" + str(argnum))
                    else:
                        self.codeblock_add(symbol)

        # Parse GML-style script declaration symbols
        elif ctx.typ == CtxType.SCR_DEC_GM:

            # Name of script
            if ctx.stage == 0:
                errors.extend(validate_varname(symbol, ctx))
                returned_output = output(returned_output, "@scr_declare " + symbol + "\n")
                self.scr_names.add(symbol)
                self.scr_args_current = []
                self.indent_level = 0
                self.codeblock = ""
                ctx.advance()

            # Actual code symbols
            elif ctx.stage == 1:
                if symbol in KEYWORDS_SE and self.indent_level == 0:
                    returned_output = output(returned_output, self.codeblock + "\n")
                    self.context_stack.pop()
                    self.feed(symbol) # Feed the symbol again in the new context

                else:
                    if symbol == '{': self.indent_level += 1
                    elif symbol == '}': self.indent_level -= 1
                    else:
                        self.codeblock_add(symbol)

        else:
            raise NotImplementedError("Not all context types implemented in compiler")
            

        # Prefix with initial if first time outputting
        if not self.has_out:
            returned_output = "\n@gml\n" + returned_output
            self.has_out = True

        return (returned_output, warnings, errors)

    # Get lingering errors, warnings, compilation blocks
    def feed_final(self):

        errors = []
        warnings = []
        returned_output = ""

        if self.indent_level != 0:
            errors.append("Curly brace mismatch. Expecting '}'.");
        if self.context_stack:

            if self.context_stack[-1].typ == CtxType.SCR_DEC_GM:
                self.last_out_import = False
                self.prev_codeblock_symbols = [" "]
                returned_output = self.codeblock + "\n"
                self.context_stack.pop()
            else:
                errors.append("Source file ended in middle of " + self.context_stack[-1].label() + ".")

        returned_output += "@end\n"

        return (returned_output, warnings, errors)

    # Gets resource names (scripts are not counted)
    def get_resource_names(self):
        return self.obj_names.union(self.rm_names)

    def get_script_names(self):
        return self.scr_names

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
        print map(lambda char: ord(char), name)
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
def parse_properties(codeblock, prefix, errors):

    evalstr = "{" + codeblock + "}"
    prop_dict = None
    try:
        prop_dict = demjson.decode(evalstr)
    except demjson.JSONDecodeError as err:
        errors.append("Error while parsing " + prefix + " properties: " + str(err) + ".")
        return None

    importstr = ""
    for key, value in prop_dict.iteritems():
        mod_value = None
        if isinstance(value, basestring):
            mod_value = '"' + value + '"'
        elif isinstance(value, bool):
            mod_value = "true" if value else "false"
        elif isinstance(value, (int, long, float)):
            mod_value = str(value)
        else:
            errors.append("Unrecognized value type set for property '" + key + "' of " + prefix + ". Only number, boolean, and string literals are permitted.")
            return None
        
        importstr += prefix + "_set_" + key + "(global.__itp_res," + mod_value + ");\n"

    return importstr