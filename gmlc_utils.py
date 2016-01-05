# Splits a string around delimiters while keeping delimiters in list.
# Returns symbols with their original index
def line_to_symbols(string, delim_char_set):
    output = []
    token = ""
    token_idx = 0
    in_quotes = 0
    quote_started = False
    for i, char in enumerate(string):

        # Determine if in quote literal (including quotation marks)
        if char == '"' and in_quotes == 0:
            in_quotes = 2
            quote_started = True
        elif char == "'" and in_quotes == 0:
            in_quotes = 1
            quote_started = True
        else:
            quote_started = False

        # Parse
        if (char == ' ' or char == '\n') and in_quotes == 0:
            if token: output.append((token, token_idx))
            token = ""

        elif char in delim_char_set and in_quotes == 0:

            if token: output.append((token, token_idx))
            output.append((char, i))
            token = ""
            
        else:
            if not token: token_idx = i
            token += char

        if not quote_started:
            if char == '"' and in_quotes == 2: in_quotes = 0
            elif char == "'" and in_quotes == 1: in_quotes = 0

    if token: output.append((token, token_idx))
    return output

# Flattens a 2D list
def flatten(list2d):
    return [item for sublist in list2d for item in sublist]