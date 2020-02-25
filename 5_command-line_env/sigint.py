#!/usr/bin/env python3

import signal, time

def handler(signum, time):
    print("\nI got a SIGINT, but I am not stopping")

# capture SIGINT
# signal.signal(signal.SIGINT, handler)

i = 0

while True:
    time.sleep(.1)
    print(f"\r{i}", end="")
    i += 1

