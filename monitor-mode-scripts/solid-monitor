#!/bin/bash
clear
#Colors

dgrey="\033[0;34m"
port="\033[0;33m"
RED="\033[1;31m"
GREEN="\033[2;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

echo -e $RED"#################################################################"$ENDCOLOR; 
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $RED"#################################################################"$ENDCOLOR;
echo -e $YELLOW"Initiate Monitor Mode"$ENDCOLOR;

echo -e $BLUE"Initiating Monitor Mode... "$ENDCOLOR;
sleep 2

echo -e $YELLOW"Select Interface: "$ENDCOLOR;
read INTERFACE
sleep 1
echo -e $BLUE"[ifconfig]Taking down $INTERFACE "$ENDCOLOR;
sudo ifconfig $INTERFACE down
sleep 1
echo -e $BLUE"[macchanger]Changing MAC Address "$ENDCOLOR;
sudo macchanger $INTERFACE -bra
sleep 1
echo -e $BLUE"[iw]Setting $INTERFACE to monitor mode "$ENDCOLOR;
sudo iw dev $INTERFACE set type monitor
#ifconfig $INTERFACE arp multicast allmulti promisc mtu 1492 0.0.0.0 0.0.0.0 && dhclient
sleep 1
echo -e $BLUE"[ifconfig]Setting $INTERFACE to promisc mode "$ENDCOLOR;
sudo ifconfig $INTERFACE promisc
sleep 1
echo -e $BLUE"ifconfig]Raising $INTERFACE back up "$ENDCOLOR;
sudo ifconfig $INTERFACE up
sleep 1
echo -e $BLUE"[iw]Info for $INTERFACE: "$ENDCOLOR;
sudo iw $INTERFACE info
sleep 1
echo -e $YELLOW"$INTERFACE successfully set to monitor mode. "$ENDCOLOR;
echo ""
echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $GREEN"Have A Solid Day"$ENDCOLOR
echo ""
exit
