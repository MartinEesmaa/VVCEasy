#!/bin/bash
echo Building FFmpeg VVCEasy Linux version...
sudo apt update && sudo apt upgrade -y && \
sudo apt install build-essential cmake nasm autoconf pkg-config \
python3-setuptools ninja-build python3-pip libtool git wget xxd -y && \
sudo pip3 install meson

if [ ! -d FFmpeg-FixVVC ]; then
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-VVC
else
git -C FFmpeg-VVC pull
fi

if [ ! -d vvenc ]; then
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
else
git -C vvenc pull
fi

if [ ! -d vvdec ]; then
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
else
git -C vvdec pull
fi

if [ ! -d fdk-aac ]; then
git clone --depth=1 https://github.com/mstorsjo/fdk-aac
else
git -C fdk-aac pull
fi

if [ ! -d SDL ]; then
git clone --depth=1 https://github.com/libsdl-org/SDL
else
git -C SDL pull
fi

if [ ! -d libxml2 ]; then
git clone --depth=1 https://github.com/gnome/libxml2
else
git -C libxml2 pull
fi

if [ ! -d opus ]; then
git clone --depth=1 https://github.com/xiph/opus
else
git -C opus pull
fi

if [ ! -d libjxl ]; then
git clone --depth=1 https://github.com/libjxl/libjxl
sed -i 's/-lm/-lm -lstdc++/g' libjxl/lib/jxl/libjxl.pc.in libjxl/lib/threads/libjxl_threads.pc.in
git -C libjxl submodule update --init --recursive --depth 1 --recommend-shallow
else
git -C libjxl pull
git -C libjxl submodule update --init --recursive --depth 1 --recommend-shallow
fi

if [ ! -d dav1d ]; then
git clone --depth=1 https://code.videolan.org/videolan/dav1d
else
git -C dav1d pull
fi

if [ ! -d vmaf ]; then
git clone --depth=1 https://github.com/netflix/vmaf
else
git -C vmaf pull
fi

cd vvenc && sudo make install-release install-prefix=$PREFIX disable-lto=1 && \
cd .. && \
cd vvdec && sudo make install-release install-prefix=$PREFIX disable-lto=1 && \
cd .. && \
cd fdk-aac && autoreconf -if && ./configure --prefix=$PREFIX --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd libxml2 && autoreconf -if && ./configure --prefix=$PREFIX --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd opus && autoreconf -if && CFLAGS="-O2 -D_FORTIFY_SOURCE=0" LDFLAGS="-flto -s" ./configure --prefix=$PREFIX --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
mkdir libjxl/build && cd libjxl/build && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DJPEGXL_ENABLE_BENCHMARK=OFF -DJPEGXL_ENABLE_PLUGINS=ON -DJPEGXL_ENABLE_MANPAGES=OFF -DJPEGXL_FORCE_SYSTEM_BROTLI=ON -DJPEGXL_FORCE_SYSTEM_GTEST=ON -DCMAKE_INSTALL_PREFIX=$PREFIX .. -G Ninja && sudo ninja install -j $nproc && \
cd ../../ && \
mkdir vmaf/libvmaf/build && cd vmaf/libvmaf/build && CFLAGS="-msse2 -mfpmath=sse -mstackrealign" meson -Denable_docs=false -Ddefault_library=static -Denable_float=true -Dbuilt_in_models=true -Dprefix=$PREFIX .. && sudo ninja install -j $nproc && \
cd ../../../ && \
cd SDL && mkdir build && cd build && cmake -DCMAKE_EXE_LINKER_FLAGS="-static" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX .. && sudo make install -j $nproc && \
cd ../../ && \
mkdir dav1d/build && cd dav1d/build && meson -Denable_docs=false -Ddefault_library=static -Dprefix=$PREFIX .. && sudo ninja install -j $nproc && \
cd ../../ && \
cd FFmpeg-VVC && \
./configure --enable-static --pkg-config-flags="--static" --extra-ldexeflags="-static" \
--enable-libfdk-aac --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-libxml2 --enable-libopus --enable-libdav1d --enable-libjxl --enable-sdl2 && \
make -j
echo You're ready to preview VVC, view VVC information or convert from VVC using ffmpeg, ffplay and ffprobe.
echo - Martin Eesmaa
