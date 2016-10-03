#!/bin/bash
clear

## Colors
dgrey="\033[0;34m"
port="\033[0;33m"
RED="\033[1;31m"
GREEN="\033[2;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

## Date
### mm/dd/yyyy ####
now="$(date +'%d.%m.%Y')"

echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"# Created by kloption at SolidOptionOS. All rights reserved 2015 #"$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;
cd ~/
pwd
echo ""
sleep 0.5
echo -e $YELLOW"Checking for root access.. "$ENDCOLOR
sleep 0.5
if [ $USER != root ]; then
echo -e $RED"[RBENV]:Error: must be root"$ENDCOLOR
echo -e $BLUE"[RBENV]:Exiting..."$ENDCOLOR
exit 0
fi
sleep 1

echo -e $YELLOW"The SHELL is only the BEGINNING! "$ENDCOLOR
sleep 1
echo -e $YELLOW"Initiating Complete Ruby Environment, Metasploit-Framework, Omnibus, Postgres SQL Server, and Dependencies"$ENDCOLOR
sleep 2

echo -e $BLUE"Installing necessary packages.." $ENDCOLOR

sudo apt-get install --reinstall -y metasploit-framework build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev openjdk-7-jre git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev
sleep 1
echo -e $YELLOW"Installing Ruby Environment"$ENDCOLOR
sleep 0.5
cd ~/
sleep 1
mkdir ~/rbenv 
sleep 1
echo -e $BLUE"Cloning newest rbenv into ~/rbenv"$ENDCOLOR
sleep 1
git clone git://github.com/sstephenson/rbenv.git
sleep 1
cd rbenv
echo -e $BLUE"Updating PATH.."$ENDCOLOR
sleep 1
export PATH="$HOME/rbenv/bin:$PATH" >> ~/.bashrc

eval "$(rbenv init -)" >> ~/.bashrc

echo -e $BLUE"Cloning newest ruby-build into ~/rbenv/plugins/ruby-build"$ENDCOLOR
sleep 0.5
mkdir ~/rbenv/plugins
sleep 1
cd ~/rbenv/plugins

git clone git://github.com/sstephenson/ruby-build.git

sleep 1

cd ruby-build

export PATH="$HOME/rbenv/plugins/ruby-build/bin:$PATH" >> ~/.bashrc

echo -e $BLUE"Cloning newest rbenv-sudo into ~/rbenv/plugins/rbenv-sudo"$ENDCOLOR
sleep 1
cd ~/rbenv/plugins/
sleep 1
git clone git://github.com/dcarley/rbenv-sudo.git
sleep 1
#cd rbenv-sudo

echo -e $BLUE"Creating Global Bundler Environment"$ENDCOLOR
sleep 0.5
cd ~/rbenv
pwd
sleep 1
rbenv install 2.1.7
rbenv global 2.1.7
ruby -v
sleep 1

echo -e $YELLOW"SUCCESS! Ruby Environment Installed."$ENDCOLOR
sleep 2

echo -e $YELLOW"Installing NMAP"$ENDCOLOR
sleep 0.5

sudo mkdir ~/Development 
cd ~/Development

echo -e $BLUE"Updating Latest NMAP from svn.nmap.org/nmap"$ENDCOLOR
sleep 0.5
svn co https://svn.nmap.org/nmap

cd nmap

echo -e $BLUE"Configuring package"$ENDCOLOR
sleep 0.5
./configure
echo -e $BLUE"Building package"$ENDCOLOR
sleep 0.5
make
echo -e $BLUE"Installing package"$ENDCOLOR
sleep 0.5
sudo make install
make clean
echo -e $YELLOW"SUCCESS! NMAP Installation Complete"$ENDCOLOR
sleep 2

echo -e $YELLOW"Configuring Postgre SQL Server"$ENDCOLOR
sleep 0.5
#sudo -s
echo -e $BLUE"Restarting postgresql"$ENDCOLOR
sleep 0.5
sudo /etc/init.d/postgresql restart
sleep 1
echo -e $BLUE"Creating POSTGRES admin user 'msf'"$ENDCOLOR
sleep 1
#echo -e $YELLOW"Enter new POSTGRES admin username: [default='msf'] "$ENDCOLOR
MSFUSER='msf'
echo "createuser -U postgres $MSFUSER -S -R -D -P" 
sleep 1
echo -e $BLUE"Appending appropriate groups to $MSFUSER"$ENDCOLOR
sleep 1
echo "usermod -aG sudo $MSFUSER"
sleep 0.5
echo "usermod -aG adm $MSFUSER"
sleep 0.5
echo "usermod -aG root $MSFUSER"
sleep 0.5
echo "usermod -aG postgres $MSFUSER"
sleep 1
echo -e $YELLOW"SUCCESS! $MSFUSER Created."$ENDCOLOR
sleep 1
echo -e $BLUE"Creating New Postgres database 'msf'"$ENDCOLOR
sleep 1
echo "createdb -U postgres -0 $MSFUSER msf"
sleep 1
echo -e $YELLOW"SUCCESS! New Postgres Database 'msf' created with administrative user $MSFUSER"$ENDCOLOR
sleep 1
echo -e $YELLOW"SUCCESS! Postgres SQL Server Configuration Complete"$ENDCOLOR
sleep 2

