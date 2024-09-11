echo off
set welcometitle=Martin Eesmaa / VVCEasy
set version=v2.7.0
set versionname=Martin Eesmaa at age 19, wow nice!
set vvceasydate=11 April 2024
IF EXIST "%PROGRAMFILES(X86)%" (set bit=x64) ELSE (set bit=Win32)
pushd "%~dp0"
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
        echo Installation failed.
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

goto welcomenow

:welcomenow
cls
title %welcometitle%
echo %welcometitle%
echo Welcome to VVCEasy. (Batch file Release Version, %version%, %vvceasydate%)
echo Version codename: %versionname%
echo.
echo Copyright (C) Martin Eesmaa 2021-2024 (MIT License)
pause
goto start

:start
title %welcometitle%
color 07
cls
echo VVCEasy (Batchfile Release Version, %version%, %vvceasydate%)
echo Version codename: %versionname%
echo Copyright (C) Martin Eesmaa 2021-2024 (MIT License)
echo.
echo What would you like to do to encode/decode of VVC?
echo 1. Encode
echo 2. Decode
echo 3. Help
echo 4. Exit
echo 5. Install/Test path environment.
echo 6. Install/Update VVdec Web Player (requires Python)
echo 7. Install Windows VVC binaries (Windows XP and later)
echo 8. Install vvDecPlayer from BitMovin
echo 9. Install/Update VLC VTM Plugins (Windows/Linux x64 of VLC plugins by Inter Digital Inc)
echo 10. Install FFmpeg VVC support.
echo 11. Install MPV VVC support
echo 12. Tests of VVC videos
echo 13. Build vvenc and vvdec by yourself from sources
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
if "%VVCSTART%" == "10" goto ffmpegvvdec
if "%VVCSTART%" == "11" goto mpvandroidvvc
if "%VVCSTART%" == "12" goto testsofvideo
if "%VVCSTART%" == "13" goto main123
echo Invalid input. Please enter a number between 1 and 13.
pause
goto start

:encodestart
title Encode to VVC
cls
echo Welcome to VVC encoder.
echo What do you like to encode to VVC?
echo Before we move to settings quality, is your video lossy or lossless?
echo 1. Lossy (example YouTube videos, Web videos, lossy compressed videos, and other webs)
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
echo If you do not have Y4M, your instruction will go to next...
echo 1. I have Y4M already (I am ready) 
echo 2. No, I am not ready yet (go back to previous)
echo If you don't have Y4M already... you need transcode file from your uncompressed file to Y4M.
echo Example: ffmpeg -i yourfile.mov -strict 1 yourfinal.y4m
echo Only 8-bit uncompressed movies input to Y4M.
set /p doyouhavey4mvvencquestion3=Number: 
if "%doyouhavey4mvvencquestion3%" == 1 goto startlosslessvvenc2
if "%doyouhavey4mvvencquestion3%" == 2 goto encodestart
echo Invalid input. Please enter a number 1 or 2.
pause
goto losslessvvenc2

:startlosslessvvenc2
cls
title VVC ENCODER (Y4M LOSSLESS)
echo Before we start encoding from your Y4M file to VVC file, I'm afraid I cannot do automatically for you.
echo You must manually encode to VVC, the batchfile won't work.
echo Here is code: vvencapp --qp 18 -i yourinput.y4m -s 854x480 -r 30 --preset slow --threads 16 --tier high -o yourfinalvvc.266
echo YOU HAVE TO REPLACE VIDEO SIZE AND FRAME RATE. -s is video size and -r is frame rate.
echo INPUT VIDEO BIT DEPTH IS 8-BIT ONLY FOR UNCOMPRESSED MOVIE FILES.
pause
goto start

:lossyvvenc2
title Lossy settings with Lossy compressed (VVC Encoder)
cls
echo Do you have YUV?
echo If you have YUV already, move your YUV file into C:\Program Files\VVCEasy\
echo If you do not have YUV, your instruction will go to next...
echo 1. I have YUV already (I am ready) 
echo 2. No, I am not ready yet (go back to previous)
echo If you don't have Y4M already... you need transcode file from your lossy video file to YUV.
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
echo Before we start encoding from your YUV file to VVC file, I'm afraid I cannot do automatically for you.
echo You must manually encode to VVC, the batchfile won't work.
echo Here is code: vvencapp --qp 38 -i yourinput.yuv -s 854x480 -r 30 -o youroutputlossy.266
echo YOU HAVE TO REPLACE VIDEO SIZE AND FRAME RATE. -s is video size and -r is frame rate.
echo You can also add for "--tier high" or/and 10-bit video "-c yuv420_10", if necessary.
pause
goto start

