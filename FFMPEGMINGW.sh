echo Starting process of FFmpeg build with libvvenc and libvvdec...
mkdir buildffmpegwin && cd buildffmpegwin
git clone --depth=1 https://github.com/tbiat/FFmpeg
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=10 https://github.com/fraunhoferhhi/vvdec
echo Starting to build vvenc...
cd vvenc
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. -G "MinGW Makefiles"
cmake --build . --config Release --target install -j $nproc
cd ../../
cd vvdec
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. -G "MinGW Makefiles"
cmake --build . --config Release --target install -j $nproc
cd ../../
cd FFmpeg
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
./configure --enable-libfdk-aac --enable-static --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-zlib --enable-libxml2 --extra-libs='-lpthread -lm -lz' --extra-ldexeflags=-static \
--pkg-config-flags=-static --disable-w32threads && \
make -j
echo FFmpeg VVC version tools are now compiled, please see buildffmpegwin/FFmpeg folder.
