#!/bin/bash

echo "Creating folders.."
sleep 1
echo ""
sudo mkdir -p /usr/local && sudo chown -R $(whoami):admin /usr/local 
echo ""
echo "Updating PATH.."
sleep 1
echo ""
PATH=:/usr/local/bin:/bin:/sbin:/system/bin:/system/sbin:/private/sbin:/private/bin:PATH
echo ""
echo "Running curl script.."
echo ""
sleep 1
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo ""
echo "Updating brew and installing ruby and jekyll.."
echo ""
brew update && brew install ruby && gem install jekyll
sleep 1
echo ""
echo "Complete."

