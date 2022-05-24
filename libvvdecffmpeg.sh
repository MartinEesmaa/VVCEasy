#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install libxml2 libsdl2-dev libx264-dev libx265-dev libvpx-dev -y
echo Downloading libvvdec...
cd ~/Downloads
git clone https://github.com/fraunhoferhhi/vvdec.git
cd vvdec
make install install-prefix=/usr/local
cd ../
echo Downloading FFmpeg with VVC support
git clone https://github.com/lehmann-c/FFmpeg.git
cd FFmpeg
./configure --enable-libvvdec --enable-pic --enable-libxml2 --enable-libx264 --enable-libx265 --enable-libvpx && make -j
echo You're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
