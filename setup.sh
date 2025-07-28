#!/bin/bash


# Patch your new instance
sudo apt-get update
sudo apt-get upgrade
sudo apt install libssl-dev unzip

echo "REBOOT ME"
#sudo reboot

# gets a specific version of node. This was written in March of 2022
#curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
# 1) This needs to be at least 16.x as of August 2023 and Foundry 11
# 2) This is deprecated by October 2023 (for a future date)

### https://github.com/nodesource/distributions
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=20
# Could be NODE_MAJOR=21 or 22. 20 was the original install probably

# this command is old and busted as of Ubuntu 24
#echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

curl -fsSL https://deb.nodesource.com/setup_${NODE_MAJOR}.x | sudo -E bash -

sudo apt install -y nodejs

##########
# This was all written before we added haproxy and lets encrypt
sudo apt install haproxy

###########

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

# This actually runs node fro mthe current directory
# node resources/app/main.js --dataPath=$HOME/foundrydata

# Setup the service
sudo cp foundry.service /etc/systemd/system/foundry.service
sudo systemctl daemon-reload
sudo systemctl enable foundry
sudo systemctl start foundry
