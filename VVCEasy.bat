echo off
set welcometitle=Martin Eesmaa / VVCEasy
set version=v3.0.0
set versionname=The important life of Martin Eesmaa
set vvceasydate=23 June 2025
set copyrightinfo=Copyright (C) 2021-2025 Martin Eesmaa (MIT License)
for /f "tokens=2*" %%A in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "PROCESSOR_ARCHITECTURE"') do set ProcessorArchitecture=%%B

if /i "%ProcessorArchitecture%"=="AMD64" (
    set bit=x64
) else if /i "%ProcessorArchitecture%"=="ARM64" (
    set bit=arm64
) else (
    set bit=Win32
)

pushd "%~dp0"
set sevenzip=%~dp07-Zip\%bit%\7z.exe
cls

ver | find "DOS" > nul
if %errorlevel% equ 0 (
    goto doserror
) else (
    ver | find "95" > nul | goto error
    ver | find "98" > nul | goto error
    ver | find "Millennium" > nul | goto error
    ver | findstr /i "5\.0\." > nul && goto error
)

REM === check and get the UAC for administrator privilege ===
REM === code from https://sites.google.com/site/eneerge/scripts/batchgotadmin
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    if '%1' EQU '1' (
        echo Cannot elevate administrator privilege
        echo Please try again with "Run as Administrator"
        echo Permission denied.
        pause
        exit /B
    ) else (
        echo Requesting administrative privileges...
        goto UACPrompt
    )
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "1", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B
    
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

goto start

:start
title %welcometitle%
color 07
cls
echo Welcome to VVCEasy!
echo VVCEasy (Batchfile Release Version, %version%, %vvceasydate%)
echo Version codename: %versionname%
echo Current system architecture: %bit%
echo %copyrightinfo%
echo.
echo What would you like to do to encode/decode VVC?
echo 1. Encode (too old, deprecated)
echo 2. Decode (too old, deprecated)
echo 3. Help
echo 4. Exit
echo 5. Test path environment
echo 6. Install/Update VVdec Web Player (requires Python and clone/pull for git)
echo 7. Install Windows VVC binaries (Windows XP and later)
echo 8. Install vvDecPlayer from BitMovin
echo 9. Install/Update VLC VTM Plugins (Windows/Linux x64 of VLC plugins by Inter Digital Inc)
echo 10. Install FFmpeg/MPV external VVC support
echo 11. Tests of VVC videos
echo 12. Build vvenc and vvdec by yourself from sources
set /p VVCSTART=Number: 

if "%VVCSTART%" == "1" goto encodestart
if "%VVCSTART%" == "2" goto decodestart
if "%VVCSTART%" == "3" goto help
if "%VVCSTART%" == "4" goto exit
if "%VVCSTART%" == "5" goto test
if "%VVCSTART%" == "6" goto installvvdecweb
if "%VVCSTART%" == "7" goto decompresswin7z
if "%VVCSTART%" == "8" goto installbitmovin
if "%VVCSTART%" == "9" goto vlcvtmplugininstall
if "%VVCSTART%" == "10" goto installvvdecffmpegmpvnow
if "%VVCSTART%" == "11" goto testsofvideo
if "%VVCSTART%" == "12" goto main123
echo Invalid input. Please enter a number between 1 and 13.
pause
goto start

:encodestart
title Encode to VVC
cls
echo Welcome to the VVC encoder.
echo What do you like to encode to VVC?
echo Before we move to settings quality, is your video lossy or lossless?
echo 1. Lossy (example YouTube videos, Web videos, lossy compressed videos, and other web)
echo 2. Lossless (example XIPH Media, Camera uncompressed RAW video, Apple ProRes and others uncompressed files)
echo 3. Go back to the menu.
set /p vvencquestion1=Number: 
if "%vvencquestion1%" == 1 goto losslessvvenc2
if "%vvencquestion1%" == 2 goto lossyvvenc2
if "%vvencquestion1%" == 3 goto start
echo Invalid input. Please enter a number between 1 and 3.
pause
goto encodestart

