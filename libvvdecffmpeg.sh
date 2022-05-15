#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install openssl libxml2 /y
echo Downloading libvvdec...
cd ~/Downloads
git clone https://github.com/fraunhoferhhi/vvdec.git
cd vvdec
make release && make install
cd ../
echo Downloading FFmpeg with VVC support
git clone https://github.com/lehmann-c/FFmpeg.git
cd FFmpeg
./configure --enable-libvvdec --enable-pic --enable-openssl --enable-libxml2
make -j
echo Three packages are finished. One more thing to do is type code to finish it:
echo export LD_LIBRARY_PATH=~/Downloads/vvdec/install/lib
echo Once you typed code, you're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
