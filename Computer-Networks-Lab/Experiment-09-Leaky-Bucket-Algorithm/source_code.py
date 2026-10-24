import time


def leaky_bucket(bucket_size, output_rate, incoming_packets):
    bucket = 0

    for i, packets in enumerate(incoming_packets, 1):
        print(f"\nTime {i}: Incoming packets = {packets}")

        # Add incoming packets
        if bucket + packets > bucket_size:
            dropped = (bucket + packets) - bucket_size
            bucket = bucket_size
        else:
            dropped = 0
            bucket += packets

        print(f"  Bucket state after arrival: {bucket} packets (Dropped: {dropped})")

        # Leak packets at constant rate
        sent = min(bucket, output_rate)
        bucket -= sent

        print(f"  Sent: {sent}, Remaining in bucket: {bucket}")


# Example usage
incoming = [4, 3, 8, 1, 2]  # packets arriving at each time unit
leaky_bucket(bucket_size=10, output_rate=3, incoming_packets=incoming)
