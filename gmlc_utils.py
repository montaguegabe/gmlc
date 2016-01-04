# Splits a string around a character
def explode_keep(string, delim_char_set):
    output = []
    token = ""
    for char in string:

        if char in delim_char_set:

            if token: output.append(token)
            output.append(char)
            token = ""
            
        else:
            token += char

    if token: output.append(token)
    return output

# Flattens a 2D list
def flatten(list2d):
    return [item for sublist in list2d for item in sublist]