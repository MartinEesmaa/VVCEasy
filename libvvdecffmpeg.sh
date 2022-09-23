#!/bin/bash
sudo apt update && sudo apt upgrade -y && \
sudo apt install build-essential cmake nasm autoconf pkg-config \
python3-setuptools ninja-build python3-pip libtool git wget -y && \
sudo pip3 install meson && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec && \
git clone --depth=1 https://github.com/mstorsjo/fdk-aac && \
git clone --depth=1 https://github.com/libsdl-org/SDL && \
git clone --depth=1 https://github.com/gnome/libxml2 && \
git clone --depth=1 https://github.com/xiph/opus && \
git clone --depth=1 https://code.videolan.org/videolan/dav1d && \
git clone --depth=1 https://github.com/Netflix/vmaf && \
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
cd .. && \
mkdir dav1d/build && cd dav1d/build && meson -Denable_docs=false -Ddefault_library=static -Dprefix=/usr/local && sudo ninja install && \
cd ../../ && \
mkdir vmaf/libvmaf/build && cd vmaf/libvmaf/build && meson -Denable_docs=false -Ddefault_library=static -Dprefix=/usr/local && sudo ninja install && \
cd ../../../ && cd FFmpeg-FixVVC && \
./configure --enable-static --pkg-config-flags="--static" --extra-ldexeflags="-static" \
--enable-libfdk-aac --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-libxml2 --enable-libopus --enable-libdav1d --enable-libvmaf --enable-sdl2 --ld=g++ && \
make -j
echo You're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
