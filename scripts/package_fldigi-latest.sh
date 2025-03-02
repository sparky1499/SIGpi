#!/bin/bash

###
### SIGpi
###
### package_fldigi-latest
###

###
### 20211208-1200  Currently default to install to keep script backward compatible
###

# REMOVE
if [ $1 = "remove" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Remove Fldigi"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"

    # FLxmlrpc    
    cd $SIGPI_SOURCE/flxmlrpc-0.1.4/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/flxmlrpc-0.1.4
    
    # Flrig
    cd $SIGPI_SOURCE/flrig-1.4.2/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/flrig-1.4.2

    # Fldigi
    cd $SIGPI_SOURCE/fldigi/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/fldigi
    
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   Fldigi Removed"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# PURGE
if [ $1 = "purge" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Purge Fldigi"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"

    # FLxmlrpc    
    cd $SIGPI_SOURCE/flxmlrpc-0.1.4/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/flxmlrpc-0.1.4
    
    # Flrig
    cd $SIGPI_SOURCE/flrig-1.4.2/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/flrig-1.4.2

    # Fldigi
    cd $SIGPI_SOURCE/fldigi/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/fldigi

    rm -rf $HOME/.fldigi
    sudo rm -rf $SIGPI_DESKTOP/fldigi.desktop
    sudo rm -rf $SIGPI_DESKTOP/flarq.desktop
    sudo rm -rf $DESKTOP_FILES/fldigi.desktop
    sudo rm -rf $DESKTOP_FILES/flarq.desktop

    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   Fldigi Purged"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# INSTALL
echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Install Fldigi Suite"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"

## DEPENDENCIES
sudo apt-get install -y libfltk1.3-dev
sudo apt-get install -y libjpeg9-dev
sudo apt-get install -y libxft-dev
sudo apt-get install -y libxinerama-dev
sudo apt-get install -y libxcursor-dev
sudo apt-get install -y libsndfile1-dev
sudo apt-get install -y libsamplerate0-dev
sudo apt-get install -y portaudio19-dev
sudo apt-get install -y libjpeg62-turbo-dev
sudo apt-get install -y libusb-1.0-0-dev
sudo apt-get install -y libpulse-dev
sudo apt-get install -y libudev-dev
sudo apt-get install -y texinfo

## PACKAGE

### Flxmlrpc
wget http://www.w1hkj.com/files/flxmlrpc/flxmlrpc-0.1.4.tar.gz -P $HOME/Downloads
tar -zxvf $HOME/Downloads/flxmlrpc-0.1.4.tar.gz -C $SIGPI_SOURCE
cd $SIGPI_SOURCE/flxmlrpc-0.1.4
./configure --prefix=/usr/local --enable-static
make
sudo make install
sudo ldconfig
	
### Flrig
wget http://www.w1hkj.com/files/flrig/flrig-1.4.2.tar.gz -P $HOME/Downloads
tar -zxvf $HOME/Downloads/flrig-1.4.2.tar.gz -C $SIGPI_SOURCE
cd $SIGPI_SOURCE/flrig-1.4.2
./configure --prefix=/usr/local --enable-static
make
sudo make install
sudo ldconfig
sudo cp $SIGPI_SOURCE/flrig-1.4.2/data/flrig.desktop $SIGPI_DESKTOP

### Fldigi
wget http://www.w1hkj.com/files/fldigi/fldigi-4.1.20.tar.gz -P $HOME/Downloads
tar -zxvf $HOME/Downloads/fldigi-4.1.20.tar.gz -C $SIGPI_SOURCE
cd $SIGPI_SOURCE/fldigi-4.1.20
./configure --prefix=/usr/local --enable-static
make
sudo make install
sudo ldconfig
sudo cp $SIGPI_SOURCE/fldigi-4.1.20/data/fldigi.desktop $SIGPI_DESKTOP
sudo cp $SIGPI_SOURCE/fldigi-4.1.20/data/flarq.desktop $SIGPI_DESKTOP


echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Installation Complete !!"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"