echo -e $YELLOW"Installing Metasploit-Framework"$ENDCOLOR
sleep 1
echo -e $BLUE"Installing necessary packages"$ENDCOLOR
sleep 0.5
sudo apt-get -y install --reinstall build-essential git ruby bundler ruby-dev bison flex autoconf automake
sleep 1
echo -e $BLUE"Setting up build directories you can write to"$ENDCOLOR
sleep 0.5
sudo mkdir -p /var/cache/omnibus
sudo mkdir -p /opt/metasploit-framework
sudo chown `whoami` /var/cache/omnibus
sudo chown `whoami` /opt/metasploit-framework
cd /opt
sleep 0.5

echo -e $BLUE"Cloning newest metasploit-framework into /opt/metasploit-framework"$ENDCOLOR
sleep 0.5
git clone https://github.com/rapid7/metasploit-framework.git
sleep 1
cd /opt/metasploit-framework

echo -e $BLUE"Installing gem bundler for msf console.."$ENDCOLOR
sleep 0.5
gem install bundler
bundle install
sleep 1
bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'
sleep 1
echo -e $YELLOW"SUCCESS! Metasploit Framework Installation Complete"$ENDCOLOR
sleep 2

echo -e $YELLOW"Installing Metasploit-Omnibus"$ENDCOLOR
sleep 1
echo -e $BLUE"Cloning newest metasploit-omnibus builder"$ENDCOLOR
sleep 0.5
cd /opt/metasploit-framework
git clone https://github.com/rapid7/metasploit-omnibus.git
sleep 1
cd metasploit-omnibus
echo -e $BLUE"Installing omnibus' dependencies"$ENDCOLOR
sleep 0.5
bundle install --binstubs
sleep 1
echo -e $BLUE"Building the omnibus metasploit package"$ENDCOLOR
sleep 0.5
bin/omnibus build metasploit-framework
sleep 1
echo -e $YELLOW"SUCCESS! Omnibus Installation Complete"$ENDCOLOR
sleep 2

echo -e $YELLOW"Installing Armitage"$ENDCOLOR
sleep 1
curl -# -o /tmp/armitage.tgz http://www.fastandeasyhacking.com/download/armitage-latest.tgz
sudo tar -xvzf /tmp/armitage.tgz -C /opt
sudo ln -s /opt/armitage/armitage /usr/local/bin/armitage
sudo ln -s /opt/armitage/teamserver /usr/local/bin/teamserver
sudo sh -c "echo java -jar /opt/armitage/armitage.jar \$\* > /opt/armitage/armitage"
sudo perl -pi -e 's/armitage.jar/\/opt\/armitage\/armitage.jar/g' /opt/armitage/teamserver
sleep 1
echo -e $YELLOW"SUCCESS! Armitage Installation Complete"$ENDCOLOR
sleep 2
echo -e $YELLOW"Creating YAML Configuration"$ENDCOLOR
sleep 0.5
# msf database.yml config 

msfdatabaseconfig='production:
adapter: postgresql
database: msf
username: msf
password: toor
host: 127.0.0.1
port: 5432
pool: 75
timeout: 5'

#sudo touch /opt/metasploit-framework/config/database.yml

echo $msfdatabaseconfig >> /opt/metasploit-framework/config/database.yml

echo -e $BLUE"Exporting MSF Database Config to $USER profile"$ENDCOLOR 
sleep 0.5
sudo sh -c "echo export MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml >> /etc/profile"
sleep 1
echo -e $BLUE"Sourcing profile and .bashrc"$ENDCOLOR
sleep 1
source /etc/profile
sleep 1
source ~/.bashrc
sleep 1
echo -e $YELLOW"SUCCESS! Installation is complete."$ENDCOLOR
sleep 1 
echo -e $YELLOW"Ruby Environment, Metasploit-Framework, Omnibus, and Postgres SQL Server is setup and ready to go."$ENDCOLOR
sleep 1 
echo -e $YELLOW"Use 'msfconsole' to initiate the Metasploit-Framework Console.  ENJOY"$ENDCOLOR
sleep 0.5
echo -e $BLUE"###############################################"$ENDCOLOR;
echo -e $YELLOW"#              Operation complete.            #"$ENDCOLOR;
echo -e $BLUE"###############################################"$ENDCOLOR;
echo -e $YELLOW"Have A Solid Day "$ENDCOLOR;
sleep 1
echo -e $YELLOW"Start now?: [y/n]"$ENDCOLOR
read startmsfconsole

if [[ $startmsfconsole = Y || $startmsfconsole = y ]] ; then
echo -e $YELLOW"Initializing MSF CONSOLE"$ENDCOLOR
sleep 1
msfconsole

else
exit 0
fi