:decodestart
cls
title Decode from VVC to YUV/Y4M
echo Do you want to transcode back from VVC to YUV or Y4M? Which did you choose settings? Choosing settings will transcode back.
echo You need copy from your VVC file to C:\Program Files\VVCEasy\WindowsVVC\. Windows Explorer will open automatically.
echo After copying your VVC file into VVCEasy folder, you need rename to VVC.vvc. It will transcode from your VVC file to YUV/Y4M.
echo After transcoding, your transcoded file should be: C:\Program Files\VVCEasy\transcodedback
echo Note, if you are using portable, like your git cloned VVCEasy or downloaded source files, go to your Downloads folder and select VVCEasy.
echo Portable won't work probably, you need copy from your Downloads folder\VVCEasy into Program Files\VVCEasy.
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
mkdir transcodedback
cd WindowsVVC
vvdecapp -b VVC.vvc -o VVCTOYUV.yuv
move VVCTOYUV.yuv ../
move VVCTOYUV.yuv transcodedback
explorer "C:\Program Files\VVCEasy\transcodedback"
echo FINISHED. Going back to the menu...
timeout 3
goto start

:DECODESTARTFROMVVCTOY4M
cls
title STARTING TRANSCODING BACK FROM VVC TO Y4M...
mkdir transcodedback
cd WindowsVVC
vvdecapp -b VVC.vvc --y4m -o VVCTOYUV.y4m
move VVCTOYUV.y4m ../
move VVCTOYUV.y4m transcodedback
explorer "C:\Program Files\VVCEasy\transcodedback"
echo FINISHED. Going back to the menu...
timeout 3
goto start

:test
cls
title INSTALL/TEST PATH ENVIRONMENT
echo Martin Eesmaa is testing your paths, that you installed programs in PATH. If you're unsure, what is path?
echo You can go there for link at https://stackoverflow.com/questions/4910721/python-on-cmd-path
echo Also you can search "What is PATH in Windows?" in DuckDuckGo, Google, SearX or your favorite search engine.
echo Are you ready to test? (Y/N) or type "I" to install path environment.
set /p readytestbefore=Answer: 
if /I "%readytestbefore%"=="Y" goto nowtestingtime
if /I "%readytestbefore%"=="N" goto start
if /I "%readytestbefore%"=="I" goto installpath
echo Invalid input. Please enter a valid letter of Y, N or I.
pause
goto test

:nowtestingtime
title Testing installed programs...
7z
ffmpeg
ffplay
wget
git
python --version
echo Did that work in your PATH? Y/N?
set /p testdidworkq=Answer: 
if /I "%testdidworkq%"=="Y" goto youdidworktest
if /I "%testdidworkq%"=="N" goto ahhdidnotwork
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto nowtestingtime

:youdidworktest
title Great!
echo Great, your path environment is working. Going back to the menu...
timeout 3
goto start

:ahhdidnotwork
title Sorry...
echo Sorry, your path environment did not work. Make sure follow that needs to be add it on paths installation like Python.
echo Still not working? You can ask questions in Stack Overflow.
pause
goto start

:installpath
echo Installer path environment will be only for 7-Zip.
echo Other programs should need manual, but Python, FFmpeg, wget and git must be installed manually and add automatically path environments.
echo Do you want patch 7-Zip on your path environment, so you can type "7z" next time.
echo Would you like to install 7-Zip on your path environments? Y/N? No means go back to test menu.
set /p installpath1=Answer: 
if /I "%installpath1%"=="Y" goto installingpath
if /I "%installpath1%"=="N" goto test
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto installpath

:installingpath
title INSTALLING 7-ZIP on your path environments...
echo INSTALLING 7-ZIP on your path environments...
set PATH=%PATH%;C:\Program Files\7-Zip
echo DONE!
echo Returning to test menu...
timeout 3 /nobreak
goto test

