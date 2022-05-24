echo off
pushd "%~dp0"
cls

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
title Martin Eesmaa / VVCEasy
echo Martin Eesmaa / VVCEasy
echo Welcome to VVCEasy. (Batchfile Beta Version, v.0.5.0)
pause
goto start

:start
title Martin Eesmaa / VVCEasy
color 07
cls
echo VVCEasy (Batchfile Beta Version, v.0.5.0)
echo.
echo What would you like to do for encode/decode of VVC?
echo 1. Encode
echo 2. Decode
echo 3. Help
echo 4. Exit
echo 5. Install/Test path environment
echo 6. Install quickly through Anaconda (Python distribution) for ffmpeg (Windows)
echo 7. Install/Update VVdec Web Player
echo 8. Decompress WindowsVVC.7z (Before you use new VVCEasy version!!!)
echo 9. Install vvDecPlayer from BitMovin
echo 10. Install VLC VTM Plugins (Windows/Linux x64 of VLC, plugins by Inter Digital Inc)
echo 11. Install FFmpeg VVDec support
echo 12. Install MPV Android (OpenVVC plugin)
set /p VVCSTART=Number: 
if %VVCSTART% == 1 goto encodestart
if %VVCSTART% == 2 goto decodestart
if %VVCSTART% == 3 goto help
if %VVCSTART% == 4 goto exit
if %VVCSTART% == 5 goto test
if %VVCSTART% == 6 goto conda
if %VVCSTART% == 7 goto installvvdecweb
if %VVCSTART% == 8 goto decompresswin7z
if %VVCSTART% == 9 goto installbitmovin
if %VVCSTART% == 10 goto vlcvtmplugininstall
if %VVCSTART% == 11 goto vvdecffmpeg
if %VVCSTART% == 12 goto mpvandroidvvc

:encodestart
title Encode to VVC
cls
echo Welcome to VVC encoder.
echo What do you like encode to VVC?
echo Before we move to settings quality, is your video lossy or lossless?
echo 1. Lossy (example YouTube videos, Web videos, lossy compressed videos, and other webs)
echo 2. Lossless (example XIPH Media, Camera uncompressed (MOV/MP4/AVI), Apple ProRes and others uncompressed files)
echo 3. Go back to menu
set /p vvencquestion1=Number: 
if %vvencquestion1% == 1 goto losslessvvenc2
if %vvencquestion1% == 2 goto lossyvvenc2
if %vvencquestion1% == 3 goto start

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
if %doyouhavey4mvvencquestion3% == 1 goto startlosslessvvenc2
if %doyouhavey4mvvencquestion3% == 2 goto encodestart

:startlosslessvvenc2
cls
title VVC ENCODER (Y4M LOSSLESS)
echo Before we start encode from your Y4M file to VVC file, I'm afraid I cannot do automatically for you.
echo You have to manually encode to VVC, the batchfile won't work.
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
if %doyouhaveyuvvvencquestion4% == 1 goto startlossyvvenc2
if %doyouhaveyuvvvencquestion4% == 2 goto encodestart

:startlossyvvenc2
cls
title VVC ENCODER (YUV LOSSY)
echo Before we start encode from your YUV file to VVC file, I'm afraid I cannot do automatically for you.
echo You have to manually encode to VVC, the batchfile won't work.
echo Here is code: vvencapp --qp 38 -i yourinput.yuv -s 854x480 -r 30 -o youroutputlossy.266
echo YOU HAVE TO REPLACE VIDEO SIZE AND FRAME RATE. -s is video size and -r is frame rate.
echo You can also add for "--tier high" or/and 10-bit video "-c yuv420_10", if necessary.
pause
pause
goto start

