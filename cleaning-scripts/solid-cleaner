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
echo -e $YELLOW"SolidOptionOS Cleaner"$ENDCOLOR;
echo -e $RED"#################################################################"$ENDCOLOR; 
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $BLUE"Thanks and credit to the team at blackhatsec.org/"$ENDCOLOR; 
echo -e $BLUE"for creating CBS Cleaner - the basis for this script"$ENDCOLOR;
echo -e $BLUE"This modificatin of CBS Cleaner by h3x at solidoptionos.com"$ENDCOLOR;
echo -e $RED"#################################################################"$ENDCOLOR;
echo ""
echo -e $BLUE"Checking for root..."$ENDCOLOR;
sleep 0.5
if [ $USER != root ]; then
echo -e $RED"Sorry, you must run this from as root."$ENDCOLOR
echo -e $YELLOW"Exiting..."$ENDCOLOR
exit 0
fi
echo -e $BLUE"Installing festival first..."$ENDCOLOR;
sleep 1
apt-get install festival -y
echo ""
echo -e $BLUE"Ok. Let's clean."$ENDCOLOR;
echo ""
echo Starting Cleaning Function | festival --tts 
echo ""
echo -e $BLUE"Cleaning var/temp..."$ENDCOLOR;
sleep 0.5
cd /var/tmp/
sleep 0.5
rm -i /var/tmp/* --force
sleep 0.5
echo -e $YELLOW"Would you like to attempt to repair/fix any broken packages? y/n"$ENDCOLOR;
read fix
if [[ $fix = Y || $fix = y ]] ; then
for package in $(apt-get upgrade 2>&1 | grep "warning: files list file" | sed "s/.*'//; s/://"); do apt-get install --reinstall "$package"; done
echo  "Done !"
else
echo -e $BLUE"Ok,maybe later!"$ENDCOLOR
echo""
fi
echo ""
echo ""
echo -e $BLUE"Cleaning /var/log/..."$ENDCOLOR
rm -i -v /var/log/* --force
rm -i -v /var/cache/* --force

echo "" 
echo -e $BLUE"Cleaning /var/cache/..."$ENDCOLOR
rm -v /var/cache/apt/archives/*.deb  
sleep 0.5
rm -v /var/log/*.gz  -f
sleep 0.5
rm -rf ~/root/.local/share/Trash/*
sleep 0.5
echo -e $BLUE"Cleaning old kernels..."$ENDCOLOR
aptitude purge $OLDKERNELS
sleep 0.5
echo ""
echo -e $BLUE"Fixing broken packages..."$ENDCOLOR
apt-get check ; apt-get -f install
sleep 0.5
echo -e $BLUE"Cleaning trash archives..."$ENDCOLOR
sleep 0.5
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
sleep 0.5
rm -rf /root/.local/share/Trash/*/** &> /dev/null
sleep 0.5
echo -e $BLUE"[Aptitude]Cleaning..."$ENDCOLOR
aptitude clean
sleep 0.5
echo -e $BLUE"[Apt-Get]Removing obsolete packages and cleaning..."$ENDCOLOR
apt-get autoremove && apt-get autoclean && apt-get purge && apt-get clean
sleep 0.5
echo ""
echo ""
echo -e $BLUE"[Aptitude]:Cleaning leftover configs..."$ENDCOLOR 
aptitude purge $OLDCONF
dpkg -l | grep '^rc' | awk '{print $2}' | xargs dpkg --purge
sleep 0.5
echo ""
echo ""
echo -e $BLUE"[Aptitude]:Cleaning apt cache again..."$ENDCOLOR
aptitude clean
sleep 0.5
echo ""
echo ""
echo -e $BLUE"[Aptitude]:Removing old config files again..."$ENDCOLOR
aptitude purge $OLDCONF
sleep 0.5
apt-get autoremove
sleep 0.5
apt-get clean
sleep 0.5
echo -e $BLUE"Emptying  trashes..."$ENDCOLOR

echo ""
echo ""
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null
echo ""
echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $BLUE"#          Complete. System Clean             #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $YELLOW"Have A Solid Day"$ENDCOLOR;
echo ""
exit

fi
fi
 
done
sleep 3
exit