:exit
cls
title Have a nice day!
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
echo Copyright (C) 2021-2024 Martin Eesmaa (MIT License)
echo.
echo ------------ END OF WINDOWS BATCHFILE PROGRAM ----------------
timeout 5 /nobreak
exit

:help
cls
echo Welcome to VVCEasy help instructions!
echo Here is tutorial about... How to use VVCEasy?
pause
echo Step 1: Run on VVCEasy.bat. When you see the screen of Welcome to VVCEasy. You can press any key continue to main menu.
echo Step 2: Here is the list of main menus, that you need type any number will go to direction like (goto) command.
echo Step 3: Follow the command instructions and that is easy.
pause
echo If you have any problems that you do not understand VVCEasy. Please contact Martin Eesmaa by creating issues for questions or/and problems.
echo Do you want to start over help instructions? If yes, then it will go back from the beginning. If No, going to back menu. Y/N?
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
echo When you agree to install, it will clone VVDec Web Player repository using git. After git, we will copy from VVDECWEBINSTALL files into vvdecWebPlayer/bin folder.
echo After all of that, we will run Python to start web server of your localhost port 8000.
echo If you already have installed of VVDec Web Player, you can type "U" to update files of VVDec Web Player.
echo Would you like to install VVDEC Web Player?
set /p okletsdoit=Answer: 
if /I "%okletsdoit%"=="Y" goto installnowplayer
if /I "%okletsdoit%"=="N" goto start
if /I "%okletsdoit%"=="U" goto updatevvdecwebplayer
echo Invalid input. Please enter a valid letter of Y, N or U.
pause
goto installvvdecweb

:installnowplayer
cls
title INSTALLING VVDEC WEB PLAYER...
git clone https://github.com/fraunhoferhhi/vvdecWebPlayer
copy VVDECWEBINSTALL "vvdecWebPlayer/bin" /y
cd vvdecWebPlayer
copy ..\VVCEasy.266 dummy_raw_bitstream.266
echo Note: If you want to go back to menu, press CTRL + C on your keyboard in Windows Terminal/CMD and type "Y" to terminate server and this will go back to main menu options.
echo The python file is porting 8000 on your local host computer.
python wasm_test-server.py
cd ../
echo Thanks for trying out VVDEC Web Player. If you want to run on your VVDEC Web Player Server, go to folder of vvdecWebPlayer and run one click wasm_test-server.py.
echo Press any key to go back menu.
timeout 10
goto start

:updatevvdecwebplayer
cls
title UPDATING VVDEC WEB PLAYER...
echo UPDATING VVDEC WEB PLAYER...
cd vvdecWebPlayer
git pull
cd ../
echo vvdecWebPlayer is now updated.
echo Returning to main menu...
timeout 3
goto start

:decompresswin7z
cls
title Decompress Windows VVC?
echo Would you like to decompress Windows VVC binaries? Y/N?
set /p decompwinvvc=Answer: 
if /I "%decompwinvvc%"=="Y" goto decompresswin7z1
if /I "%decompwinvvc%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto decompresswin7z

:decompresswin7z1
title WindowsVVC.7z (decompressing)
echo Decompressing........
cd WindowsVVC
7z x WindowsVVC.7z -i!%bit% -aoa
certutil -hashfile %bit%\vvdecapp.exe SHA256
certutil -hashfile %bit%\vvencapp.exe SHA256
certutil -hashfile %bit%\vvencFFapp.exe SHA256
certutil -hashfile %bit%\vvencinterfacetest.exe SHA256
certutil -hashfile %bit%\vvenclibtest.exe SHA256
type WindowsVVC.sha256 | findstr %bit%
cd ../
echo Please make sure double check that needs to be same hash. If it matches hash same as .exe of WindowsVVC.sha256 and CertUtil. This means good.
echo If the hashes are not matched correctly, please try it again or manual extract the compressed file using 7-Zip.
echo.
echo Otherwise, please create an issue to Martin Eesmaa/VVCEasy on GitHub for your own problem.
pause
echo Thank you for decompressing Windows VVC binaries. Now back to the menu.
timeout 3
goto start