:decodestart
explorer "C:\Program Files\VVCEasy\WindowsVVC"
cls
title Decode from VVC to YUV/Y4M
echo Do you want to transcode back from VVC to YUV or Y4M? Which did you choose settings? Choosing settings will transcode back.
echo You need copy from your VVC file to C:\Program Files\VVCEasy\WindowsVVC\. Windows Explorer will open automatically.
echo After copying your VVC file into VVCEasy folder, you need rename to VVC.vvc. It will transcode from your VVC file to YUV/Y4M.
echo After transcoding, your transcoded file should be: C:\Program Files\VVCEasy\transcodedback
echo Note, if you are using portable, like you git cloned VVCEasy or downloaded source files, go to your Downloads folder and select VVCEasy.
echo Portable won't work probably, you need copy from your Downloads folder\VVCEasy into Program Files\VVCEasy.
echo 1. YUV (lossy video VVC)
echo 2. Y4M (lossless video VVC)
set /p decodestart1=Number: 
if %decodestart1% == 1 goto DECODESTARTFROMVVCTOYUV
if %decodestart1% == 2 goto DECODESTARTFROMVVCTOY4M

:DECODESTARTFROMVVCTOYUV
cls
title STARTING TRANSCODING BACK FROM VVC TO YUV...
mkdir transcodedback
cd WindowsVVC
vvdecapp -b VVC.vvc -o VVCTOYUV.yuv
move VVCTOYUV.yuv ../
move VVCTOYUV.yuv transcodedback
explorer "C:\Program Files\VVCEasy\transcodedback"
echo FINISHED. Going back to menu...
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
echo FINISHED. Going back to menu...
timeout 3
goto start

:test
cls
title INSTALL/TEST PATH ENVIRONMENT
echo Martin Eesmaa is testing your paths, that you installed programs in PATH. Not sure, what is path?
echo You can go here for link: https://stackoverflow.com/questions/4910721/python-on-cmd-path
echo Also you can also search "What is PATH in Windows?" in DuckDuckGo or SearX.
echo Are you ready to test? (Y/N) or type "I" to install path environment.
set /p readytestbefore=Answer: 
if %readytestbefore% == Y goto nowtestingtime
if %readytestbefore% == N goto start
if %readytestbefore% == y goto nowtestingtime
if %readytestbefore% == n goto start
if %readytestbefore% == I goto installpath
if %readytestbefore% == i goto installpath

:nowtestingtime
title Testing time...
7z
ffmpeg
ffplay
wget
git
echo You need exit in Python for typing "exit()".
python
echo Did that work in your PATH? Y/N?
set /p testdidworkq=Answer: 
if %testdidworkq% == Y goto youdidworktest
if %testdidworkq% == N goto ahhdidnotwork
if %testdidworkq% == y goto youdidworktest
if %testdidworkq% == n goto ahhdidnotwork

:youdidworktest
title Great!
echo Great, your PATHS working now. Now back to menu...
timeout 3
goto start

:ahhdidnotwork
title Sorry...
echo Sorry, your path environment did not work. Make sure follow that needs to be add it on paths installation like Python.
echo Still not working? You can ask question in Stack Overflow.
pause
goto start

:installpath
echo Installer path environment will be only for 7-Zip.
echo Others programs should need manual, but Python, FFmpeg, wget and git must be installed manually and add automatically path environments.
echo Do you want patch 7-Zip on your path environment, so you can type "7z" next time.
echo Install 7-Zip on your path environments? Y/N? No means go back to test menu.
set /p installpath1=Answer: 
if %installpath1% == Y goto installingpath
if %installpath1% == N goto test
if %installpath1% == y goto installingpath
if %installpath1% == n goto test

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
title Have a wonderful day!
echo Have a wonderful day! Thank you for using VVCEasy. :)
:::    _   _                 _                      
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
echo Copyright (C) 2021-2022 Martin Eesmaa
echo.
echo ------------ END OF THE PROGRAM ----------------
timeout 5 /nobreak
exit

:conda
cls
title ANACONDA (PYTHON DISTRIBUTION)
echo Welcome to Anaconda (Python Distribution) Quick Install. This will do only one task to download ffmpeg. Would you like to install? Y/N?
set /p anacondaman=Answer: 
if %anacondaman% == Y goto condainstall
if %anacondaman% == N goto start
if %anacondaman% == y goto condainstall
if %anacondaman% == n goto start

:condainstall
conda install -c conda-forge ffmpeg
echo SUCCESS, going to back menu...
pause
goto start

