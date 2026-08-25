def xor(a, b):
    result = ''
    for i in range(1, len(b)):
        result += '0' if a[i] == b[i] else '1'
    return result


# Perform Modulo-2 Division
def mod2div(dividend, divisor):
    pick = len(divisor)
    tmp = dividend[0:pick]

    while pick < len(dividend):
        if tmp[0] == '1':
            tmp = xor(divisor, tmp) + dividend[pick]
        else:
            tmp = xor('0' * pick, tmp) + dividend[pick]
        pick += 1

    # Final XOR step
    if tmp[0] == '1':
        tmp = xor(divisor, tmp)
    else:
        tmp = xor('0' * pick, tmp)

    return tmp


# Sender-side: Encode data with CRC
def encodeData(data, key):
    l_key = len(key)

    # Append zeros to the data
    appended_data = data + '0' * (l_key - 1)

    # Calculate CRC remainder
    remainder = mod2div(appended_data, key)

    # Create transmitted codeword
    codeword = data + remainder
    return codeword, remainder


# Receiver-side: Check for error
def checkData(received_codeword, key):
    remainder = mod2div(received_codeword, key)
    if '1' in remainder:
        print("Error Detected")
    else:
        print("No Error Detected")


# Dynamic Input
data = input("Enter the data bits: ")
key = input("Enter the generator polynomial (key): ")

# Validate input
if not all(bit in '01' for bit in data):
    print("Invalid data! Enter only 0s and 1s.")
elif not all(bit in '01' for bit in key):
    print("Invalid key! Enter only 0s and 1s.")
else:
    # Sender side
    transmitted_codeword, crc = encodeData(data, key)
    print("\n--- Sender Side ---")
    print("Original Data: ", data)
    print("Generator Key: ", key)
    print("CRC Remainder: ", crc)
    print("Transmitted Code: ", transmitted_codeword)

    # Receiver side
    print("\n--- Receiver Side ---")
    received_codeword = input("Enter the received codeword: ")

    if not all(bit in '01' for bit in received_codeword):
        print("Invalid received codeword!")
    else:
        print("Received Codeword: ", received_codeword)
        checkData(received_codeword, key)