:installbitmovin
cls
title Install BitVVDecPlayer from BitMovin
echo Would you like to install on your operating system?
echo Windows for W, Mac OS for M and Linux for L, Main Menu for N/n.
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
title %installmessage%
echo %installmessage%
mkdir BitVVDecPlayerWIN
cd BitVVDecPlayerWIN
echo Downloading BitVVDecPlayer (Windows) from Bitmovin, compiled by Martin Eesmaa
wget -q https://www.dropbox.com/scl/fi/x4v1qb60u8zp505dtx8p6/BitVVDecPlayerWIN.7z?rlkey=gs9duytd6h1sos69o53rw8vyy -o BitVVDecPlayerWIN.7z
7z x BitVVDecPlayerWIN.7z -aoa
del /q BitVVDecPlayerWIN.7z
vvDecPlayer
echo Successfully running on BitVVDecPlayer, if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo If you received error about MSVCP140.DLL is missing, you need to download Microsoft Visual C++ Redistributable of 2015-2017-2019-2022: https://docs.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist
echo To build vvDecPlayer, please go to https://github.com/bitmovin/vvDecPlayer
echo Or contact Bitmovin at https://www.bitmovin.com or create issue to VVCEasy.
goto downloadbitmovinvvcsample

:installbitmovin1macos
title %installmessage%
echo %installmessage%
mkdir BitVVDecPlayerMAC
cd BitVVDecPlayerMAC
echo Downloading BitVVDecPlayer (macOS) from Bitmovin, compiled by Martin Eesmaa
wget -q https://www.dropbox.com/s/ilsoica7c8dh4hq/BitVVDecPlayerMAC.7z
7z x BitVVDecPlayerMAC.7z -aoa
del /q BitVVDecPlayerMAC.7z
echo Download completed, please put to macOS and run it, if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo If vvDecPlayer won't work probably, it might be issue that you haven't installed Qt on your Mac OS. Please install using code: "brew install qt" on Homebrew.
echo To build vvDecPlayer, please go to https://github.com/bitmovin/vvDecPlayer
echo Or contact Bitmovin at https://www.bitmovin.com or create issue on VVCEasy.
echo For more information, see Bitmovin.md.
goto downloadbitmovinvvcsample

:installbitmovin1linux
title %installmessage%
echo %installmessage%
mkdir BitVVDecPlayerLINUX
cd BitVVDecPlayerLINUX
echo Downloading BitVVDecPlayer (Linux) from Bitmovin, compiled by Martin Eesmaa
wget -q https://www.dropbox.com/scl/fi/9jgibpwxe52zkkjijycdc/BitVVDecPlayerLINUX.AppImage?rlkey=jrqxsnwuqltc1xj9fevk9xb1f -o BitVVDecPlayerLINUX.AppImage
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
title Downloading VVC sample files and Coffee Run JSON & Sprite Fright JSON... from Bitmovin
echo Downloading VVC sample files and Coffee Run JSON & Sprite Fright JSON from Bitmovin...
wget -q https://www.dropbox.com/s/qncefmnhw8hzr2k/vvcBlogPostDemo.7z https://www.dropbox.com/s/ogxw1pz9pr9bphi/CoffeeRun.json https://www.dropbox.com/s/6kpnoin4bwzb1ob/SpriteFright.json
echo Extracting from archived file...
7z x vvcBlogPostDemo.7z -aoa
echo Deleting archived file...
del /q vvcBlogPostDemo.7z
title Installation of BitVVDecPlayer
echo Please edit the location downloaded folder of vvcBlogPostDemo...
CoffeeRun.json && SpriteFright.json
echo Press any key, when you finished configured of your location folder...
pause
echo Okay, it seems you configured completely. Please run vvDecPlayer on your computer.
echo Go to File, then Open JSON manifest in BitVVDecPlayer...
echo Select JSON file to run VVC movie and enjoy it.
echo Still not working? Please create the new issue on GitHub or join community available with Discord, Revolt and Matrix.
pause
goto start

:vlcvtmplugininstall
cls
title VLC VTM Plugins Install (Windows & Linux)
echo Welcome to VLC Media Player of VTM Plugins Installation.
echo You need to run Windows version of Windows Vista / Windows Server 2008 to play VVC files.
echo Windows XP can't load VTM plugins, but other plugins work.
echo System type only = x64
echo Linux is now available, see Linux installation at: https://github.com/MartinEesmaa/VVCEasy/tree/master/INSTALLVLCPLUGIN#for-linux-users
echo Available: VLC 3.0.9.2 and later latest version 3 (it will work same latest version 3)
echo Would you like to install VTM plugins to your VLC Media Player? Y/N?
set /p vlcvtmyesorno=Answer: 
if /I "%vlcvtmyesorno%"=="Y" goto installvlcvtmpluginnow
if /I "%vlcvtmyesorno%"=="N" goto start
echo Invalid input. Please enter a valid letter of W, M, L or N.
pause
goto vlcvtmplugininstall

