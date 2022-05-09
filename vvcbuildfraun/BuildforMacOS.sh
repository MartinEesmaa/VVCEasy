#!/bin/bash
echo Martin Eesmaa / VVC Compiler (vvenc and vvdec)
echo Please make sure your Xcode is installed on your Applications.
echo.
cd /Home/Downloads/
git clone https://github.com/fraunhoferhhi/vvenc.git
git clone https://github.com/fraunhoferhhi/vvdec.git
cd vvenc
make release
cd ../
cd vvdec
make release
cd ../
echo Please see the build files following starting with vvenc/bin/release-shared
pause
