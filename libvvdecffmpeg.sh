#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install libxml2 libsdl2-dev libx264-dev libx265-dev libvpx-dev libopus-dev -y
echo Downloading libvvdec...
cd ~/Downloads
mkdir buildforlinux
cd buildforlinux
git clone https://github.com/fraunhoferhhi/vvenc
git clone https://github.com/fraunhoferhhi/vvdec
cd vvenc
make install install-prefix=/usr/local
cd ../
cd vvdec
make install install-prefix=/usr/local
cd ../
echo Downloading FFmpeg with VVC support
git clone https://github.com/tbiat/FFmpeg
cd FFmpeg
./configure --enable-libvvenc --enable-libvvdec --enable-pic --enable-libxml2 --enable-libx264 --enable-libx265 --enable-libvpx --enable-libopus
make -j
echo You're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