:losslessvvenc2
title Lossless settings with Lossless uncompressed (VVC Encoder)
cls
echo Do you have Y4M?
echo If you have Y4M already, move your Y4M file into C:\Program Files\VVCEasy\
echo If you do not have Y4M, your instruction will go to the next...
echo 1. I have Y4M already (I am ready) 
echo 2. No, I am not ready yet (go back to previous)
echo If you don't have Y4M already... You need to transcode the file from your uncompressed file to Y4M.
echo Example: ffmpeg -i yourfile.mov -strict 1 yourfinal.y4m
echo Only 8-bit uncompressed movies are input to Y4M.
set /p doyouhavey4mvvencquestion3=Number: 
if "%doyouhavey4mvvencquestion3%" == 1 goto startlosslessvvenc2
if "%doyouhavey4mvvencquestion3%" == 2 goto encodestart
echo Invalid input. Please enter a number 1 or 2.
pause
goto losslessvvenc2

:startlosslessvvenc2
cls
title VVC ENCODER (Y4M LOSSLESS)
echo Before we start encoding from your Y4M file to VVC file, I'm afraid I cannot do it automatically for you.
echo You must manually encode it to VVC, as the batch file won't work.
echo Here is code: vvencapp --qp 18 -i yourinput.y4m -s 854x480 -r 30 --preset slow --threads 16 --tier high -o yourfinalvvc.266
echo YOU HAVE TO REPLACE THE VIDEO SIZE AND FRAME RATE. -s is video size and -r is frame rate.
echo INPUT VIDEO BIT DEPTH IS 8-BIT ONLY FOR UNCOMPRESSED MOVIE FILES.
pause
goto start

:lossyvvenc2
title Lossy settings with Lossy compressed (VVC Encoder)
cls
echo Do you have YUV?
echo If you have YUV already, move your YUV file into C:\Program Files\VVCEasy\
echo If you do not have YUV, your instruction will go to the next...
echo 1. I have YUV already (I am ready) 
echo 2. No, I am not ready yet (go back to previous)
echo If you don't have Y4M already... You need to transcode the file from your lossy video file to YUV.
echo Example: ffmpeg -i yourfile.mp4 -strict 1 yourfinal.yuv
set /p doyouhaveyuvvvencquestion4=Number: 
if "%doyouhaveyuvvvencquestion4%" == 1 goto startlossyvvenc2
if "%doyouhaveyuvvvencquestion4%" == 2 goto encodestart
echo Invalid input. Please enter a number 1 or 2.
pause
goto lossyvvenc2

:startlossyvvenc2
cls
title VVC ENCODER (YUV LOSSY)
echo Before we start encoding from your YUV file to VVC file, I'm afraid I cannot do it automatically for you.
echo You must manually encode it to VVC, as the batch file won't work.
echo Here is code: vvencapp --qp 38 -i yourinput.yuv -s 854x480 -r 30 -o youroutputlossy.266
echo YOU HAVE TO REPLACE THE VIDEO SIZE AND FRAME RATE. -s is video size and -r is frame rate.
echo You can also add for "--tier high" or/and 10-bit video "-c yuv420_10", if necessary.
pause
goto start

:decodestart
cls
if not exist "transcodedback" mkdir transcodedback
title Decode from VVC to YUV/Y4M
echo Do you want to transcode back from VVC to YUV or Y4M? Which did you choose for the settings? Choosing settings will transcode back.
echo You need to copy from your VVC file to C:\Program Files\VVCEasy\WindowsVVC\. Windows Explorer will open automatically.
echo After copying your VVC file into the VVCEasy folder, rename it to VVC.vvc. It will transcode from your VVC file to YUV/Y4M.
echo After transcoding, your transcoded file should be: C:\Program Files\VVCEasy\transcodedback
echo Note, if you are using portable, like your git cloned VVCEasy or downloaded source files, go to your Downloads folder and select VVCEasy.
echo Portable won't work probably, you need to copy from your Downloads folder\VVCEasy into Program Files\VVCEasy.
echo 1. YUV (lossy video VVC)
echo 2. Y4M (lossless video VVC, recommended)
set /p decodestart1=Number: 
if "%decodestart1%" == 1 goto DECODESTARTFROMVVCTOYUV
if "%decodestart1%" == 2 goto DECODESTARTFROMVVCTOY4M
echo Invalid input. Please enter a number 1 or 2.
pause
goto decodestart

