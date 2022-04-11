echo Martin Eesmaa / VVC Compiler (vvenc and vvdec)
echo We will check packages called: build-essential and cmake
echo It will check, if the build-essential and cmake packages are installed or not.
echo If it's already, it will update.
echo If it's not installed, we will install automatically for you.
echo.
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential cmake -y
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