:installvlcvtmpluginnow
title Installing of VLC VTM Plugins by Inter Digital Inc... (Compiled by Martin Eesmaa)
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
    echo After installing VLC, you can try again by pressing number one.
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
taskkill /im vlc.exe
echo Three dll files are patched to your VLC Media Player.
echo Restarting and starting VLC Media Player...
echo Please load your VVC (codec) video file to VLC Media Player.
echo For more information and options, please go at https://github.com/InterDigitalInc/VTMDecoder_VLCPlugin
echo Once you're finished, you don't have to patch again. You can continue normally VLC Media Player next time after VVCEasy.
"%programfiles%\VideoLAN\VLC\vlc.exe"
pause
goto start

:ffmpegvvdec
cls
title FFmpeg VVC support
echo Hello, would you like to download FFmpeg VVC support? Y/N?
set /p vvcnow0=Answer: 
if /I "%vvcnow0%"=="Y" goto installvvdecffmpegnow
if /I "%vvcnow0%"=="N" goto start
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto ffmpegvvdec

:installvvdecffmpegnow
echo It is available of FFmpeg VVC support. Please copy or open the link to a web browser.
echo.
echo Download link: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md#ffmpeg-downloads-xhe-aac--vvc-endecoder-plugin-compiled-by-martin-eesmaa
echo.
echo See information on FFMPEGVVC.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md
echo.
echo Press enter to go back menu.
pause
goto start

:mpvandroidvvc
echo Please see a document. The command will open the document for you.
MPV.md
echo.
echo See information MPV.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/MPV.md
echo.
echo Press enter to go back to the main menu.
pause
goto start

:testsofvideo
echo Please see the paragraph in README.md.
echo https://github.com/MartinEesmaa/VVCEasy/#tests-of-vvc-videos
echo.
echo See information on FFMPEGVVC.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md
echo.
echo Press enter to go back menu.
pause
goto start

:main123
title Build vvenc and vvdec by yourself from sources
cls
echo Do you want build of vvenc and vvdec yourself on your computer?
echo Before you agree to build for Windows, you need Cmake and Visual Studio on your computer.
echo Requires build to Windows VVC by Cmake 3.13.0+ (need pathed environment) and Visual Studio 2017 and later (requires Desktop C++ and only one individual component ML.NET Model Builder).
echo Requires download VVEnc and VVDec for (Git for Windows).
echo Yes means build. No means will exit the program.
echo Y/N?
set /p main1234= Answer: 
if /I "%main1234%"=="Y" goto installmain123
if /I "%main1234%"=="N" goto exit
echo Invalid input. Please enter a valid letter of Y or N.
pause
goto main123

:installmain123
title Building time...
echo Building time...
echo Downloading VVENC and VVDEC from Fraunhoferhhi GitHub...
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
cd vvenc
mkdir build && cd build
cmake ..
cmake --build . --config Release
cd ../../
cd vvdec
mkdir build && cd build
cmake ..
cmake --build . --config Release
cd ../../
goto successnow

:successnow
echo.
echo.
echo.
echo Successfully build of vvenc and vvdec on your Windows.
echo Copying executable files to build\%bit%
mkdir build\%bit%
copy vvenc\bin\release-static\*.exe build\%bit%
copy vvdec\bin\release-static\*.exe build\%bit%
echo Cleaning up of build, lib and bin folders of both dependencies...
rmdir /s /q vvenc\bin vvenc\lib vvenc\build vvdec\bin vvdec\bin vvdec\lib vvdec\build
echo Done! Press Enter to go back the menu.
pause
goto start

:error
echo Your Windows version is not supported and outdated which may not work to run with VVC binaries and others too.
echo This requires for Windows XP and later to use this script.
pause
exit

:doserror
echo DOS is not supported and outdated which may not work to run with VVC binaries and others too.
echo Also MS-DOS, DOSBox and FreeDOS were also not supported.
echo This requires for Windows XP and later to use this script.
pause
exit