:DECODESTARTFROMVVCTOYUV
cls
title STARTING TRANSCODING BACK FROM VVC TO YUV...
cd WindowsVVC
vvdecapp -b VVC.vvc -o VVCTOYUV.yuv
move VVCTOYUV.yuv ..\transcodedback
echo FINISHED. Going back to the menu...
timeout 3
goto start

:DECODESTARTFROMVVCTOY4M
cls
title STARTING TRANSCODING BACK FROM VVC TO Y4M...
cd WindowsVVC
vvdecapp -b VVC.vvc --y4m -o VVCTOYUV.y4m
move VVCTOYUV.y4m ..\transcodedback
echo FINISHED. Going back to the menu...
timeout 3
goto start

:test
cls
title Test path environment
echo This script will check if required programs are installed in PATH environment.
echo Are you ready to test of your programs installed? (Y/N)
set /p readytestbefore=Answer: 
if /I "%readytestbefore%"=="Y" goto nowtestingtime
if /I "%readytestbefore%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto test

:nowtestingtime
echo Testing installed programs...
setlocal enabledelayedexpansion

set "missing="
set "found="

where ffmpeg >nul 2>nul
if errorlevel 1 (
    echo Missing ffmpeg is not found in PATH.
    set missing=!missing! ffmpeg
) else (
    echo FFmpeg found. Good to go encode and decode!
    set found=!found! ffmpeg
)

where git >nul 2>nul
if errorlevel 1 (
    echo Missing git in PATH.
    set missing=!missing! git
) else (
    echo Git found. Good to go for git cloning and pulling!
    set found=!found! git
)

where python >nul 2>nul
if errorlevel 1 (
    echo MISSING: python not installed/found in PATH.
    set missing=!missing! python
) else (
    echo Python found. Good to go with Web Server on vvDecWebPlayer!
    set found=!found! python
)

echo.

if defined missing (
    echo The following programs are missing or not in your PATH:!missing!
    echo.
    echo Please install any missing programs on your computer.
    echo Installation links:
    echo - Python install: https://www.python.org/downloads/
    echo - FFmpeg install: https://www.wikihow.com/Install-FFmpeg-on-Windows
    echo - Git install: https://git-scm.com/download/win
    echo.
    echo Once you have installed missing program !missing!, please try again.
    pause
    endlocal
    goto start
) else (
    echo All required programs are found in your PATH!
    echo So that means it is working correctly.
    endlocal
    pause
    goto start
)

