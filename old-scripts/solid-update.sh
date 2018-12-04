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
echo -e $YELLOW"Solid-Update"$ENDCOLOR;
echo ""
echo -e $BLUE"Cleaning and purging first "$ENDCOLOR;
sleep 1
echo -e $BLUE"[apt-get autoremove]"$ENDCOLOR;
sleep 0.5
apt-get autoremove 
echo -e $BLUE"[apt-get clean]"$ENDCOLOR;
sleep 0.5
apt-get clean
echo ""
echo -e $BLUE"[rm -rm /var/cache/apt/archives] Purging cache"$ENDCOLOR;
sleep 0.5
rm -rf -i /var/cache/apt/archives/
sleep 0.5
echo ""
echo -e $BLUE"Updating Package Cache "$ENDCOLOR;
sleep 1
echo ""
echo -e $BLUE"[apt-get update]"$ENDCOLOR;
sleep 0.5
apt-get update
echo "" 
echo -e $BLUE"[aptitude update]"$ENDCOLOR;
sleep 0.5
aptitude update 
echo ""
echo -e $BLUE"Installing apt-file "$ENDCOLOR;
sleep 0.1
apt-get install apt-file -y
sleep 0.5
echo -e $BLUE"Updating apt-file "$ENDCOLOR;
echo -e $BLUE"This may take a while depending on your system "$ENDCOLOR;
sleep 1
apt-file update
echo ""
echo -e $BLUE"Upgrading packages "$ENDCOLOR;
sleep 1
echo ""
echo -e $BLUE"[apt-get upgrade]"$ENDCOLOR;
sleep 0.5
apt-get upgrade 
echo ""
echo -e $BLUE"[apt-get dist-upgrade]"$ENDCOLOR;
sleep 0.5
apt-get dist-upgrade 
echo ""
echo -e $BLUE"[aptitude upgrade]"$ENDCOLOR;
sleep 0.5
aptitude upgrade 
echo ""
echo -e $BLUE"[aptitude dist-upgrade]"$ENDCOLOR;
sleep 0.5
aptitude dist-upgrade
echo ""
echo -e $BLUE"Removing old packages "$ENDCOLOR;
sleep 1
echo ""
echo -e $BLUE"[apt-get autoremove]"$ENDCOLOR;
sleep 0.5
apt-get autoremove 
echo ""
echo -e $BLUE"[apt-get autoclean]"$ENDCOLOR;
sleep 0.5
apt-get autoclean
echo ""
echo -e $YELLOW"Would you like to try and repair any broken packages? {y/n} "$ENDCOLOR;
read fixornot

if [[ $fixornot = 'y' || $fixornot = 'Y' ]] ; then

echo -e $BLUE"Attempting to repair broken packages "$ENDCOLOR;
sleep 1
echo ""
echo -e $BLUE"[apt-get update --fix-missing]"$ENDCOLOR;
sleep 0.5
apt-get update --fix-missing
echo ""
echo -e $BLUE"[apt-get upgrade --fix-broken]"$ENDCOLOR;
sleep 0.5
apt-get upgrade --fix-broken -y
echo ""
echo -e $BLUE"[apt-get -f install]"$ENDCOLOR;
sleep 0.5
apt-get -f install 
echo ""
echo -e $BLUE"[aptitude -f install]"$ENDCOLOR;
sleep 0.5
aptitude -f install 
echo ""
echo -e $BLUE"[aptitude install --full-resolver]"$ENDCOLOR;
echo -e $BLUE"This may take awhile.."$ENDCOLOR;
sleep 0.5
aptitude install --full-resolver
echo ""
echo -e $BLUE"[dpkg --configure -a]"$ENDCOLOR;
sleep 0.5
dpkg --configure -a
echo ""

else 

echo -e $BLUE"Okay. Maybe later."$ENDCOLOR;
echo""
fi

echo -e $BLUE"Updating database, menus, airodump, initramfs, and grub "$ENDCOLOR;
sleep 1
echo ""
echo -e $BLUE"[updatedb]"$ENDCOLOR;
sleep 0.5
updatedb
echo ""
echo -e $BLUE"[update-menus]"$ENDCOLOR;
sleep 0.5
update-menus
echo ""
echo -e $BLUE"[airodump-ng-oui-update]"$ENDCOLOR;
sleep 0.5
airodump-ng-oui-update
echo ""
echo -e $BLUE"[update-initramfs -uv]"$ENDCOLOR;
sleep 0.5
update-initramfs -uv
echo ""
echo -e $BLUE"[update-grub]"$ENDCOLOR;
sleep 0.5
update-grub 
echo ""
echo -e $BLUE"[update-grub2]"$ENDCOLOR;
sleep 0.5
update-grub2
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#    Solid Update Complete.     #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
exit 
