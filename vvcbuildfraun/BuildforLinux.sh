#!/bin/bash
echo Martin Eesmaa / VVC Compiler (vvenc and vvdec)
echo We will check packages called: build-essential and cmake
echo It will check, if the build-essential and cmake packages are installed or not.
echo If it's already, it will update.
echo If it's not installed, we will install automatically for you.
echo.
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential cmake -y
cd ~/Downloads
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
cd vvenc
mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static" .. && make
cd ../../
cd vvdec
mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static" .. && make
cd ../../
echo Please see the build files following starting with vvenc/bin/release-static
pause
