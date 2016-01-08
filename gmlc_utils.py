# Splits a string around delimiters while keeping delimiters in list.
# Returns symbols with their original index, as well as whether a multiline comment is left
def line_to_symbols(string, delim_char_set, ml_comment):
    output = []
    token = ""
    token_idx = 0
    in_quotes = 0
    quote_started = False

    in_comment = ml_comment
    in_linecomment = False
    slash_before = False
    star_before = False

    for i, char in enumerate(string):

        # Determine if in quote literal (including quotation marks)
        if not in_comment and not in_linecomment:
            if char == '"' and in_quotes == 0:
                in_quotes = 2
                quote_started = True
            elif char == "'" and in_quotes == 0:
                in_quotes = 1
                quote_started = True
            else:
                quote_started = False

        # Enter comments if not in quotes
        slash_before_new = False
        star_before_new = False
        if in_quotes == 0:
            if char == '/':
                if slash_before:
                    in_linecomment = True
                    token = token[:-1]
                else: slash_before_new = True
            elif char == '*':
                if slash_before:
                    in_comment = True
                    token = token[:-1]
                else: star_before_new = True

        # Explode if not in comments or quotes
        should_explode = in_quotes == 0 and not in_comment and not in_linecomment
        if (char == ' ' or char == '\n' or char == '\r') and should_explode:
            if token: output.append((token, token_idx))
            token = ""

        elif char in delim_char_set and should_explode:

            if token: output.append((token, token_idx))
            output.append((char, i))
            token = ""

        # Pass on characters not in comments
        elif not in_comment and not in_linecomment:
            if not token: token_idx = i
            token += char

        # Escape from comments if not in quotes
        if in_quotes == 0 and char == '/':
            if star_before:
                in_comment = False
                slash_before_new = False

        # Escape from quotes
        if not quote_started and not in_comment and not in_linecomment:
            if char == '"' and in_quotes == 2: in_quotes = 0
            elif char == "'" and in_quotes == 1: in_quotes = 0

        slash_before = slash_before_new
        star_before = star_before_new

    if token: output.append((token, token_idx))
    return (output, in_comment)

# Flattens a 2D list
def flatten(list2d):
    return [item for sublist in list2d for item in sublist]

# Checks if a string is a number
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

# Cuts out a substring in a string at given index and replaces it
def replace_substr(string, index, substr, new_substr):
    precurs = string[:index]
    rest = string[index:]
    rest_new = rest.replace(substr, new_substr, 1)
    return precurs + rest_new