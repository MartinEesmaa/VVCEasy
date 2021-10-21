echo off
cls
title Martin Eesmaa / VVCEasy
echo MARTIN EESMAA / VVCEasy
echo Welcome to VVCEasy.
pause
goto start

:start
cls
echo What do you like to do for encode/decode VVC?
echo 1. Encode (construction)
echo 2. Decode (construction)
echo 3. Help (construction)
echo 4. Exit
echo 5. Test benchmark (construction)
set /p VVCSTART=Number:
if %VVCSTART% == 1 goto encodestart
if %VVCSTART% == 2 goto decodestart
if %VVCSTART% == 3 goto help
if %VVCSTART% == 4 goto exit
if %VVCSTART% == 5 goto test

:encodestart
cls
echo Welcome to VVC encoder.
echo What do you like to make VVC encode?
echo 1. Default settings
echo 2. Best settings
echo 3. Go back to menu
set /p goodvvcenc=
if %goodvvcenc% == 1 goto defaultvvcenc1
if %goodvvcenc% == 2 goto bestvvcenc1
if %goodvvcenc% == 3 goto start

:defaultvvcenc1
echo Okay, did you encode to YUV/Y4M?
echo 1. Yes (YUV)
echo 2. Yes (Y4M)
echo 3. No
set /p encoderyu4m=
if %encoderyu4m% == 1 goto YUVdefaultsetting
if %encoderyu4m% == 2 goto Y4Mdefaultsetting
if %encoderyu4m% == 3 goto nextoptionsetting


:test
cls
title TEST BENCHMARK
echo Martin Eesmaa is testing your benchmark for two settings between default and best settings.
echo Are you ready to test? (Y/N)
set /p readytestbefore=
if %readytestbefore% == Y goto nowtestingtime
if $readytestbefore% == N goto start

:nowtestingtime
cd /d "%~dp0"
cd 7Zip

:exit
cls
title Have a nice day!
echo Have a nice day :)
echo Copyright 2021 Martin Eesmaa
echo ------------END----------------
pause
exit