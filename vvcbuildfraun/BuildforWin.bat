echo off
pushd "%~dp0"
cls

echo.
echo  :: Checking For Administrator Elevation...
echo.
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
        echo Elevation found! Proceeding...
) else (
        echo  :: You are NOT running as Administrator
        echo.
        echo     Right-click and select ^'Run as Administrator^' and try again.
        echo     Press any key to exit...
        pause > NUL
        exit
)

goto main123

:main123
title VVENC AND VVDEC (Build for Windows) (Script by Martin Eesmaa)
cls
echo Do you want build of vvenc and vvdec yourself on your computer?
echo Before you agree to build for Windows, you need Cmake and Visual Studio on your computer.
echo Requires build to Windows VVC by Cmake 3.13.0+ (needs to be pathed environment) and Visual Studio 2017 and later (requires Desktop C++).
echo Requires download VVEnc and VVDec for (Git for Windows).
echo Yes means build. No means it will exit.
echo Y/N?
set /p main1234= Answer: 
if %main1234% == Y goto installmain123
if %main1234% == y goto installmain123
if %main1234% == N goto exit
if %main1234% == n goto exit

:installmain123
title Building time...
echo Building time...
mkdir Windows && cd Windows
echo Download VVENC and VVDEC from Fraunhoferhhi GitHub...
git clone https://github.com/fraunhoferhhi/vvenc.git
git clone https://github.com/fraunhoferhhi/vvdec.git
cd vvenc
mkdir build && cd build
cmake ..
cmake --build . --config Release
cd ..
cd bin/release-static
explorer .
cd ../../../
cd vvdec
mkdir build && cd build
cmake ..
cmake --build . --config Release
cd ..
cd bin/release-static
explorer .
cd ../../../../
goto successnow

:successnow
echo.
echo.
echo.
echo Successfully build of vvenc and vvdec on your Windows.
echo Do you want delete source of VVENC and VVDEC files? Y/N?
echo.
echo WARNING!!!: YOU HAVE TO COPY EXECUTABLE FILES BEFORE YOU DELETE SOURCE FILES
echo BUG: The syntax of the command is incorrect for unknown error. 
echo To see .EXE files, go to Windows/vvenc/bin/release-static
set /p installmain1234= Answer: 
if %installmain1234% == Y goto deletesourcefiles
if %installmain1234% == y goto deletesourcefiles
if %installmain1234% == N goto otherwisenow
if %installmain1234% == n goto otherwisenow

:deletesourcefiles
title Cleaning up source files on VVENC and VVDEC on your computer...
echo Cleaning up source files on VVENC and VVDEC on your computer...
cd ../
rmdir /s Windows
goto otherwisenow

:otherwisenow
title Thank you for enjoying my script... (Martin Eesmaa)
echo Thank you for enjoying my script... (Martin Eesmaa)
echo Exiting...
timeout 3
exit

:exit
exit