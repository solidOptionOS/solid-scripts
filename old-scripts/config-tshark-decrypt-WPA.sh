#!/bin/bash
clear
#colors
dgrey="\033[0;34m"
port="\033[0;33m"
RED="\033[1;31m"
GREEN="\033[2;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

echo -e $BLUE"Decrypt WPA with Tshark "$ENDCOLOR;
sleep 0.5

echo -e $YELLOW".pcap File to Decrypt>: "$ENDCOLOR;
read INPUT
sleep 1

echo -e $YELLOW"Use option wlan or eth>: [ wlan | eth ] "$ENDCOLOR;
read INT 
sleep 1 

echo -e $BLUE"Initiating WPA Decryption of $INPUT "$ENDCOLOR;
sleep 2
tshark -nr $INPUT -o $INT.enable_decryption:TRUE -o "uat:80211_keys:\"wpa-pwd\",\"Passphrase:SSID\"" -Y "http"
