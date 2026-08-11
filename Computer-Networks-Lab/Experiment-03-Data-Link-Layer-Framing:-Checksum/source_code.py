# Function to add two binary strings with carry
def binary_addition(a, b):
    max_len = max(len(a), len(b))
    a = a.zfill(max_len)
    b = b.zfill(max_len)
    result = ''
    carry = 0
    for i in range(max_len - 1, -1, -1):
        total = carry + int(a[i]) + int(b[i])
        result = str(total % 2) + result
        carry = total // 2
    if carry:
        result = '1' + result
        # If overflow occurs, add the overflow back (1's complement addition)
        if len(result) > max_len:
            result = binary_addition(result[1:], result[0])
    return result[-max_len:]  # Trim overflow


# Function to find 1's complement
def ones_complement(binary_str):
    return ''.join('1' if b == '0' else '0' for b in binary_str)


# Function to calculate checksum
def calculate_checksum(data_blocks):
    checksum = data_blocks[0]
    for block in data_blocks[1:]:
        checksum = binary_addition(checksum, block)
    checksum = ones_complement(checksum)
    return checksum


# Function to verify checksum
def verify_checksum(data_blocks, received_checksum):
    total = data_blocks[0]
    for block in data_blocks[1:]:
        total = binary_addition(total, block)
    total = binary_addition(total, received_checksum)
    return all(bit == '1' for bit in total)


# Main
if __name__ == "__main__":
    # Sender Side
    sender_data = ["11010101", "10101010", "11110000"]
    print("----------- SENDER SIDE -----------")
    print("Sender Data Blocks:")
    for block in sender_data:
        print(block)

    checksum = calculate_checksum(sender_data)
    print("Calculated Checksum:", checksum)

    # Receiver Side
    print("\n----------- RECEIVER SIDE -----------")
    print("Enter the received data blocks:")
    received_data = []
    for i in range(len(sender_data)):
        block = input(f"Enter Block {i+1}: ")
        received_data.append(block)

    received_checksum = input("Enter the received checksum: ")

    print("\nChecking...")
    if verify_checksum(received_data, received_checksum):
        print("Data received correctly. No Error Detected.")
    else:
        print("Error in Data Transmission Detected.")
