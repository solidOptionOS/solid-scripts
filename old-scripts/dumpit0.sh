#!/bin/bash

echo "wlan0 selected: Let's fuck shit up!: "

echo "Title This Session: "
read TITLE

echo "This session will be saved at /home/h3x/enslave/caps/$TITLE: "

echo "Select Channel(s) - Separate Channels with ','s : "
read CHANNEL

echo "Options (--showack -a -M -U -h --band abg --wps --ivs --output-format: "
read OPTIONS

echo "Specifiy Encryption (--encrypt[wpa wpa2 wep..]): "
read ENCRYPT

echo "Dumping $TITLE: "

sudo airodump-ng wlan0 -c $CHANNEL $OPTIONS -w /home/h3x/enslave/caps/$TITLE $ENCRYPT
