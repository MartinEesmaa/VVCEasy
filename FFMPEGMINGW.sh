echo Updating and upgrading MSYS2 packages... if system core update requires reboot this application, please run this script again after being updated.
pacman -Syu
echo Installing MSYS2 packages...
pacman -S python git nasm vim wget $MINGW_PACKAGE_PREFIX-{toolchain,cmake,autotools,meson,ninja}
echo Starting process of FFmpeg build with libvvenc and libvvdec...
if [ ! -d buildffmpegwin ]; then
mkdir buildffmpegwin && cd buildffmpegwin
else
cd buildffmpegwin
fi

if [ ! -d FFmpeg-VVC ]; then
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
git clone --depth=1 https://github.com/libsdl-org/SDL -b SDL2
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

if [ ! -d zimg ]; then
git clone --depth=1 https://github.com/sekrit-twc/zimg
git -C zimg submodule update --init --recursive --depth 1
wget https://raw.githubusercontent.com/m-ab-s/mabs-patches/master/zimg/0001-libm_wrapper-define-__CRT__NO_INLINE-before-math.h.patch
git -C zimg apply 0001-libm_wrapper-define-__CRT__NO_INLINE-before-math.h.patch
rm 0001-libm_wrapper-define-__CRT__NO_INLINE-before-math.h.patch
else
git -C zimg pull
git -C zimg submodule update --init --recursive --depth 1
fi

if [ ! -d soxr ]; then
git clone --depth=1 https://github.com/chirlu/soxr
else
git -C soxr pull
fi

if [ ! -d dav1d ]; then
git clone --depth=1 https://code.videolan.org/videolan/dav1d
else
git -C dav1d pull
fi

if [ ! -d codec2 ]; then
git clone --depth=1 https://github.com/drowe67/codec2
else
git -C codec2 pull
fi

if [ ! -d vmaf ]; then
git clone --depth=1 https://github.com/netflix/vmaf
else
git -C vmaf pull
fi

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
mkdir build && cd build && cmake -DCMAKE_EXE_LINKER_FLAGS="-static" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX .. -G "MinGW Makefiles" && cmake --build . --target install -j $nproc
cd ../../

echo Starting to build libopus to improve decode quality on FFmpeg:
cd opus
autoreconf -if && CFLAGS="-O2 -D_FORTIFY_SOURCE=0" LDFLAGS="-flto -s" ./configure --enable-static --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build libjxl:
mkdir libjxl/build && cd libjxl/build && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DJPEGXL_ENABLE_BENCHMARK=OFF -DJPEGXL_ENABLE_PLUGINS=ON -DJPEGXL_ENABLE_MANPAGES=OFF -DJPEGXL_FORCE_SYSTEM_BROTLI=ON -DJPEGXL_FORCE_SYSTEM_GTEST=ON -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX .. && ninja install
cd ../../

echo Starting to build dav1d:
mkdir dav1d/build && cd dav1d/build && meson -Denable_docs=false -Ddefault_library=static -Dprefix=$MSYSTEM_PREFIX .. && ninja install
cd ../../

echo Starting to build zimg:
cd zimg && autoreconf -if && ./configure --disable-shared --prefix=$MSYSTEM_PREFIX && make install -j $nproc
cd ..

echo Starting to build soxr:
mkdir soxr/build && cd soxr/build && cmake -D{WITH_LSR_BINDINGS,BUILD_TESTS,WITH_OPENMP}=off -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -Wno-dev .. -G "MinGW Makefiles"
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
mkdir vmaf/libvmaf/build && cd vmaf/libvmaf/build && CFLAGS="-msse2 -mfpmath=sse -mstackrealign" meson -Denable_docs=false -Ddefault_library=static -Denable_float=true -Dbuilt_in_models=true -Dprefix=$MSYSTEM_PREFIX .. && ninja install
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