:help
cls
echo Welcome to VVCEasy help instructions!
echo Here is tutorial about... How to use VVCEasy?
pause
echo Step 1: Run on VVCEasy.bat. When you see the screen of Welcome to VVCEasy. You can press any key continue to main menu.
echo Step 2: Here are the list of main menus, that you need type any number will go to direction like (goto) command.
echo Step 3: Follow the command instructions and that is easy.
pause
echo If you have any problems that you do not understand of VVCEasy. Please contact to Martin Eesmaa by creating issues for questions or/and problems.
echo Do you want to start over help instructions? If yes, then it will go back from beginning. If No, going to back menu. Y/N?
set /p helper=Answer: 
if %helper% == Y goto help
if %helper% == N goto start
if %helper% == y goto help
if %helper% == n goto start

:installvvdecweb
cls
title VVdec Web Player.
echo Welcome to VVDEC Web Player.
echo By installing, you will have to agree to download VVDec Web Player from Fraunhoferhhi GitHub. 
echo See the code of VVDEC Web Player: https://github.com/fraunhoferhhi/vvdecWebPlayer
echo When you agree to install, it will clone of VVDec Web Player repository using git. After git, we will copy from VVDECWEBINSTALL files into vvdecWebPlayer/bin folder.
echo After all of that, we will run Python to start web server of your localhost port 8000.
echo If you already have installed of VVDec Web Player, you can type "U" to update files of VVDec Web Player.
echo Would you like to install of VVDEC Web Player?
set /p okletsdoit=Answer: 
if %okletsdoit% == Y goto installnowplayer
if %okletsdoit% == N goto start
if %okletsdoit% == y goto installnowplayer
if %okletsdoit% == n goto start
if %okletsdoit% == U goto updatevvdecwebplayer
if %okletsdoit% == u goto updatevvdecwebplayer

:installnowplayer
cls
title INSTALLING VVDEC WEB PLAYER...
git clone https://github.com/fraunhoferhhi/vvdecWebPlayer.git
copy VVDECWEBINSTALL "vvdecWebPlayer/bin" /y
cd vvdecWebPlayer
wget https://www.dropbox.com/s/zp8b3xg0b5p1pwe/VVCEasy.266
rename VVCEasy.266 dummy_raw_bitstream.266
echo Note: If you want to go back to menu, press CTRL + C on your keyboard in Windows Terminal/CMD and type "Y" to terminate server and this will go back to main menu options.
echo The python file is porting 8000 on your localhost computer.
python wasm_test-server.py
cd ../
echo Thanks for trying out of VVDEC Web Player. If you want to run on your VVDEC Web Player Server, go to folder of vvdecWebPlayer and run one click wasm_test-server.py.
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
echo Your up to date is now latest.
echo Returning to main menu...
timeout 3
goto start

:decompresswin7z
cls
title WindowsVVC.7z (decompressing)
echo Decompressing........
cd WindowsVVC
7z x WindowsVVC.7z
certutil -hashfile vvencapp.exe SHA512
certutil -hashfile vvdecapp.exe SHA512
certutil -hashfile vvencFFapp.exe SHA512
certutil -hashfile vvencinterfacetest.exe SHA512
certutil -hashfile vvenclibtest.exe SHA512
rename SHA512SUMS SHA512SUMS.txt
SHA512SUMS.txt
echo Now please make sure double check that needs to be same hash. If it is matches hash same as .exe of SHA512SUMS.txt and CertUtil. That means good.
echo If the hashes are not matched correctly, please contact and create issue to Martin Eesmaa/VVCEasy on GitHub for your own problem.
pause
echo Thank you for decompressing WindowsVVC.7z... Now back to menu.
timeout 3
goto start

:installbitmovin
cls
title Install BitVVDecPlayer from BitMovin
echo Would you like to install on your operating system?
echo Windows for W, Mac OS for M and Linux for L, Main Menu for N/n.
set /p installbitmovind=Answer: 
if %installbitmovind% == W goto installbitmovin1windows
if %installbitmovind% == w goto installbitmovin1windows
if %installbitmovind% == M goto installbitmovin1macos
if %installbitmovind% == m goto installbitmovin1macos
if %installbitmovind% == L goto installbitmovin1linux
if %installbitmovind% == l goto installbitmovin1linux
if %installbitmovind% == N goto start
if %installbitmovindt% == n goto start

