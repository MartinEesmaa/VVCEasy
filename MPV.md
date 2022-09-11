![mpv-icon128](https://user-images.githubusercontent.com/88035011/169686347-e7f06fa5-01ea-4b13-9ec6-c87570873db7.png)

# MPV Windows/Android Player (libvvdec + xHE-AAC support)

MPV Windows/Android Player (libvvdec + xHE-AAC support) can play your VVC decoded video file and muxed MP4 container with VVC video codec + audio.

Screenshot preview, see top-left information of toggle stats on Windows/Android device:

![mpvandroidwithxheaacplusvvc](https://user-images.githubusercontent.com/88035011/184468869-7286272c-66e3-4b3e-b1cc-015a6e24103d.jpg)

![mpvplayerforwindowslibvvdec](https://user-images.githubusercontent.com/88035011/176990209-4c6bcc0d-ef14-4e4c-8738-edfbb9a6e1c1.png)

### Important Windows users for old builds

Since 1st September 2022, now it is complete static of Windows build MPV VVCEasy.

If you're using the old build, please download a new build of MPV VVCEasy version.

This is a fix of Intel CPU users and updated version of libvvdec.

Some are now static and some are shared, because enabling static build is saying ld not found (eg. -lpython3.10) on MinGW MSYS2.

Special thanks to @ZenKiyoshi for Intel build bug. See the issue: #16

Another special thanks to @ZenKiyoshi for xHE-AAC support. Requested completed: #17

# Download MPV Windows/Android Player (libvvdec + xHE-AAC plugin)

[Windows 7 and later x64](https://mega.nz/file/r9kVEbpB#uZ1vET3fXlEutfwErYRp5b9O4BVz6yrEr6f5vkTfrHs)

[Windows MPV.NET VVCEasy version x64](https://mega.nz/file/ex1Q2KJY#8RB76uVnnmjNhX120ACiXwx2GHIvna78yLnsH7ladJM)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/m5cXXCxZ#5E1Q7GcSLjjIvRoXrSAGPLppSWbvTRKBqfY3xmKrx5s)

[Android API 29 .APK Release unsigned](https://mega.nz/file/e89XWRpJ#nZS-Pj1LG0BR4n65qq0Y2qYDrd61ShHIEkX9khQMCIc)

[Android Default 30 .APK Debug](https://mega.nz/file/KpdjSSwS#PB6nE1ihwP4mVXDxhWWXf-xUZlDD0WocKiFUhLuOsGI)

[Android Default 30 .APK Release unsigned](https://mega.nz/file/n1VQzYqQ#ybY0b-uyGF3QRSPLegd5iZLcqaEEXmPS-2GbUnBrevM)

# Limitations & Tips

MPV Android libvvdec app requires your system type of ARM64 (aarch64), x86 (i686), ARMv7 (armeabi-v7a) and x86_64 to run on Android or Windows requires to run x64.

Windows/Android MPV Player doesn't work seek duration of VVC decoded file only, but only mp4 video container muxed with VVC video codec is only seek supported, including audio & subtitle too.

Some Android users for 10-bit pixel format or/and tier high might not show video in mp4 container with VVC video codec only. 

Solution: Please download latest mp4box nightly version and remux from .266 to .mp4 file again.

### Tips

Make sure to allow apps from unknown sources. Link: [Wikihow](https://www.wikihow.com/Allow-Apps-from-Unknown-Sources-on-Android)

If Google warns you, that Android MPV (libvvdec plugin) app is malicious by Play Protect, press "Install anyway" on your phone.

On Windows, you can copy mpv-2.dll, mpv-vvceasy and mpv-vvceasy of DLL to mpv.net of https://github.com/stax76/mpv.net

# SHA256 SUMS
```
5a140d730028518d26bf3b322a1a9e3297531ca9f8674e02dd79f1d199553036  MPV-VVCEasy-API29debug.apk
21c7447aa0041e45a6d9a3ba18c8878597b7365206c80d049e21b115afde35ef  MPV-VVCEasy-API29release-unsigned.apk
b85a3196e9eacaf95a3675751d0de705dcd0eb4ad50c1e187469058c207dc29d  MPV-VVCEasy-debug.apk
d9fab828db946879fe8a6780830921e9c8c75992535241d32a6be394b3cdee80  MPV-VVCEasy-release-unsigned.apk
6bb9072d77bb59276630e7fdd479f0e3ada4eec7610e231a1fadd08ea201da61  MPV-VVCEasy-Windows-x64.7z
042d8030c7b530dbbd5b93c1bca10acd6b0cb216d90a38e5a59b82bf07d49067  MPV.NET-VVCEasy-Windows-x64.7z
```

# Build MPV Android with VVC and xHE-AAC:

If you want to build MPV Android, you need to update & upgrade first, then install packages:
```
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential cmake nasm libsimde-dev python3 git
```

Next download Temurin from Adoptium and follow the install instructions:

https://adoptium.net/installation/linux

After you installed Temurin from Adoptium, you can verify that is installed on your system:
```
java --version
```

After installing the packages on Linux, clone mpv-android-vvc repository:
```
cd ~
git clone https://github.com/MartinEesmaa/mpv-android-vvc
cd mpv-android-vvc/buildscripts
```

Give shell scripts permission in buildscripts folder:
```
chmod +x scripts/*.sh
```

Before you build, you need to search `#ifdef __ANDROID__` and delete the lines by end `#endif`:

```
nano deps/fdkaac/libSBRdec/src/lpp_tran.cpp
```

Save the file in nano editor, when you finished removing `#ifdef __ANDROID` lines.

**TIP: You can edit script of vvdec.sh on your own choise.**

Continue follow instructions to build your own MPV build:

https://github.com/mpv-android/mpv-android/blob/master/buildscripts/README.md

-   Martin Eesmaa
