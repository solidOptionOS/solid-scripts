#!/bin/bash
clear:
# color vars
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
echo -e $YELLOW"Create a New Standard User"$ENDCOLOR;
 
if [ $USER != root ]; then
echo -e $RED"Sorry, you must run this from as root."$ENDCOLOR
echo -e $YELLOW"Exiting..."$ENDCOLOR
exit 0
fi
echo -e $YELLOW"Enter new username: "$ENDCOLOR
read NEWUSER
useradd -U $NEWUSER
sleep 1
echo -e $YELLOW"Enter password for $NEWUSER: "$ENDCOLOR
read PASS
usermod -p $PASS $NEWUSER
passwd $NEWUSER &
echo $PASS &
echo $PASS
echo -e $BLUE"Password updated. "$ENDCOLOR

sleep 1 
echo -e $BLUE"Adding user $NEWUSER to netdev, sudo, and adm groups"$ENDCOLOR
sleep 1
usermod -aG netdev $NEWUSER
usermod -aG sudo $NEWUSER
usermod -aG adm $NEWUSER
sleep 1
echo -e $BLUE"Changing user $NEWUSER default shell to /bin/bash"$ENDCOLOR
chsh -s /bin/bash $NEWUSER
sleep 1
echo ""
echo -e $RED"#########################################################"$ENDCOLOR
echo -e $BLUE"# Complete.  User $NEWUSER created with password $PASS. #"$ENDCOLOR
echo -e $RED"#########################################################"$ENDCOLOR
echo ""
echo -e $GREEN"Have A Solid Day"$ENDCOLOR
echo ""
exit
