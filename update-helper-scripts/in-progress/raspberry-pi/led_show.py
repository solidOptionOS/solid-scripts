#!/usr/bin/env python3
# LED show

from time import sleep
import pifacedigitalio as pfio

pfio.init()
leds = [0, 1, 2, 3, 4, 5, 6, 7]
ledsR = [6, 5, 4, 3, 2, 1]
sleepTime = 0.2  # the time in seconds
rounds = 3

def catepillarWalk(times, interval):
   i = 0
   # repeat times times ...
   while i < times:
      # turn on LED 0 to 7 one at a time with interval intervals ...
      for led in leds:
         pfio.digital_write(led, 1)
         sleep(interval)
      
      # turn off LED 0 to 7 one at a time with interval intervals ...
      for led in leds:
         pfio.digital_write(led, 0)
         sleep(interval)
      
      i += 1

def pingpong(times, interval):
   i = 0
   # repeat times times ...
   while i < times:
      # flash LED 0 to 7 for interval intervals ...
      for led in leds:
         pfio.digital_write(led, 1)
         sleep(interval)
         pfio.digital_write(led, 0)
      
      # ... then flash LED 6 to 1 for interval intervals ...
      for led in ledsR:
         pfio.digital_write(led, 1)
         sleep(interval)
         pfio.digital_write(led, 0)
      
      i += 1
   
   # ... and flash LED 0 for an interval interval
   pfio.digital_write(0, 1)
   sleep(interval)
   pfio.digital_write(0, 0)

def evenOddAlternate(times, interval):
   i = 0
   # repeat times times ...
   while i < times:
      # flash the even numbered LEDs for an interval interval ...
      for led in leds:
         if not (led % 2):
            pfio.digital_write(led, 1)
      sleep(interval)
      for led in leds:
         if not (led % 2):
            pfio.digital_write(led, 0)
      # ... then flash the odd numbered LEDs for an interval interval
      for led in leds:
         if led % 2:
            pfio.digital_write(led, 1)
      sleep(interval)
      for led in leds:
         if led % 2:
            pfio.digital_write(led, 0)
      i += 1

catepillarWalk(rounds, sleepTime)
pingpong(rounds, sleepTime)
evenOddAlternate(rounds, sleepTime)

print("Meny:")
print("=====")
print("Button 0: Catepillar walk LED show.")
print("Button 1: Pingpong LED show.")
print("Button 2: Even-Odd alternating LED show.")
print("Button 3: Exit the program.")
print()
print("Please press one of the buttons to continue.")

while True:
   if pfio.digital_read(0):
      catepillarWalk(1, sleepTime)
   elif pfio.digital_read(1):
      pingpong(1, sleepTime)
   elif pfio.digital_read(2):
      evenOddAlternate(1, sleepTime)
   elif pfio.digital_read(3):
      break

