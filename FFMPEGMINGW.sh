echo Starting process of FFmpeg build with libvvenc and libvvdec...
mkdir buildffmpegwin && cd buildffmpegwin
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-FixVVC
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
echo Starting to build vvenc...
cd vvenc
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DVVENC_ENABLE_LINK_TIME_OPT=OFF .. -G "MinGW Makefiles"
cmake --build . --target install -j $nproc
cd ../../
cd vvdec
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$MSYSTEM_PREFIX -DVVENC_ENABLE_LINK_TIME_OPT=OFF .. -G "MinGW Makefiles"
cmake --build . --target install -j $nproc
cd ../../
cd FFmpeg-FixVVC
./configure --enable-libfdk-aac --enable-static --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-zlib --enable-libxml2 --extra-ldexeflags=-static \
--pkg-config-flags=-static --disable-w32threads && \
make -j
echo FFmpeg VVC version tools are now compiled, please see buildffmpegwin/FFmpeg folder.
