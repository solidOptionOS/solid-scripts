#!/bin/bash

echo "Entering Monitor Mode: "

echo "Select Wireless Interface: "
read INTERFACE

ifconfig $INTERFACE down
macchanger $INTERFACE -br
iw dev $INTERFACE set type monitor 
ifconfig $INTERFACE promisc
ifconfig $INTERFACE up
echo "Monitor Mode Enabled: "
