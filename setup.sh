#!/bin/bash


# Patch your new instance
sudo apt-get update
sudo apt-get upgrade
sudo apt install libssl-dev

echo "REBOOT ME"
#sudo reboot

# gets a specific version of node. This was written in March of 2022
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install -y nodejs

# When you buy your foundry license, you will be able to download a few types of files.
# This step refers to going to your foundry account and getting a temp URL to download that zip file
# You will need to place that URL in the quotes below
wget -O foundryvtt.zip "CLICK THE LOCK ON THE PAGE AND GET A TEMP URL"
mkdir foundryvtt
mkdir foundrydata
cd foundryvtt

#This is the file you w-got above
cp ../foundryvtt.zip .
unzip foundryvtt.zip 
sudo apt-get install unzip
unzip foundryvtt.zip

# This actually runs node fro mthe current directory
node resources/app/main.js --dataPath=$HOME/foundrydata
