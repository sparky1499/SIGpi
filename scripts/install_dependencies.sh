#!/bin/bash

###
### SIGpi
###
### installer_dependencies
###

# AX.25
echo -e "${SIG_BANNER_COLOR}"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_COLOR} #SIGPI#   Install Dependencies"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_RESET}"

sudo apt-get install -y git cmake build-essential autoconf automake g++ gcc gfortran libtool pkg-config bison flex ffmpeg pulseaudio swig subversion 
sudo apt-get install -y asciidoc asciidoctor doxygen graphviz gsfonts imagemagick imagemagick-6-common imagemagick-6.q16 intltool netpbm texinfo xsltproc

sudo apt-get install -y libjxr0 libjxr-tools liblqr-1-0 libmagickcore-6.q16-6 libmagickcore-6.q16-6-extra libmagickwand-6.q16-6 libwmf0.2-7 avahi-daemon

sudo apt-get install -y freeglut3-dev libusb-1.0-0-dev portaudio19-dev rtl-sdr libboost-all-dev zlib1g-dev

sudo apt-get install -y libusb-1.0-0-dev libad9361-dev libaio-dev libairspyhf-dev libao-dev libasound2-dev libavahi-client-dev libavahi-client-dev libavcodec-dev libavformat-dev libbluetooth-dev \
libboost-all-dev libcdk5-dev libcomedi-dev libconfig++-dev libcppunit-dev libcurl4-openssl-dev libfaad-dev libfftw3-dev libglew-dev libglfw3-dev libgmp-dev libgoocanvas-2.0-dev \
libgsl-dev libgsm1-dev libhackrf-dev libhamlib-dev libheif1 libi2c-dev libiio-dev libjack-dev libjpeg62-turbo-dev libjpeg9-dev liblog4cpp5-dev \
libmp3lame-dev libnetpbm10 libopencv-dev libopenjp2-7 libopenjp2-7-dev ghostscript libopus-dev libpcap-dev \
libpng12-0 libpng-dev libportaudio2 libpulse-dev libqt4-opengl-dev 

sudo apt-get install -y libqt5quick5 libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 libqt5charts5-dev libqt5opengl5-dev \
libqt5serialport5-dev libqt5sql5-sqlite libqt5svg5-dev libqt5svg5-dev zlib1g-dev libqt5texttospeech5-dev libqt5websockets5-dev libqt5widgets5 libqwt-dev libqwt-qt5-dev \
libraspberrypi-dev librtaudio-dev librtlsdr-dev libsamplerate0-dev libsdl1.2-dev libserialport-dev libshout3-dev libsndfile1-dev libsndfile-dev libsoapysdr-dev libsqlite3-dev \
libudev-dev libudev-dev libfltk1.3-dev libusb-dev libv4l-dev libvolk1-dev libwxgtk3.0-dev libwxgtk3.0-gtk3-dev libxcursor-dev libxft-dev libxinerama-dev libxml2-dev libzmq3-dev \


sudo apt-get install -y python3-click python3-click-plugins python3-gi-cairo python3-lxml python3-mako python3-numpy python3-pip python3-pyqt5 python3-scipy python3-sphinx \
python3-yaml python3-zmq python-numpy python-pyside python-qt4 qml-module-qtlocation qml-module-qtpositioning qml-module-qtquick-controls qml-module-qtquick-controls2 \
qml-module-qtquick-dialogs qml-module-qtquick-layouts qml-module-qtquick-window2 qt5-default python-dev python3-dev qtbase5-dev qtbase5-dev-tools qtchooser qtdeclarative5-dev qtlocation5-dev qtmultimedia5-dev \
qtpositioning5-dev qttools5-dev qttools5-dev-tools 

sudo python3 -m pip install --upgrade pip
sudo pip3 install pyinstaller
sudo pip3 install pygccxml
sudo pip3 install qtawesome
sudo pip3 install PyQt5
sudo pip3 install PyQt4
sudo pip3 install PySide

echo -e "${SIG_BANNER_COLOR}"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_COLOR} #SIGPI#   Installation Complete !!"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_RESET}"