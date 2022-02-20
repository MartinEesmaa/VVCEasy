echo off
pushd "%~dp0"

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

goto welcomenow

:welcomenow
cls
title Martin Eesmaa / VVCEasy
echo MARTIN EESMAA / VVCEasy
echo Welcome to VVCEasy. (Alpha version, v.0.0.1)
pause
goto start

:start
title Martin Eesmaa / VVCEasy
color 07
cls
echo What would you like to do for encode/decode of VVC?
echo 1. Encode (partial construction)
echo 2. Decode (little construction)
echo 3. Help
echo 4. Exit
echo 5. Test path environment
echo 6. Install VLC Media Player (o266player, Windows x64)
echo 7. Install quickly through Anaconda for ffmpeg (Windows)
echo 8. Install VVdec Web Player
echo 9. Decompress WindowsVVC.7z (Before you use new VVCEasy version!!!)
set /p VVCSTART=Number: 
if %VVCSTART% == 1 goto encodestart
if %VVCSTART% == 2 goto decodestart
if %VVCSTART% == 3 goto help
if %VVCSTART% == 4 goto exit
if %VVCSTART% == 5 goto test
if %VVCSTART% == 6 goto vlc
if %VVCSTART% == 7 goto conda
if %VVCSTART% == 8 goto installvvdecweb
if %VVCSTART% == 9 goto decompresswin7z

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
if %vvencquestion1% == 1 goto losslessvvenc1
if %vvencquestion1% == 2 goto lossyvvenc1
if %vvencquestion1% == 3 goto start

:losslessvvenc1
title Lossless (uncompressed)
cls
echo Okay, you chose Lossless (uncompressed).
echo Now for settings quality. Choose settings. 
echo It is recommended to use Lossless settings. Others are not recommended, will lose your video quality.
echo 1. Lossless/Best settings (Recommended)
echo 2. Lossy settings (Not recommended)
echo 3. Default settings (Not recommended)
echo 4. Go back from previous
echo 5. Go back from menu
set /p vvencquestion2=Number: 
if %vvencquestion2% == 1 goto losslessvvenc2
if %vvencquestion2% == 2 goto lossyvvenc2
if %vvencquestion2% == 3 goto defaultvvenc2
if %vvencquestion2% == 4 goto encodestart
if %vvencquestion2% == 5 goto start

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
title TEST PATH ENVIRONMENT
echo Martin Eesmaa is testing your paths, that you installed programs in PATH. Not sure, what is path?
echo You can go here: https://stackoverflow.com/questions/4910721/python-on-cmd-path
echo Also you can search "What is PATH in Windows?" in DuckDuckGo or SearX.
echo Are you ready to test? (Y/N)
set /p readytestbefore=Answer: 
if %readytestbefore% == Y goto nowtestingtime
if %readytestbefore% == N goto start
if %readytestbefore% == y goto nowtestingtime
if %readytestbefore% == n goto start

:nowtestingtime
title Testing time...
7z
ffmpeg
ffplay
wget
git
echo You need exit in Python typing "exit()".
py
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

:exit
cls
title Have a wonderful day!
echo Have a wonderful day! Thanks for using VVCEasy. :)
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
echo Copyright 2021 Martin Eesmaa
echo ------------END----------------
timeout 5 /nobreak
exit

:vlc
color 6F
title VLC Media Player (custom build of o266player)
cls
echo Hello, would you like to install VLC Media Player (v3.0.11.1 Vetinari, custom build of o266player) on your computer?
echo Before you install...
echo The VLC Media Player (custom build of o266player) works only on Windows 7 / Windows Server 2012 or earlier versions.
echo Windows Vista and older versions will not work, including Windows 8.0 won't work too, because it could be terminal error or/and cannot decode VVC format.
echo You need 64-bit / x64 to run VLC custom build. On 32-bit / x86, it will not work to run.
echo Install? Y/N?
set /p vlcinstall=Answer: 
if %vlcinstall% == Y goto vlcinstaller
if %vlcinstall% == N goto start
if %vlcinstall% == y goto vlcinstaller
if %vlcinstall% == n goto start

:vlcinstaller
wget https://www.dropbox.com/s/hs7yoa9hkxa6ugd/vlc-3.0.11.1-w64.7z
mkdir VLC
copy 7-Zip VLC
move vlc-3.0.11.1-w64.7z VLC
cd VLC
del /q readme.txt
del /q license.txt
del /q History.txt
7z x vlc-3.0.11.1-w64.7z
del /q 7z.dll
del /q 7z.exe
del /q vlc-3.0.11.1-w64.7z
cd ../
color 6E
cls
echo SUCCESSFUL! Now, would you like to download test sample VVC file test it out to VLC custom build of o266player?
echo If yes, wget will download the example of VVC file and run to VLC a few seconds.
echo If No, you will be prompted go back to menu.
echo TIP: Run VLC.exe on your own VVC file for example, if your input frame rate is 30 and you encoded to VVC same frame rate input file.
echo Example to run correctly frame rate on your VVC of VLC command: vlc.exe yourownfile.266 --no-drop-late-frames --avformat-fps=30
set /p vlccompleted=Answer: 
if %vlccompleted% == Y goto sample266
if %vlccompleted% == N goto start
if %vlccompleted% == y goto sample266
if %vlccompleted% == n goto start

:sample266
color 07
wget https://www.dropbox.com/s/zp8b3xg0b5p1pwe/VVCEasy.266
move VVCEasy.266 VLC
cd VLC
echo Note, if VLC modified version is not starting, try to run VLC Verified and Modified Version on your computer?
vlc.exe VVCEasy.266 --no-drop-late-frames --avformat-fps=24
cd ../
echo OK! Test completed successfully!
timeout 5
goto start

:conda
cls
title ANACONDA
echo Welcome to Anaconda Quick Install. This will only one task for ffmpeg. Would you like to install? Y/N?
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
echo Here is tutorial... How to use VVCEasy?
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
echo Would you like to install of VVDEC Web Player?
set /p okletsdoit=Answer: 
if %okletsdoit% == Y goto installnowplayer
if %okletsdoit% == N goto start
if %okletsdoit% == y goto installnowplayer
if %okletsdoit% == n goto start

:installnowplayer
cls
title INSTALLING VVDEC WEB PLAYER...
git clone https://github.com/fraunhoferhhi/vvdecWebPlayer.git
copy vvdecapp.js ../vvdecWebPlayer/bin
copy vvdecapp.worker.js ../vvdecWebPlayer/bin
copy vvdecapp.wasm ../vvdecWebPlayer/bin
cd vvdecWebPlayer
wget https://www.dropbox.com/s/zp8b3xg0b5p1pwe/VVCEasy.266
rename VVCEasy.266 dummy_raw_bitstream.266
echo Note: If you want to go back to menu, press CTRL + C on your keyboard in Windows Terminal/CMD and type "Y" to terminate server and this will go back to main menu options.
echo The python file is porting 8000 on your localhost computer.
py wasm_test-server.py
cd ../
echo Thanks for trying out of VVDEC Web Player. If you want to run on your VVDEC Web Player Server, go to folder of vvdecWebPlayer and run one click wasm_test-server.py.
echo Press any key to go back menu.
timeout 10
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
echo If the hashes are not matched correctly, please contact Martin Eesmaa for problem.
pause
echo Thank you for decompressing WindowsVVC.7z... Now back to menu.
timeout 3
goto start
