echo Updating & upgrading MSYS2 packages... (if system core update requires reboot this application, please run this script again after being updated)
pacman -Syu
pacman -Su
echo Installing MSYS2 packages...
pacman -S python nasm $MINGW_PACKAGE_PREFIX-{toolchain,cmake,autotools,meson,ninja}
echo Starting process of FFmpeg build with libvvenc and libvvdec...
mkdir buildffmpegwin && cd buildffmpegwin
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-FixVVC
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
git clone --depth=1 https://github.com/mstorsjo/fdk-aac
git clone --depth=1 https://github.com/libsdl-org/SDL
git clone --depth=1 https://github.com/gnome/libxml2
git clone --depth=1 https://github.com/xiph/opus
git clone --depth=1 https://code.videolan.org/videolan/dav1d
git clone --depth=1 https://github.com/Netflix/vmaf

echo Starting to build fdk-aac:
cd fdk-aac
autoreconf -if && ./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build libxml2:
cd libxml2
autoreconf -if && ./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build sdl2:
cd SDL
./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build libopus to improve decode quality on FFmpeg:
cd opus
CFLAGS="-O2 -D_FORTIFY_SOURCE=0" LDFLAGS="-flto -s" ./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build dav1d:
mkdir dav1d/build && cd dav1d/build && meson -Denable_docs=false -Ddefault_library=static -Dprefix=$MSYSTEM_PREFIX .. && ninja install
cd ../../

echo Starting to build vmaf to apply calculate VVC video references from original video:
mkdir vmaf/libvmaf/build && cd vmaf/libvmaf/build && CFLAGS="-msse2 -mfpmath=sse -mstackrealign" meson -Denable_docs=false -Ddefault_library=static -Denable_float=true -Dbuilt_in_models=true -Dprefix=$MSYSTEM_PREFIX .. && ninja install
cd ../../../

echo Starting to build vvenc & vvdec...
cd vvenc
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DVVENC_ENABLE_LINK_TIME_OPT=OFF .. -G "MinGW Makefiles"
cmake --build . --target install -j $nproc
cd ../../
cd vvdec
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DVVDEC_ENABLE_LINK_TIME_OPT=OFF .. -G "MinGW Makefiles"
cmake --build . --target install -j $nproc
cd ../../

echo Starting configuring and making FFmpeg VVCEasy build...
cd FFmpeg-FixVVC
./configure --enable-libfdk-aac --enable-static --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-zlib --enable-libxml2 --extra-ldexeflags=-static \
--pkg-config-flags=-static --disable-w32threads --enable-sdl2 && \
make -j
echo FFmpeg VVC version tools are now compiled, please see buildffmpegwin/FFmpeg folder.
