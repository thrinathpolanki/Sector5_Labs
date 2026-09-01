import random
import time

# Configuration parameters
TOTAL_FRAMES = 10       # Total frames to send
WINDOW_SIZE = 4         # Sender's window size
LOSS_PROBABILITY = 0.2  # Probability of ACK loss


def send_frame(frame_num):
    print(f"Sender: Sending Frame {frame_num}")
    time.sleep(0.2)  # Simulate delay


def receive_ack(frame_num):
    if random.random() < LOSS_PROBABILITY:
        print(f"Receiver: ACK {frame_num} lost!")
        return False
    else:
        print(f"Receiver: ACK {frame_num} received")
        return True


def go_back_n():
    base = 0
    next_seq = 0

    while base < TOTAL_FRAMES:
        # Send all frames in current window
        while next_seq < base + WINDOW_SIZE and next_seq < TOTAL_FRAMES:
            send_frame(next_seq)
            next_seq += 1

        # Wait for ACKs
        i = base
        while i < next_seq:
            print(f"Sender: Waiting for ACK {i}...")
            ack = receive_ack(i)
            if ack:
                base += 1
                i += 1
            else:
                print(f"Sender: Timeout! Resending from Frame {i}")
                next_seq = base  # Go back and resend
                break

        print(f"Window: Base = {base}, Next Seq = {next_seq}")
        print("-" * 40)


if __name__ == "__main__":
    go_back_n()
