echo Starting process of FFmpeg build with libvvenc and libvvdec...
mkdir buildffmpegwin && cd buildffmpegwin
git clone --depth=1 https://github.com/tbiat/FFmpeg
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
echo Starting to build vvenc...
cd vvenc
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. -G "MinGW Makefiles"
cmake --build . --config Release --target install
cd ../../
cd vvdec
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. -G "MinGW Makefiles"
cmake --build . --config Release --target install
cd ../../
cd FFmpeg
./configure --enable-gpl --enable-version3 --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-libxml2 --enable-libaom --enable-libx264 --enable-libx265 --enable-libvpx --enable-libsvtav1 \
--enable-libopus --enable-librav1e --disable-w32threads && \
make -j
echo FFmpeg VVC version tools are now compiled, please see buildffmpegwin/FFmpeg folder.
