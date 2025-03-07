#!/bin/bash

###
### SIGPI
###
### package_direwolf
###

###
### 20211208-1200  Currently default to install to keep script backward compatible
###

# REMOVE
if [ $1 = "remove" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Remove DireWolf"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"
    cd $SIGPI_SOURCE/direwolf/build
    sudo make uninstall
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/DireWolf
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   DireWolf Removed"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# PURGE
if [ $1 = "purge" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Purge DireWolf"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"
    cd $SIGPI_SOURCE/direwolf/build
    sudo make uninstall
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/DireWolf
    sudo rm /usr/local/share/doc/direwolf/scripts/dw-start.sh 
    sudo rm /usr/local/bin/run_direwolf.sh
    sudo rm -rf /usr/local/share/doc/direwolf/conf/* 
    sudo rm -rf /usr/local/etc/direwolf
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   DireWolf Purged"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# INSTALL
echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_COLOR} ##   Install DireWolf"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_RESET}"

## DEPENDENCIES
sudo apt-get install -y libasound2-dev
sudo apt-get install -y libudev-dev
sudo apt-get install -y libgps-dev
sudo apt-get install -y libhamlib-dev

## PACKAGE
cd $SIGPI_SOURCE
git clone https://www.github.com/wb2osz/direwolf.git
cd direwolf
mkdir build && cd build
cmake .. 
make -j4
sudo make install

sudo cp /usr/local/share/doc/direwolf/scripts/dw-start.sh /usr/local/bin/run_direwolf.sh
sudo mkdir /usr/local/etc/direwolf
sudo cp /usr/local/share/doc/direwolf/conf/* /usr/local/etc/direwolf


echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##   DireWolf Installed"
echo -e "${SIGPI_BANNER_RESET}"