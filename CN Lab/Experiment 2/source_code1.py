def bit_stuffing(data):
    stuffed_data = ''
    count = 0
    for bit in data:
        if bit == '1':
            count += 1
            stuffed_data += bit
            if count == 5:
                stuffed_data += '0'  # Stuffing '0' after five 1s
                count = 0
        else:
            stuffed_data += bit
            count = 0
    return stuffed_data


def bit_unstuffing(data):
    unstuffed_data = ''
    count = 0
    i = 0
    while i < len(data):
        bit = data[i]
        unstuffed_data += bit
        if bit == '1':
            count += 1
            if count == 5:
                i += 1  # Skip stuffed 0
                count = 0
        else:
            count = 0
        i += 1
    return unstuffed_data


# Example
data = "11111011111101111"
stuffed = bit_stuffing(data)
unstuffed = bit_unstuffing(stuffed)
print("Original Data: ", data)
print("Stuffed Data: ", stuffed)
print("Unstuffed Data: ", unstuffed)
