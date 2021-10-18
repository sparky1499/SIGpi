#!/bin/bash

###
### SIGpi
###
### config-direwolf
### 

echo -e "${SIG_BANNER_COLOR}"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_COLOR} #SIGPI#   configure Direwolf"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_RESET}"

###
### Config firewolf.conf located in $HOME
###

if [ !${1} ]; then
    echo "missing callsign"
    exit 0
fi

echo "ax0 ${1} 1200 255 7 APRRS/Packet" | sudo tee -a /etc/ax25/axports

sed -i "s/N0CALL/${1}/" "${HOME}/direwolf.conf"
sed -i 's/# ADEVICE  plughw:1,0/ADEVICE  plughw:2,0/' ${HOME}/direwolf.conf
sed -i '/#PTT\ \/dev\/ttyUSB0\ RTS/a #Uncomment line below for PTT with sabrent sound card\n#PTT RIG 2 localhost:4532' ${HOME}/direwolf.conf

echo -e "${SIG_BANNER_COLOR}"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_COLOR} #SIGPI#   Configuration Complete !!"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_RESET}"