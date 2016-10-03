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
echo -e $YELLOW"Remove and purge all old kernels, images, and headers? [ y | n ]"$ENDCOLOR;
read SOLIDERASE
if [[ $SOLIDERASE = Y || $SOLIDERASE = y ]] ; then
echo -e $YELLOW"Are you sure? This cannot be undone. [ y | n ]"$ENDCOLOR
read SOLIDCONFIRM
if [[ $SOLIDERASE = Y || $SOLIDERASE = y ]] ; then
echo -e $BLUE"Removing..."$ENDCOLOR;
sleep 1
sudo apt-get remove --purge $(dpkg -l 'linux-image-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d')
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $GREEN"Have A Solid Day"$ENDCOLOR
echo ""
exit
else
exit
fi
else
exit
fi
