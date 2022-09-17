#!/bin/bash
sudo apt update && sudo apt upgrade -y && \
sudo apt install build-essential cmake nasm autoconf pkg-config python3-setuptools libtool git wget && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec && \
git clone --depth=1 https://github.com/mstorsjo/fdk-aac && \
git clone --depth=1 https://github.com/libsdl-org/SDL && \
git clone --depth=1 https://github.com/gnome/libxml2 && \
git clone --depth=1 https://github.com/xiph/opus && \
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-FixVVC && \
wget https://gist.githubusercontent.com/MartinEesmaa/6c4c8158139e04d432f49ac005ba7528/raw/04b05601cb51eec7e5041f8a45b71caa552669c2/libvvenc.pc.in && \
cp libvvenc.pc.in vvenc/pkgconfig/ && \
cd vvenc && sudo make install-release install-prefix=/usr/local disable-lto=1 && \
cd .. && \
cd vvdec && sudo make install-release install-prefix=/usr/local disable-lto=1 && \
cd .. && \
cd fdk-aac && autoreconf -if && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd libxml2 && autoreconf -if && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd opus && autoreconf -if && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd SDL && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && cd FFmpeg-FixVVC && \
./configure --enable-static --pkg-config-flags="--static" --extra-ldexeflags="-static" \
--enable-libfdk-aac --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-libxml2 --enable-libopus --enable-sdl2 && \
make -j
echo You're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
