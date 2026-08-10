def char_stuffing(data, flag='F', esc='E'):
    stuffed_data = flag
    for char in data:
        if char == flag or char == esc:
            stuffed_data += esc  # Escape the flag or escape character
        stuffed_data += char
    stuffed_data += flag
    return stuffed_data


def char_unstuffing(data, flag='F', esc='E'):
    unstuffed_data = ''
    i = 1  # Skip starting flag
    while i < len(data) - 1:  # Skip ending flag
        if data[i] == esc:
            i += 1  # Skip escape and take next character
        unstuffed_data += data[i]
        i += 1
    return unstuffed_data


# Example
data = "ABCFDEFG"
stuffed = char_stuffing(data)
unstuffed = char_unstuffing(stuffed)
print("\nOriginal Data: ", data)
print("Stuffed Data: ", stuffed)
print("Unstuffed Data: ", unstuffed)
