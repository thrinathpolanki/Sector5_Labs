import random
import time

# Configuration Constants
TOTAL_FRAMES = 5
LOSS_PROBABILITY = 0.2
TIMEOUT_DELAY = 1.0


def send_frame(frame_number):
    print(f"Sender: Sending Frame {frame_number}...")
    time.sleep(0.5)

    # Simulate frame loss
    if random.random() < LOSS_PROBABILITY:
        print(f"Frame {frame_number} lost during transmission.\n")
        return False

    print(f"Receiver: Frame {frame_number} received.")
    time.sleep(0.5)

    # Simulate ACK loss
    if random.random() < LOSS_PROBABILITY:
        print(f"ACK for Frame {frame_number} lost during transmission.\n")
        return False

    print(f"Receiver: Sending ACK for Frame {frame_number}")
    time.sleep(0.5)
    print(f"Sender: ACK for Frame {frame_number} received.\n")
    return True


def stop_and_wait():
    print("=== Stop-and-Wait Protocol Simulation ===\n")
    frame_number = 0

    while frame_number < TOTAL_FRAMES:
        success = send_frame(frame_number)
        if success:
            frame_number += 1
        else:
            print(
                f"Sender: Timeout. Retransmitting "
                f"Frame {frame_number}...\n"
            )
            time.sleep(TIMEOUT_DELAY)

    print("All frames transmitted and acknowledged successfully.")


# Run the simulation
stop_and_wait()
