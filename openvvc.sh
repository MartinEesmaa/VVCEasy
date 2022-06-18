#!/bin/bash
sudo apt update && sudo apt upgrade -y
echo Downloading OpenVVC...
cd ~/Downloads
mkdir OpenVVCbuild && cd OpenVVCbuild
git clone https://github.com/OpenVVC/OpenVVC
echo Configuring, making and installing of OpenVVC on your computer...
cd OpenVVC
./configure && make && sudo make install
cd ../
echo Downloading FFmpeg with OpenVVC support...
git clone --depth=1 https://github.com/tbiat/FFmpeg
cd FFmpeg
echo Configuring and making of FFmpeg with OpenVVC support...
./configure --enable-libopenvvc && make -j
echo Once you typed code, you're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
