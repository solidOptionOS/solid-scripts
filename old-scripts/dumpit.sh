#!/bin/bash

echo "Let's fuck shit up!: "

echo "Select Wireless Interface: "
read INTERFACE

echo "Select Channel: "
read CHANNEL

echo "Options: "
read OPTIONS

echo "Encrypt(prepend --encrypt): "
read ENCRYPT

echo "Save to: "
read SAVELOCATION

sudo airodump-ng $INTERFACE -c $CHANNEL $OPTIONS -w $SAVELOCATION $ENCRYPT
echo "enslavement initiated: "
