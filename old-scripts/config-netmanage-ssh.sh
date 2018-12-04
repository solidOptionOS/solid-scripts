#!/bin/bash
clear
echo "Updating Network Manager to allow managed interfaces "
sleep 1
#Create temporary file with new line in place
cat /etc/NetworkManager/NetworkManager.conf | sed -e "s/managed=false/managed=true/" > /tmp/NetworkManager.conf
#Copy the new file over the original file
mv /tmp/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
sleep 1
cat /etc/NetworkManager/NetworkManager.conf
sleep 1
echo "Clearing old ssh keys and reconfiguring openssh server "
sleep 0.5
mkdir /etc/ssh/oldie-keys
sleep 0.5
mv /etc/ssh/ssh_host_* /etc/ssh/oldie-keys

dpkg-reconfigure openssh-server
echo "Complete."
