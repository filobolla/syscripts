#!/usr/bin/python3

from gpiozero import LED
from time import sleep

# Inizialize LED at GPIO23 (physical pin 14)
led=LED(23)

# Simulate button press for 5s
led.on()
sleep(5)
led.off()
