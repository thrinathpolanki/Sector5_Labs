import random
import time

# Constants
TOTAL_FRAMES = 10
WINDOW_SIZE = 4
LOSS_PROBABILITY = 0.3
DELAY = 0.8  # Time delay for demonstration

# Status arrays
sender_window = [False] * TOTAL_FRAMES     # True means ACK received
receiver_window = [None] * TOTAL_FRAMES    # None means not yet received


def selective_repeat_protocol():
    base = 0
    print("=== Selective Repeat Sliding Window Protocol ===\n")

    while base < TOTAL_FRAMES:
        end = min(base + WINDOW_SIZE, TOTAL_FRAMES)
        print(f"Sender Window: [{base} to {end - 1}]")

        # Send all frames in the window
        for i in range(base, end):
            if not sender_window[i]:
                print(f"Sending Frame {i}...", end=' ')
                if random.random() > LOSS_PROBABILITY:
                    receiver_window[i] = f"Frame {i} received"
                    print("Delivered.")
                else:
                    print("Lost.")

        # Process ACKs
        for i in range(base, end):
            if receiver_window[i] is not None and not sender_window[i]:
                print(f"ACK received for Frame {i}")
                sender_window[i] = True
            elif receiver_window[i] is None:
                print(f"Waiting for ACK: Frame {i}")

        # Slide the window
        while base < TOTAL_FRAMES and sender_window[base]:
            base += 1

        print("-" * 40)
        time.sleep(DELAY)

    print("\nAll frames successfully transmitted and acknowledged.")


# Run the simulation
selective_repeat_protocol()
