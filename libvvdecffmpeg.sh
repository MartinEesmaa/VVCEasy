#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install libxml2 libsdl2-dev libx264-dev libx265-dev libvpx-dev libopus-dev cmake build-essential -y
echo Downloading libvvdec...
cd ~/Downloads
mkdir buildforlinux
cd buildforlinux
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
cd vvenc
sudo make install
cd ../
cd vvdec
sudo make install
cd ../
echo Downloading FFmpeg with VVC support
git clone --depth=10 https://github.com/tbiat/FFmpeg
cd FFmpeg
./configure --enable-libvvenc --enable-libvvdec --enable-pic --enable-libxml2 --enable-libx264 --enable-libx265 --enable-libvpx --enable-libopus
make -j
echo You're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
