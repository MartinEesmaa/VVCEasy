#!/bin/bash
echo Martin Eesmaa / VVC Compiler (vvenc and vvdec)
echo Please make sure your Xcode is installed on your Applications.
echo.
cd ~/Downloads
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
cd vvenc
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . -j $nproc
cd ../
cd vvdec
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . -j $nproc
cd ../
echo Please see the build files following starting with bin/release-static
pause
