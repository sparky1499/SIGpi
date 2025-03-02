# Release Notes

## Release 4.1: 2021-12-12
- Fixed RadioSonde install
- Artemis install broken for RPi for now
- Post install can pop (remove) and push (install) SIGpi Packages using SIGpi_popper and SIGPi_pusher scripts

## Release 4.0: 2021-11-30
- Implemented SIGprojects software architecture model
- Updated to SDRangel 6.17.4 and SDR++ 1.0.5
- Added Artemis, CygnusRFI, JS8CALL, GNuradio 3.8 (repo) and 3.9 (compiled) options
- Added HASviolet (Delaware Release)
- Added ability to **push** and **pop** SIGpi packages post-install

## Release 3.1: 2021-11-25
- Fixes from Bullseye update

## Release 3.0.1: 2021-10-24
- Set SDRangel build from a360ea0a9 due to SDRgui compile issue
- Remmoved Artemis due to build issues
- Moved Amateur Radio apps from SigPI menu to Hamradio menu

## Release 3.0: 2021-10-22
- New install script architecture
- Added SDR++ and Artemis
- Standardize on GNU Radio 3.8
- Add RadioSonde (decoder/encoder used in Balloon telemetry projects)

## Release 2.1: 2021-10-16
- Various fixes as part of merging code with [SIGbox](https://github.com/joecupano/SIGbox)
- SIGpi_update deprecated. This version required to be fresh install

## Release 2.0: 2021-10-02
- Update install script to be TUI-based using Whiptail-based
- Update GNUradio from 3.7 to 3.8
- Add the following digital decoder libraries/tools
-- aptdec, CM265cc, LibDAB, MBElib, SerialDV, DSDcc, SGP4, LibSigMF, Liquid-DSP, Multimon-ng, Bluetooth Baseband Library 
- Option to install latest-compiled versions of Amateur Radio Applications
-- Fldigi 4.1.20 (and suite), WSJT-X 2.4.0, QSSTV 9.5.8
- Install the following software 
-- Ubertooth Tools
-- RTL_433
- Optional install the following software 
-- SPLAT
-- Wireshark
-- Kismet
-- TEMPEST for Eliza

## Release 1.0: 2021-09-15
- Initial Release