:installbitmovin1windows
title Installing BitVVDecPlayer from BitMovin...
echo Installing BitVVDecPlayer from BitMovin...
mkdir BitVVDecPlayerWIN
cd BitVVDecPlayerWIN
echo Downloading BitVVDecPlayer (Windows) from Bitmovin, compiled by Martin Eesmaa
wget https://www.dropbox.com/s/75ouoeadcr2cl53/BitVVDecPlayerWIN.7z
7z x BitVVDecPlayerWIN.7z
del /q BitVVDecPlayerWIN.7z
vvDecPlayer
echo Successfully running on BitVVDecPlayer, now if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo If you receive error, that MSVCP140.DLL is missing, you might need download Microsoft Visual C++ Redistributable of 2015-2017-2019-2022: https://docs.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist
echo Or contact Bitmovin at https://www.bitmovin.com.
goto downloadbitmovinvvcsample

:installbitmovin1macos
title Installing BitVVDecPlayer from BitMovin...
echo Installing BitVVDecPlayer from BitMovin...
mkdir BitVVDecPlayerMAC
cd BitVVDecPlayerMAC
echo Downloading BitVVDecPlayer (macOS) from Bitmovin, compiled by Martin Eesmaa
wget https://www.dropbox.com/s/ilsoica7c8dh4hq/BitVVDecPlayerMAC.7z
7z x BitVVDecPlayerMAC.7z
del /q BitVVDecPlayerMAC.7z
./vvDecPlayer
echo Successfully running on vvDecPlayer, now if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo If vvDecPlayer won't work probably, it might be issue that you haven't installed Qt on your Mac OS. Please install using code: "brew install qt" on Homebrew.
echo Or contact Bitmovin at https://www.bitmovin.com.
goto downloadbitmovinvvcsample

:installbitmovin1linux
title Installing BitVVDecPlayer from BitMovin...
echo Installing BitVVDecPlayer from BitMovin...
mkdir BitVVDecPlayerLINUX
cd BitVVDecPlayerLINUX
echo Downloading BitVVDecPlayer (Linux) from Bitmovin, compiled by Martin Eesmaa
wget https://www.dropbox.com/s/bihm3pyh21lcvte/BitVVDecPlayerLINUX.7z?dl=0
7z x BitVVDecPlayerLINUX.7z
del /q BitVVDecPlayerLINUX.7z
./vvDecPlayer
echo Successfully running on vvDecPlayer, now if you have any problems, please go to Bitmovin/vvDecPlayer issues of https://github.com/bitmovin/vvDecPlayer/issues
echo You might get this message error, that you can't run vvDecPlayer without Qt framework:
echo ./vvDecPlayer: /lib/x86_64-linux-gnu/libm.so.6: version `GLIBC_2.29' not found (required by ./vvDecPlayer)
echo ./vvDecPlayer: /usr/lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.26' not found (required by ./vvDecPlayer)
echo ./vvDecPlayer: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5: version `Qt_5.12' not found (required by ./vvDecPlayer)
echo If vvDecPlayer won't work probably, it might be issue that you haven't installed Qt on your Linux. Please install using code: "sudo apt install qt5-default build-essential" on Linux terminal.
echo Or contact Bitmovin at https://www.bitmovin.com.
goto downloadbitmovinvvcsample

:downloadbitmovinvvcsample
echo Would you like to download VVC sample video files from Bitmovin? Y/N?
set /p vvcsampleyeah=Answer: 
if %vvcsampleyeah% == Y goto downloadvvcnowbit
if %vvcsampleyeah% == y goto downloadvvcnowbit
if %vvcsampleyeah% == N goto start
if %vvcsampleyeah% == n goto start

