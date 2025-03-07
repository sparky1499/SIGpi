#!/bin/bash

###
### SIGpi
###
### package_gnuradio39
###

###
### 20211208-1200  Currently default to install to keep script backward compatible
###

# REMOVE
if [ $1 = "remove" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Remove GNUradio 3.9"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"

    cd $SIGPI_SOURCE/gnuradio/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/gnuradio
    
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   GNUradio 3.9 Removed"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# PURGE
if [ $1 = "purge" ]; then
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_COLOR} ##   Purge GNUradio 3.9"
    echo -e "${SIGPI_BANNER_COLOR} ##"
    echo -e "${SIGPI_BANNER_RESET}"

    cd $SIGPI_SOURCE/gnuradio/build
    sudo make uninstall
    sudo ldconfig
    cd $SIGPI_SOURCE
	rm -rf $SIGPI_SOURCE/gnuradio
    rm -rf $HOME/.gnuradio
    sudo rm -rf $SIGPI_DESKTOP/gnuradio-grc.desktop
    sudo rm -rf $DESKTOP_FILES/gnuradio-grc.desktop
    
    echo -e "${SIGPI_BANNER_COLOR}"
    echo -e "${SIGPI_BANNER_COLOR} ##   GNUradio 3.9 Purged"
    echo -e "${SIGPI_BANNER_RESET}"
fi

# INSTALL
echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_COLOR} ##   Install GNUradio 3.9  (ETA: +60 Minutes)"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_RESET}"

## DEPENDENCIES
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y swig
sudo apt-get install -y libzmq3-dev
sudo apt-get install -y libfftw3-dev
sudo apt-get install -y libgsl-dev
sudo apt-get install -y libcppunit-dev
sudo apt-get install -y libcomedi-dev
sudo apt-get install -y libqt4-opengl-dev
sudo apt-get install -y libqwt-dev
sudo apt-get install -y libsdl1.2-dev
sudo apt-get install -y libusb-1.0-0-dev
sudo apt-get install -y libasound2-dev
sudo apt-get install -y portaudio19-dev
sudo apt-get install -y libportaudio2
sudo apt-get install -y pulseaudio
sudo apt-get install -y libjack-dev
sudo apt-get install -y libgmp-dev
sudo apt-get install -y libsdl1.2-dev
sudo apt-get install -y liblog4cpp5-dev
sudo apt-get install -y libqwt-qt5-dev
sudo apt-get install -y libqt5opengl5-dev
sudo apt-get install -y python3-numpy
sudo apt-get install -y python3-mako
sudo apt-get install -y python3-sphinx
sudo apt-get install -y python3-lxml
sudo apt-get install -y python3-pyqt5
sudo apt-get install -y python3-yaml
sudo apt-get install -y python3-click
sudo apt-get install -y python3-click-plugins
sudo apt-get install -y python3-zmq
sudo apt-get install -y python3-scipy
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-gi-cairo

## PACKAGE
cd $SIGPI_SOURCE
git clone https://github.com/gnuradio/gnuradio.git
cd gnuradio
git checkout maint-3.9
git submodule update --init --recursive
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make -j4
sudo make install
sudo ldconfig
cd ~
echo "export PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python3.6/dist-packages:$PYTHONPATH" >> .profile
echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> .profile

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##   GNUradio 3.9 Installed"
echo -e "${SIGPI_BANNER_RESET}"