def calculate_parity_bits(data_bits):
    # Length of the data bits
    m = len(data_bits)
    r = 0
    # Find the number of redundant bits needed (r)
    while (2 ** r) < (m + r + 1):
        r += 1

    # Total length of Hamming code n = m + r
    n = m + r

    # Initialize the code array with placeholders (indexing from 1)
    hamming_code = ['x'] * (n + 1)

    # Place data bits in their positions (non 2^i positions)
    j = 0
    for i in range(1, n + 1):
        if (i & (i - 1)) != 0:  # Not a power of 2
            hamming_code[i] = int(data_bits[j])
            j += 1

    # Calculate parity bits
    for i in range(r):
        parity_pos = 2 ** i
        parity = 0
        for k in range(1, n + 1):
            if k & parity_pos and k != parity_pos:
                if hamming_code[k] != 'x':
                    parity ^= hamming_code[k]
        hamming_code[parity_pos] = parity

    return hamming_code[1:]  # Remove the dummy 0-th index


def introduce_error(code, position):
    # Flip the bit at the given position to introduce an error
    if 1 <= position <= len(code):
        code[position - 1] ^= 1
    return code


def detect_error(received_code):
    n = len(received_code)
    r = 0
    while (2 ** r) < (n + 1):
        r += 1

    error_position = 0
    for i in range(r):
        parity_pos = 2 ** i
        parity = 0
        for k in range(1, n + 1):
            if k & parity_pos:
                parity ^= received_code[k - 1]
        if parity != 0:
            error_position += parity_pos

    return error_position


# --- MAIN PROGRAM ---
# Input binary data (e.g., '1011')
data = input("Enter data bits (e.g., 1011): ")

# Generate Hamming code
hamming = calculate_parity_bits(data)
print("Generated Hamming Code:", ''.join(map(str, hamming)))

# Introduce error at a position (optional)
error_pos = int(input("Enter position to introduce error (0 for none): "))
if error_pos != 0:
    hamming = introduce_error(hamming, error_pos)
    print("Hamming Code with error introduced:", ''.join(map(str, hamming)))

# Detect error
detected_pos = detect_error(hamming)
if detected_pos == 0:
    print("No error detected.")
else:
    print(f"Error detected at position: {detected_pos}")