:downloadvvcnowbit
title Downloading VVC sample files and Coffee Run JSON & Sprite Fright JSON... from Bitmovin
echo Downloading VVC sample files and Coffee Run JSON & Sprite Fright JSON from Bitmovin...
wget "https://www.dropbox.com/s/qncefmnhw8hzr2k/vvcBlogPostDemo.7z" "https://www.dropbox.com/s/ogxw1pz9pr9bphi/CoffeeRun.json" "https://www.dropbox.com/s/6kpnoin4bwzb1ob/SpriteFright.json"
echo Extracting from archived file...
7z x vvcBlogPostDemo.7z
echo Deleting archived file...
del /q vvcBlogPostDemo.7z
title Installation of BitVVDecPlayer
echo Please edit of location downloaded folder of vvcBlogPostDemo...
CoffeeRun.json && SpriteFright.json
echo Press any key, when you finished configured of your location folder...
pause
echo Okay, it seems you configured completed. Please run on vvDecPlayer on your operating system.
echo Go to File, then Open JSON manifest in BitVVDecPlayer...
echo Select JSON file to run VVC movie and enjoy it.
echo Still not working? Please chat us on https://matrix.to/#/#vvceasy:matrix.org to solve your problem or add new issue on GitHub.
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
echo Current version = 3.0.16, latest version 3.0.17-4 (it will work same latest version)
echo Would you like to install VTM plugins to your VLC Media Player? Y/N?
set /p vlcvtmyesorno=Answer: 
if %vlcvtmyesorno% == Y goto installvlcvtmpluginnow
if %vlcvtmyesorno% == y goto installvlcvtmpluginnow
if %vlcvtmyesorno% == N goto start
if %vlcvtmyesorno% == n goto start

:installvlcvtmpluginnow
title Installing of VLC VTM Plugins by Inter Digital Inc... (Compiled by Martin Eesmaa)
echo Installing VLC VTM Plugins by Inter Digital Inc... (Compiled by Martin Eesmaa)
cd INSTALLVLCPLUGIN
copy libvtmdec.dll "%programfiles%\VideoLAN\VLC\plugins\codec" 
copy libvvcdecoder_plugin.dll "%programfiles%\VideoLAN\VLC\plugins\codec"
copy libvvctsdemux_plugin.dll "%programfiles%\VideoLAN\VLC\plugins\demux"
cd ../
taskkill /im vlc.exe
echo Three dll files are patched to your VLC Media Player.
echo Restarting and starting VLC Media Player...
echo Please load your VVC (codec) video file to VLC Media Player.
echo For more information and options, please go at https://github.com/InterDigitalInc/VTMDecoder_VLCPlugin
echo Once, you're finished, you don't have to patch again. You can continue normally VLC Media Player next time after VVCEasy.
"%programfiles%\VideoLAN\VLC\vlc.exe"
pause
goto start

:ffmpegvvdec
cls
title FFmpeg VVDec support
echo Hello, would you like to download FFmpeg VVDec support? Y/N?
set /p vvcnow0
if %vvcnow0% == Y goto installvvdecffmpegnow
if %vvcnow0% == N goto start
if %vvcnow0% == y goto installvvdecffmpegnow
if %vvcnow0% == n goto start

:installvvdecffmpegnow
echo Your favourite operating system is available on FFmpeg VVDec support. Please copy the link to a web browser.
echo.
echo Windows: https://mega.nz/file/e1MEUAwR#c7u7vDvwzp6JiSaRDwhCyOaH4cGnx1xQDPyKgbAd-qM
echo.
echo Mac OS: https://mega.nz/file/K09gRbYJ#SewWjY4LqVdvlivXJhqQMjrsXO6ec8a1jmapj5nO2Gs
echo.
echo Linux (Only Ubuntu 20.04 built): https://mega.nz/file/T8l0GTqa#oWsDDrFYjzf3LhS9zRkuqqBz6H4yJmNQUNiu_erVQLo
echo.
echo See information on FFMPEGVVC.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md
echo.
echo Press enter to go back menu.
pause
goto start

:mpvandroidvvc
echo Please see the document. The command will open the document for you.
MPV.md
echo.
echo See information MPV.md or online Github: https://github.com/MartinEesmaa/VVCEasy/blob/master/MPV.md
echo.
echo Press enter to go back menu.
pause
goto start