:exit
cls
echo Have a nice day! Thank you for using VVCEasy! :)
:::     _   _                 _                      
:::    | | | |               | |                     
:::    | |_| |__   __ _ _ __ | | ___   _  ___  _   _ 
:::    | __| '_ \ / _` | '_ \| |/ / | | |/ _ \| | | |
:::    | |_| | | | (_| | | | |   <| |_| | (_) | |_| |
:::     \__|_| |_|\__,_|_| |_|_|\_\\__, |\___/ \__,_|
:::                                 __/ |            
:::                                |___/

:::    __      ____      _______ ______                
:::    \ \    / /\ \    / / ____|  ____|               
:::     \ \  / /  \ \  / / |    | |__   __ _ ___ _   _ 
:::      \ \/ /    \ \/ /| |    |  __| / _` / __| | | |
:::       \  /      \  / | |____| |___| (_| \__ \ |_| |
:::        \/        \/   \_____|______\__,_|___/\__, |
:::                                               __/ |
:::                                              |___/ 

:::     __  __            _   _         ______                                
:::    |  \/  |          | | (_)       |  ____|                               
:::    | \  / | __ _ _ __| |_ _ _ __   | |__   ___  ___ _ __ ___   __ _  __ _ 
:::    | |\/| |/ _` | '__| __| | '_ \  |  __| / _ \/ __| '_ ` _ \ / _` |/ _` |
:::    | |  | | (_| | |  | |_| | | | | | |___|  __/\__ \ | | | | | (_| | (_| |
:::    |_|  |_|\__,_|_|   \__|_|_| |_| |______\___||___/_| |_| |_|\__,_|\__,_|
                                                                        
                                                                        
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo %copyrightinfo%
echo.
echo ------------ END OF WINDOWS BATCHFILE PROGRAM ----------------
timeout 5 /nobreak
exit

:help
cls
echo Welcome to VVCEasy help instructions!
echo Here is a tutorial about... How to use VVCEasy?
pause
echo Step 1: Run on VVCEasy.bat. When you see the screen: "Welcome to VVCEasy. You can press any key to continue to the main menu."
echo Step 2: Here is the list of main menus, where you must type any number to go in the direction, like the (goto) command.
echo Step 3: Follow the command instructions, and that is easy.
pause
echo If you have any problems that you do not understand VVCEasy. Please get in touch with Martin Eesmaa by creating issues for questions and/or problems.
echo Do you want to start over with the help instructions? If yes, then it will go back to the beginning. If no, go back to the menu. Y/N?
set /p helper=Answer: 
if /I "%helper%"=="Y" goto help
if /I "%helper%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto help

:installvvdecweb
cls
title VVdec Web Player.
echo Welcome to VVDEC Web Player.
echo By installing, you will have to agree to download VVDec Web Player from Fraunhoferhhi GitHub. 
echo See the code of VVDEC Web Player: https://github.com/fraunhoferhhi/vvdecWebPlayer
echo When you agree to install, it will clone the VVDec Web Player repository using git. After git, we will copy from the VVDECWEBINSTALL files into the vvdecWebPlayer/bin folder.
echo After that, it will run Python to start the web server on your localhost port 8000.
echo If you have already installed VVDec Web Player, this will check if any upcoming updates are available.
echo Would you like to install VVDEC Web Player?
set /p okletsdoit=Answer: 
if /I "%okletsdoit%"=="Y" goto installnowplayer
if /I "%okletsdoit%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto installvvdecweb

:installnowplayer
cls
echo INSTALLING VVDEC WEB PLAYER...
if exist "vvdecWebPlayer\.git" (
    echo Updating vvdecWebPlayer...
    git -C vvdecWebPlayer pull
) else (
    echo Cloning vvdecWebPlayer...
    git clone https://github.com/fraunhoferhhi/vvdecWebPlayer
)
copy VVDECWEBINSTALL "vvdecWebPlayer/bin" /y
cd vvdecWebPlayer
copy /y ..\VVCEasy.266 dummy_raw_bitstream.266
echo Note: If you want to go back to the menu, press CTRL + C on your keyboard in Windows Terminal/CMD and type "Y" to terminate the server, and this will go back to the main menu options.
echo The Python file is running on port 8000 on your local host computer.
python wasm_test-server.py
cd ../
echo.
echo Thanks for trying out VVDEC Web Player. If you want to run on your VVDEC Web Player Server, go to the folder called vvdecWebPlayer and double click the file wasm_test-server.py.
echo Press any key to go back to the menu.
pause
goto start

:decompresswin7z
cls
title Install of Windows VVC binaries
echo Would you like to install Windows VVC binaries? Y/N?
set /p decompwinvvc=Answer: 
if /I "%decompwinvvc%"=="Y" goto decompresswin7z1
if /I "%decompwinvvc%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto decompresswin7z

:decompresswin7z1
echo Installing...
cd WindowsVVC
%sevenzip% x WindowsVVC.7z -i!%bit% -aoa
echo.
echo Checking SHA256 checksums for Windows VVC binaries...

setlocal enabledelayedexpansion
set "allok=1"

for %%F in (vvdecapp.exe vvencapp.exe vvencFFapp.exe vvencinterfacetest.exe vvenclibtest.exe vvenc_unit_test.exe) do (
    for /f "tokens=1,2" %%A in ('findstr /i "%bit%/%%F" WindowsVVC.sha256') do (
        certutil -hashfile %bit%\%%F SHA256 | find /i "%%A" >nul
        if errorlevel 1 (
            echo ERROR: SHA256 mismatch for %bit%\%%F
            set allok=0
        )
    )
)
echo.

if "!allok!"=="1" (
    echo All checksums were identical successful!
    echo Thank you for installing Windows VVC binaries. Now, back to the menu.
) else (
    echo The files do not match identical checksums for some or all files.
    echo Please try again or manually extract the compressed file.
    echo Make sure you have free disk space or/and memory RAM available.
    echo Otherwise, please create an issue to Martin Eesmaa/VVCEasy on GitHub for your problem.
)

endlocal

cd ../
echo.
pause
timeout 3
goto start

:installbitmovin
cls
title Install BitVVDecPlayer from BitMovin
echo Would you like to install on your operating system?
echo Windows for W, Mac OS for M and Linux for L, Main Menu for N.
set installmessage=Installing BitVVDecPlayer from BitMovin...
set /p installbitmovind=Answer: 
if /I "%installbitmovind%"=="W" goto installbitmovin1windows
if /I "%installbitmovind%"=="M" goto installbitmovin1macos
if /I "%installbitmovind%"=="L" goto installbitmovin1linux
if /I "%installbitmovind%"=="N" goto start
echo Invalid input. Please enter a valid letter of W, M, L or N.
pause
goto installbitmovin

:installbitmovin1windows
echo %installmessage%
if not exist "BitVVDecPlayerWIN" mkdir BitVVDecPlayerWIN
cd BitVVDecPlayerWIN
echo Downloading BitVVDecPlayer (Windows) from Bitmovin, compiled by Martin Eesmaa
wget -q https://www.dropbox.com/scl/fi/x4v1qb60u8zp505dtx8p6/BitVVDecPlayerWIN.7z?rlkey=gs9duytd6h1sos69o53rw8vyy -O BitVVDecPlayerWIN.7z
%sevenzip% x BitVVDecPlayerWIN.7z -aoa
del /q BitVVDecPlayerWIN.7z
vvDecPlayer
echo Successfully running on BitVVDecPlayer, if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo If you received error about MSVCP140.DLL is missing, you need to download Microsoft Visual C++ Redistributable of 2015-2017-2019-2022: https://docs.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist
echo To build vvDecPlayer, please go to https://github.com/bitmovin/vvDecPlayer
echo Or contact Bitmovin at https://www.bitmovin.com or create issue to VVCEasy.
goto downloadbitmovinvvcsample

:installbitmovin1macos
echo %installmessage%
if not exist "BitVVDecPlayerMAC" mkdir BitVVDecPlayerMAC
cd BitVVDecPlayerMAC
echo Downloading BitVVDecPlayer (macOS) from Bitmovin, compiled by Martin Eesmaa
wget -q https://www.dropbox.com/s/ilsoica7c8dh4hq/BitVVDecPlayerMAC.7z
%sevenzip% x BitVVDecPlayerMAC.7z -aoa
del /q BitVVDecPlayerMAC.7z
echo Download completed, please put on macOS and run it, if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo If vvDecPlayer won't work probably, it might be issue that you haven't installed Qt on your Mac OS. Please install using code: "brew install qt" on Homebrew.
echo To build vvDecPlayer, please go to https://github.com/bitmovin/vvDecPlayer
echo Or contact Bitmovin at https://www.bitmovin.com or create issue on VVCEasy.
echo For more information, see Bitmovin.md.
goto downloadbitmovinvvcsample

:installbitmovin1linux
echo %installmessage%
if not exist "BitVVDecPlayerLINUX" mkdir BitVVDecPlayerLINUX
cd BitVVDecPlayerLINUX
echo Downloading BitVVDecPlayer (Linux) from Bitmovin, compiled by Martin Eesmaa
wget -q https://www.dropbox.com/scl/fi/9jgibpwxe52zkkjijycdc/BitVVDecPlayerLINUX.AppImage?rlkey=jrqxsnwuqltc1xj9fevk9xb1f -O BitVVDecPlayerLINUX.AppImage
echo Download completed, please execute and run on your Linux machine, if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo Note, this is AppImage format to run universal Linux distros.
echo To build vvDecPlayer, please go to https://github.com/bitmovin/vvDecPlayer
echo If vvDecPlayer won't work probably, please install fuse2 on your Linux distro or/and it does not support for old operating systems.
echo Or contact Bitmovin at https://www.bitmovin.com or create issue on VVCEasy.
goto downloadbitmovinvvcsample

:downloadbitmovinvvcsample
echo Would you like to download VVC sample video files from Bitmovin? Y/N?
set /p vvcsampleyeah=Answer: 
if /I "%vvcsampleyeah%"=="Y" goto downloadvvcnowbit
if /I "%vvcsampleyeah%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto downloadbitmovinvvcsample

:downloadvvcnowbit
echo Downloading VVC sample files and Coffee Run JSON & Sprite Fright JSON from Bitmovin...
wget -q https://www.dropbox.com/s/qncefmnhw8hzr2k/vvcBlogPostDemo.7z https://www.dropbox.com/s/ogxw1pz9pr9bphi/CoffeeRun.json https://www.dropbox.com/s/6kpnoin4bwzb1ob/SpriteFright.json
echo Extracting from archived file...
%sevenzip% x vvcBlogPostDemo.7z -aoa
echo Deleting archived file...
del /q vvcBlogPostDemo.7z
title Installation of BitVVDecPlayer
echo Please edit the location downloaded folder of vvcBlogPostDemo...
CoffeeRun.json && SpriteFright.json
echo Press any key, when you done editing JSON files.
pause
echo Okay, you configured manually success. Please run vvDecPlayer on your computer.
echo Go to File tab, then Open JSON manifest in BitVVDecPlayer...
echo Select JSON file to play VVC movie and enjoy it.
echo Still not working? Please create the new issue on GitHub or join community available with Discord, Revolt and Matrix.
pause
goto start

:vlcvtmplugininstall
if /i "%bit%" == "x64" (
    echo.
) else (
    echo Sorry, VLC VTM Plugins is only available for x64/amd64 architecture
    pause
    goto start
)
cls
title VLC VTM Plugins Install (Windows and Linux)
echo Welcome to VLC Media Player of VTM Plugins Installation.
echo You need to run Windows version of Windows Vista / Windows Server 2008 to play VVC files.
echo Windows XP can't load VTM plugins, but other plugins works.
echo System type only = x64
echo Linux is now available, see Linux installation at: https://github.com/MartinEesmaa/VVCEasy/tree/master/INSTALLVLCPLUGIN#for-linux-users
echo Available: VLC 3.0.9.2 and later (it will work same latest version 3 only)
echo Would you like to install VTM plugins to your VLC Media Player? Y/N?
set /p vlcvtmyesorno=Answer: 
if /I "%vlcvtmyesorno%"=="Y" goto installvlcvtmpluginnow
if /I "%vlcvtmyesorno%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto vlcvtmplugininstall

:installvlcvtmpluginnow
echo Installing VLC VTM Plugins by Inter Digital Inc... (Compiled by Martin Eesmaa)
cd INSTALLVLCPLUGIN
:installingvlcvtmplugins
if exist "%programfiles%\VideoLAN\VLC" (
    copy libvtmdec.dll "%programfiles%\VideoLAN\VLC\plugins\codec" /y
    copy libvvcdecoder_plugin.dll "%programfiles%\VideoLAN\VLC\plugins\codec" /y
    copy libvvctsdemux_plugin.dll "%programfiles%\VideoLAN\VLC\plugins\demux" /y
) else (
    :tryagainafterinvalidvlc
    echo Please make sure your VLC is installed on your computer.
    echo After that, please try again.
    echo.
    echo 1: Try again
    echo 2: Go back to main menu
    set /p vlcnotexisttryagain=Answer: 
    if "%vlcnotexisttryagain%" == "1" goto installingvlcvtmplugins
    if "%vlcnotexisttryagain%" == "2" goto start
    echo Invalid input. Please enter a number 1 or 2.
    pause
    goto tryagainafterinvalidvlc
)
cd ../
tasklist /fi "imagename eq vlc.exe" | find /i "vlc.exe" >nul
if not errorlevel 1 taskkill /im vlc.exe >nul
echo Three dll files are patched to your VLC Media Player.
echo Restarting VLC Media Player...
echo Please load your VVC (codec) video file to VLC Media Player.
echo For more information, please go to at https://github.com/InterDigitalInc/VTMDecoder_VLCPlugin
echo Once you're finished, you don't have to patch again. You can continue VLC Media Player next time after patch.
"%programfiles%\VideoLAN\VLC\vlc.exe"
pause
goto start

:installvvdecffmpegmpvnow
echo It is available of FFmpeg and MPV VVC support. Please copy or open the link to a web browser.
echo.
echo Download link for FFmpeg: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md#ffmpeg-downloads-xhe-aac--vvc-endecoder-plugin-compiled-by-martin-eesmaa
echo Download link for MPV: https://github.com/MartinEesmaa/VVCEasy/blob/master/MPV.md#downloads-for-mpv-android-vvc-support
echo.
echo For FFmpeg, see information on FFMPEGVVC.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md
echo For MPV, see information on MPV.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/MPV.md
echo.
pause
goto start

:testsofvideo
echo Please see the paragraph in README.md.
echo https://github.com/MartinEesmaa/VVCEasy/#tests-of-vvc-videos
echo.
echo See information on FFMPEGVVC.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md
echo.
pause
goto start

:main123
title Build vvenc and vvdec by yourself from sources
cls
echo Do you want build of vvenc and vvdec yourself on your computer?
echo Before you agree to build for Windows, you need Cmake and Visual Studio on your computer.
echo Requires build to Windows VVC by Cmake 3.13.0+ (need pathed environment) and Visual Studio 2017 and later (requires Desktop C++ and only one individual component ML.NET Model Builder).
echo Requires download VVEnc and VVDec for (Git for Windows).
echo Yes: To start build. No: To go back to the main menu.
echo Y/N?
set /p main1234= Answer: 
if /I "%main1234%"=="Y" goto installmain123
if /I "%main1234%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto main123

:installmain123
echo Building time...
echo Cloning vvenc and vvdec from Fraunhofer HHI on GitHub...
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
cd vvenc
cmake -S . -B build
cmake --build build --config Release
cd ../vvdec
cmake -S . -B build
cmake --build build --config Release
cd ..
goto successnow

:successnow
echo.
echo.
echo.
echo Success build of vvenc and vvdec on Windows.
echo Copying executable files to build\%bit%
if not exist build\%bit% mkdir build\%bit%
copy /y "vvenc\bin\release-static\*.exe" "build\%bit%"
copy /y "vvdec\bin\release-static\*.exe" "build\%bit%"
echo Cleaning up of build, lib and bin folders of both dependencies...
rmdir /s /q vvenc\bin vvenc\lib vvenc\build vvdec\bin vvdec\bin vvdec\lib vvdec\build
echo Done! Press Enter to go back the menu.
pause
goto start

:error
echo Your Windows version is unsupported and outdated which does not work to run with VVC binaries and others too.
echo This batchfile script requires Windows XP and later.
pause
exit

:doserror
echo DOS is unsupported and outdated, which does not work to run with VVC binaries and others too.
echo MS-DOS, DOSBox and FreeDOS were not supported.
echo This batchfile script requires Windows XP and later.
pause
exit