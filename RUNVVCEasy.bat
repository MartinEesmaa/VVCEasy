echo off
cd /d "%~dp0"
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
echo What do you like to do for encode/decode VVC?
echo 1. Encode (construction)
echo 2. Decode (construction)
echo 3. Help (construction)
echo 4. Exit
echo 5. Test benchmark (construction)
echo 6. Install VLC Media Player (o266player, Windows x64)
echo 7. Install quickly through Anaconda for ffmpeg (Windows)
set /p VVCSTART=Number: 
if %VVCSTART% == 1 goto encodestart
if %VVCSTART% == 2 goto decodestart
if %VVCSTART% == 3 goto help
if %VVCSTART% == 4 goto exit
if %VVCSTART% == 5 goto test
if %VVCSTART% == 6 goto vlc
if %VVCSTART% == 7 goto conda

:encodestart
title Encode
cls
echo Welcome to VVC encoder.
echo What do you like to make VVC encode?
echo 1. Default settings
echo 2. Best settings
echo 3. Go back to menu
set /p goodvvcenc=Number: 
if %goodvvcenc% == 1 goto defaultvvcenc1
if %goodvvcenc% == 2 goto bestvvcenc1
if %goodvvcenc% == 3 goto start

:defaultvvcenc1
title Did you encode to YUV/Y4M?
echo Okay, did you encode to YUV/Y4M?
echo 1. Yes (YUV)
echo 2. Yes (Y4M)
echo 3. No
set /p encoderyu4m=Number: 
if %encoderyu4m% == 1 goto YUVdefaultsetting
if %encoderyu4m% == 2 goto Y4Mdefaultsetting
if %encoderyu4m% == 3 goto nextoptionsetting

:test
cls
title TEST BENCHMARK
echo Martin Eesmaa is testing your benchmark for two settings between default and best settings.
echo Are you ready to test? (Y/N)
set /p readytestbefore=Answer: 
if %readytestbefore% == Y goto nowtestingtime
if %readytestbefore% == N goto start
if %readytestbefore% == y goto nowtestingtime
if %readytestbefore% == n goto start

:nowtestingtime
title Testing time...
cd /d "%~dp0"
cd 7-Zip

:exit
cls
title Have a nice day!
echo Have a nice day! Thanks for using VVCEasy. :)
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
echo Windows Vista and older versions won't work, because it could be terminal error or/and cannot decode VVC format.
echo You need 64-bit / x64 to run VLC custom build. On 32-bit / x86, it won't work.
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
echo If Yes, wget will download the example of VVC file and run to VLC a few seconds.
echo If No, you will be prompted go back to menu.
echo TIP: Run VLC.exe on your own VVC file for example, if your input frame rate is 30 and you encoded to VVC same frame rate input file.
echo Example to run correctly frame rate on your VVC: vlc.exe yourownfile.266 --no-drop-late-frames --avformat-fps=30
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
vlc.exe VVCEasy.266 --no-drop-late-frames --avformat-fps=24
cd ../
echo OK! Test completed!
timeout 5
goto start

:conda
cls
title ANACONDA
echo Welcome to Anaconda Quick Install. This will only one task for ffmpeg. Would you like to install? Y/N?
set /p anacondaman=
if %anacondaman% == Y goto condainstall
if %anacondaman% == N goto start
if %anacondaman% == y goto condainstall
if %anacondaman% == n goto start

:condainstall
conda install -c conda-forge ffmpeg
echo SUCCESS, going to back menu...
pause
goto start
