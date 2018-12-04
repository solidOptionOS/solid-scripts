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

echo -e $BLUE"#################################################################"$ENDCOLOR; 
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"Let's setup your github config"$ENDCOLOR
sleep 1
echo -e $YELLOW"Enter your github username: "$ENDCOLOR;
read githubusername
echo -e $BLUE"Registering global user.name.."$ENDCOLOR;
sleep 0.2
git config --global user.name $githubusername
sleep 1
echo -e $YELLOW"Enter your github email address: "$ENDCOLOR;
read githubemailaddress
echo -e $BLUE"Registering global email.address.."$ENDCOLOR;
sleep 0.2
git config --global user.email $githubemailaddress
sleep 1
echo -e $BLUE"Select push.default {'simple' or 'matching'}"$ENDCOLOR;
read defaultpush
echo -e $YELLOW"Registering push.default $defaultpush."$ENDCOLOR;
sleep 0.2
git config --global push.default $defaultpush
sleep 1
echo -e $YELLOW"Checking for SSH keys"$ENDCOLOR;
ls -al ~/.ssh
## Lists the files in your .ssh directory, if they exist
sleep 1
echo -e $BLUE"Now we will generate a public/private rsa key pair"$ENDCOLOR;
sleep 0.2
ssh-keygen -t rsa -b 4096 -C "$githubemailaddress"
## Creates a new ssh key, using the email as a label
sleep 1 
echo -e $BLUE"Starting ssh-agent"$ENDCOLOR;
eval "$(ssh-agent -s)"
sleep 2
echo -e $BLUE"Adding new SSH key to the ssh-agent"$ENDCOLOR;
sleep 1
ssh-add ~/.ssh/id_rsa
sleep 1
echo cat ~/.ssh/id_rsa.pub
echo -e $YELLOW"Copying this key, and add it to https://github.com/settings/ssh as a new key. "$ENDCOLOR;
echo -e $YELLOW"When you have added the key, enter 'y' here"$ENDCOLOR;
read readytogo

if [[ $readytogo = y || $readytogo = Y ]] ; then

echo -e $BLUE"Okay, let's test the connection. "$ENDCOLOR;
sleep 2
ssh -vT git@github.com
sleep 1
fi
echo -e $BLUE"If you have authenticated, and the username in the message is yours,  then you have successfully set up your SSH Key!;"$ENDCOLOR;
echo -e $YELLOW"If you had any problems with your setup, we can try another route. "$ENDCOLOR;
echo -e $YELLOW"Did you have a problem? { y/n }"$ENDCOLOR;
read problemorsuccess

if [[ $problemorsuccess = y || $problemorsuccess = Y ]] ; then

echo -e $BLUE"That's ok.  Let's try a different method. Login to Github and create a personal access token via -> Profile -> Settings -> Personal Access tokens"$ENDCOLOR;
sleep 1
echo -e $YELLOW"Enter the token here: "$ENDCOLOR;
read privategithubtoken
echo -e $BLUE"Ok, got it. Let's import that token."$ENDCOLOR;
sleep 1
curl -u $githubusername:$privategithubtoken https://api.github.com/user
sleep 1
echo -e $YELLOW"SUCCESS! You are now setup and ready to start using git!"$ENDCOLOR;
exit
else

sleep 0.5
echo -e $YELLOW"SUCCESS! You are now setup and ready to start using git!"$ENDCOLOiR;
sleep 1
exit
fi

