#!/bin/bash

###
### SIGpi
###
### package_hasviolet
###

###
### 20211208-1200  Currently default to install to keep script backward compatible
###

# REMOVE
if [ $1 = "remove" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Remove HASviolet"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"

    sudo rm -rf $SIGPI_SOURCE/hasviolet
    
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   GNUradio Removed"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# PURGE
if [ $1 = "purge" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Purge GNUradio"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"

    sudo rm -rf $SIGPI_SOURCE/hasviolet
    
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   GNUradio Purged"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# INSTALL
echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_COLOR} ##   Install HASviolet"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_RESET}"

## DEPENDENCIES
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-pil
sudo apt-get -y install libatlas-base-dev        # Numpy Dependency
sudo pip3 install tornado
sudo pip3 install RPI.GPIO
sudo pip3 install spidev
sudo pip3 install pynmea2
sudo pip3 install python-metar
sudo pip3 install adafruit-circuitpython-ssd1306
sudo pip3 install adafruit-circuitpython-framebuf
sudo pip3 install adafruit-circuitpython-rfm9x
sudo pip3 install numpy                          # pyLoraRFM9x dependency
sudo pip3 install pyLoraRFM9x
sudo pip3 install sparkfun-qwiic
sudo pip3 install sparkfun-qwiic-bme280
sudo pip3 install sparkfun-qwiic-vl53l1x

## PACKAGE
cd $SIGPI_SOURCE
git clone https://github.com/hudsonvalleydigitalnetwork/hasviolet.git
# Local (GitHub clone)
HASVIOLET_HOME=$SIGPI_SOURCE/hasviolet
# HASviolet JSON file
HASVIOLET_json=$HASVIOLET_HOME/cfg/hasVIOLET.json
# HASviolet SSL Cert and Key
HASVIOLET_ssl_key=$HASVIOLET_HOME/cfg/hasVIOLET.key
HASVIOLET_ssl_crt=$HASVIOLET_HOME/cfg/hasVIOLET.crt

echo " "
echo "### Generating self-signed SSL certificate --  /C=US/ST=New York/L=Hudson Valley/O=Hudson Valley Digital Network/OU=HASviolet/CN=hvdn.org"
echo " "
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -subj "/C=US/ST=New York/L=Hudson Valley/O=Hudson Valley Digital Network/OU=HASviolet/CN=hvdn.org" -keyout $HASVIOLET_HOME/HASVIOLET_api.key -out $HASVIOLET_HOME/HASVIOLET_api.crt
sudo chown pi:pi $HASVIOLET_HOME/HASVIOLET_api.key >/dev/null 2>&1
sudo chown pi:pi $HASVIOLET_HOME/HASVIOLET_api.crt >/dev/null 2>&1

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##   HASviolet Installed"
echo -e "${SIGPI_BANNER_RESET}"