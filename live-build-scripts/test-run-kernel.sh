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
echo -e $YELLOW"Test run new kernel"$ENDCOLOR;
sleep 2
echo -e $YELLOW"Enter mapper path: [ex. '/dev/mapper/user1'] "$ENDCOLOR;
read MAPPERPATH
sleep 0.5
echo -e $YELLOW"Enter new kernel header name: [ex. 'vmlinuz-4.1.0-trunk-amd64'] "$ENDCOLOR;
read KERNELNAME
BOOT_IMAGE=/$KERNELNAME root=$MAPPERPATH ro initrd=/install/initrd.gz quiet
sleep 1
echo -e $GREEN"Boot image set."$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $GREEN"Have A Solid Day"$ENDCOLOR
echo ""
