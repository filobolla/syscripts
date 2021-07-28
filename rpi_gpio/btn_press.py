#!/usr/bin/python3

from gpiozero import LED
from time import sleep

# Inizialize LED at GPIO23 (physical pin 14)
led=LED(23)

# Simulate button press for 10ms
led.on()
sleep(0.05)
led.off()
