#!/bin/bash

echo "Target Specific AP: "

echo "Title this Attack Session: "
read AttackTITLE
echo "This following will be saved to /home/h3x/enslave/caps/dump-$AttackTITLE: "

echo "Select Wireless Interface to use with $AttackTITLE: "
read INTERFACE

echo "Select the Channel $AttackTITLE is on: "
read CHANNEL

echo "Enter $AttackTITLE BSSID: "
read TargetBSSID

echo "Enter $AttackTITLE ESSID: "
read TargetESSID

echo "Options (--showack -a -M -U --wps --band abg --ivs --output-format): "
read OPTIONS

echo "Dumping Target: "

sudo airodump-ng --bssid $TargetBSSID --essid $TargetESSID $OPTIONS -w /home/h3x/enslave/caps/dump-$AttackTITLE $INTERFACE -c $CHANNEL            
