#!/bin/bash
echo "Initializing Monitor Mode: "
echo "Select Wireless Interface: "
read INTERFACE
ifconfig $INTERFACE down
macchanger $INTERFACE -bra
iw dev $INTERFACE set type monitor
ifconfig $INTERFACE promisc
ifconfig $INTERFACE up
echo "Monitor Mode ENABLED: "
iw $INTERFACE info
