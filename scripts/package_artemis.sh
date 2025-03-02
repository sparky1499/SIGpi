#!/bin/bash

###
### SIGpi
###
### package_artemis
###

###
### 20211208-1200  Currently default to install to keep script backward compatible
###

# REMOVE
if [ $1 = "remove" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Remove Artemis"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/artemis
	rm $HOME/Downloads/artemis.tar.gz
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   Artemis Removed"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# PURGE
if [ $1 = "purge" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Purge Artemis"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/artemis
	rm $HOME/Downloads/artemis.tar.gz
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   Artemis Purged"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# INSTALL
echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_COLOR} ##   Install Artemis"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_RESET}"

## DEPENDENCIES

## PACKAGE
cd $SIGPI_SOURCE 
if grep artemis "$SIGPI_CONFIG"; then
	if [ "$SIGPI_HWARCH" = "x86" ]; then
   		cd $HOME/Downloads
		# Note; this link specific to Ubuntu OS
		wget https://aresvalley.com/download/193/ 
		mv index.html artemis.tar.gz
		tar -zxvf artemis.tar.gz -C $SIGPI_SOURCE
		cd $SIGPI_SOURCE/artemis
		sudo cp artemis3.svg /usr/share/icons/
	fi
	
	if [ "$SIGPI_HWARCH" = "x86_64" ]; then
   		cd $HOME/Downloads
		# Note; this link specific to Ubuntu OS
		wget https://aresvalley.com/download/193/ 
		mv index.html artemis.tar.gz
		tar -zxvf artemis.tar.gz -C $SIGPI_SOURCE
		cd $SIGPI_SOURCE/artemis
		sudo cp artemis3.svg /usr/share/icons/
	fi
	
	if [ "$SIGPI_HWARCH" = "armhf" ]; then
		cd $HOME/Downloads
		# Note; this link specific to Raspberry Pi OS
		wget https://aresvalley.com/download/1045/ 
		mv index.html artemis.tar.gz
		tar -zxvf artemis.tar.gz -C $SIGPI_SOURCE
		cd $SIGPI_SOURCE/artemis
		sudo cp artemis3.svg /usr/share/icons/
	fi

	if [ "$SIGPI_HWARCH" = "aarch64" ]; then
		cd $HOME/Downloads
		# Note; this link specific to Raspberry Pi OS
		wget https://aresvalley.com/download/1045/ 
		mv index.html artemis.tar.gz
		tar -zxvf artemis.tar.gz -C $SIGPI_SOURCE
		cd $SIGPI_SOURCE/artemis
		sudo cp artemis3.svg /usr/share/icons/
	fi
fi

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##   Artemis Installed"
echo -e "${SIGPI_BANNER_RESET}"
