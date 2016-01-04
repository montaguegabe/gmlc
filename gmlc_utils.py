# Splits a string around delimiters while keeping delimiters in list.
# Returns symbols with their original index
def line_to_symbols(string, delim_char_set):
    output = []
    token = ""
    token_idx = 0
    for i, char in enumerate(string):

        if char == " " or char == "\n":
            if token: output.append((token, token_idx))
            token = ""

        elif char in delim_char_set:

            if token: output.append((token, token_idx))
            output.append((char, i))
            token = ""
            
        else:
            if not token: token_idx = i
            token += char

    if token: output.append((token, token_idx))
    return output

# Flattens a 2D list
def flatten(list2d):
    return [item for sublist in list2d for item in sublist]