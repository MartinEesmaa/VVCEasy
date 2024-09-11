echo Updating and upgrading MSYS2 packages... if system core update requires reboot this application, please run this script again after being updated.
pacman -Syu
echo Installing MSYS2 packages...
pacman -S python git nasm vim wget $MINGW_PACKAGE_PREFIX-{toolchain,cmake,autotools,meson,ninja}
echo Starting process of FFmpeg build with libvvenc and libvvdec...
[ ! -d buildffmpegwin ] && mkdir buildffmpegwin
cd buildffmpegwin

clonepull() {
  if [ ! -d "$1" ]; then
    git clone --depth=1 "$2" "$1"
  else
    git -C "$1" pull
  fi
}

clonepull FFmpeg-VVC https://github.com/MartinEesmaa/FFmpeg-VVC
clonepull vvenc https://github.com/fraunhoferhhi/vvenc
clonepull vvdec https://github.com/fraunhoferhhi/vvdec
clonepull fdk-aac https://github.com/mstorsjo/fdk-aac
clonepull SDL https://github.com/libsdl-org/SDL -b SDL2
clonepull libxml2 https://github.com/gnome/libxml2
clonepull opus https://github.com/xiph/opus
clonepull libjxl https://github.com/libjxl/libjxl
clonepull zimg https://github.com/sekrit-twc/zimg
clonepull soxr https://github.com/chirlu/soxr
clonepull dav1d https://code.videolan.org/videolan/dav1d
clonepull codec2 https://github.com/drowe67/codec2
clonepull vmaf https://github.com/netflix/vmaf

if [ ! -d libjxl ]; then
sed -i 's/-lm/-lm -lstdc++/g' libjxl/lib/jxl/libjxl.pc.in libjxl/lib/threads/libjxl_threads.pc.in
git -C libjxl submodule update --init --recursive --depth 1 --recommend-shallow
fi

if [ ! -d zimg ]; then
git -C zimg submodule update --init --recursive --depth 1
wget https://raw.githubusercontent.com/m-ab-s/mabs-patches/master/zimg/0001-libm_wrapper-define-__CRT__NO_INLINE-before-math.h.patch
git -C zimg apply 0001-libm_wrapper-define-__CRT__NO_INLINE-before-math.h.patch
rm 0001-libm_wrapper-define-__CRT__NO_INLINE-before-math.h.patch
fi

echo Starting to build fdk-aac:
cd fdk-aac
./autogen.sh && ./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build libxml2:
cd libxml2
./autogen.sh && ./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build sdl2:
mkdir -p SDL/build
cd build && cmake -DCMAKE_EXE_LINKER_FLAGS="-static" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX .. -G "MinGW Makefiles" && cmake --build . --target install -j $nproc
cd ../../

echo Starting to build libopus to improve decode quality on FFmpeg:
cd opus
./autogen.sh && CFLAGS="-O2 -D_FORTIFY_SOURCE=0" LDFLAGS="-flto -s" ./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build libjxl:
mkdir -p libjxl/build && cd libjxl/build && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DJPEGXL_ENABLE_BENCHMARK=OFF -DJPEGXL_ENABLE_PLUGINS=ON -DJPEGXL_ENABLE_MANPAGES=OFF -DJPEGXL_FORCE_SYSTEM_BROTLI=ON -DJPEGXL_FORCE_SYSTEM_GTEST=ON -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX .. && ninja install
cd ../../

echo Starting to build dav1d:
mkdir -p dav1d/build && cd dav1d/build && meson -Denable_docs=false -Ddefault_library=static -Dprefix=$MSYSTEM_PREFIX .. && ninja install
cd ../../

echo Starting to build zimg:
cd zimg && ./autogen.sh && ./configure --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build soxr:
mkdir -p soxr/build && cd soxr/build && cmake -D{WITH_LSR_BINDINGS,BUILD_TESTS,WITH_OPENMP}=off -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -Wno-dev .. -G "MinGW Makefiles"
cmake --build . -j $nproc --target install
cd ../../

echo Starting to build codec2:
cd codec2
sed -i 's|if(WIN32)|if(FALSE)|g' CMakeLists.txt
grep -ERl "\b(lsp|lpc)_to_(lpc|lsp)" --include="*.[ch]" | \
                xargs -r sed -ri "s;((lsp|lpc)_to_(lpc|lsp));c2_\1;g"
mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -D{UNITTEST,INSTALL_EXAMPLES}=off -DBUILD_SHARED_LIBS=OFF -DCMAKE_EXE_LINKER_FLAGS="-static" .. -G "MinGW Makefiles"
cmake --build . -j $nproc --target install
cd ../../

echo Starting to build vmaf to apply calculate VVC video references from original video:
mkdir -p vmaf/libvmaf/build && cd vmaf/libvmaf/build && CFLAGS="-msse2 -mfpmath=sse -mstackrealign" meson -Denable_docs=false -Ddefault_library=static -Denable_float=true -Dbuilt_in_models=true -Dprefix=$MSYSTEM_PREFIX .. && ninja install
cd ../../../
sed -i 's/-lm/-lm -lstdc++/g' $MSYSTEM_PREFIX/lib/pkgconfig/libvmaf.pc

echo Starting to build vvenc...
cd vvenc
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DVVENC_ENABLE_LINK_TIME_OPT=OFF .. -G "MinGW Makefiles"
cmake --build . --target install -j $nproc
cd ../../
echo Starting to build vvdec...
cd vvdec
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DVVDEC_ENABLE_LINK_TIME_OPT=OFF .. -G "MinGW Makefiles"
cmake --build . --target install -j $nproc
cd ../../

echo Starting configuring and making FFmpeg VVCEasy build...
cd FFmpeg-VVC
./configure --enable-gpl --enable-version3 --enable-nonfree --enable-libfdk-aac --enable-static --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-zlib --enable-libxml2 --enable-libdav1d --enable-libopus --enable-libcodec2 --enable-libjxl --enable-libzimg \
--enable-libvmaf --enable-libsoxr --extra-ldexeflags=-static --pkg-config-flags=-static --disable-w32threads --enable-sdl2 --extra-version=VVCEasy && \
make -j
echo FFmpeg VVC version tools are now compiled, please see buildffmpegwin/FFmpeg folder.
