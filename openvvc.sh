#!/bin/bash
sudo apt update && sudo apt upgrade -y
echo Downloading OpenVVC...
cd ~/Downloads
mkdir OpenVVC && cd OpenVVC
git clone https://github.com/OpenVVC/OpenVVC.git
echo Configuring, making and installing of OpenVVC on your computer...
cd OpenVVC
./configure && make && make install
cd ../
echo Downloading FFmpeg with OpenVVC support...
git clone https://github.com/OpenVVC/FFmpeg.git
cd FFmpeg
echo Configuring and making of FFmpeg with OpenVVC support...
echo One more thing to do is type code to finish it:
echo export LD_LIBRARY_PATH=~/Downloads/OpenVVC/OpenVVC/install/lib
echo export PKG_CONFIG_PATH=~/Downloads/OpenVVC/OpenVVC/install/lib/pkgconfig
echo ./configure && make -j &&
echo Once you typed code, you're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
