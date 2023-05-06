![mpv-icon128](https://user-images.githubusercontent.com/88035011/169686347-e7f06fa5-01ea-4b13-9ec6-c87570873db7.png)

# MPV Windows/Android Player (libvvdec + xHE-AAC support)

MPV Windows/Android Player (libvvdec + xHE-AAC support) can play your VVC decoded video file and mixed MP4 container with VVC video codec + audio.

Screenshot preview, see top-left information of toggle stats on Windows/Android device:

![mpvandroidwithxheaacplusvvc](https://user-images.githubusercontent.com/88035011/184468869-7286272c-66e3-4b3e-b1cc-015a6e24103d.jpg)

![mpvplayerforwindowslibvvdec](https://user-images.githubusercontent.com/88035011/176990209-4c6bcc0d-ef14-4e4c-8738-edfbb9a6e1c1.png)

# Download MPV Windows/Android Player (libvvdec + xHE-AAC plugin)

[Windows 7 and later x64](https://mega.nz/file/Lx0UEZwD#K4NM9w-RQgmQpXl7rsGFugQIb1DM59v7WzxSnUDFdao)

[Windows MPV.NET VVCEasy version x64](https://mega.nz/file/21VF0RYA#IjcpER0VyAu_urc1mmQTHAFnKRX1k_YRS5WtxYrp1y0)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/f9EFELab#7mAClMyhd-95IUd849J8lVOxTT8ynaEaNCyTjuO9pKk)

[Android API 29 .APK Release unsigned](https://mega.nz/file/eodkmZ6J#kuIE1jji1alowiqvoDvH8ZTh-jP1QxxADe6kIZ0Uj8U)

[Android API 29 .APK Debug with gpu-next](https://mega.nz/file/3p0zyCCI#BRmCY58lwikvck0gbcyFX3IvcGu_7wxZn-mWezaD1uk)

[Android API 29 .APK Release with gpu-next](https://mega.nz/file/C5dyXbpJ#ta2DouVYLOaXeZ6VW9fLqIm7a3I2AoFxWlD-unG18T4)

### Changelog

Please check the changelog before you download the new version.

```
04/04/2023 - New Android MPV VVCEasy build with new FFmpeg VVCEasy libraries for updated vvenc and vvdec. For gpu-next build, still experimental.
03/04/2023 - New MPV and MPV.NET latest VVCEasy build with new FFmpeg VVCEasy libraries for updated vvenc, vvdec and added libjxl, shaderc, libplacebo and vulkan to make gpu-next available.
29/03/2023 - Update MPV Android package and icons. Tip: You can have two builds between official and VVCEasy build.
19/02/2023 - Add Android TV support of APK builds & update Android MPV VVCEasy builds.
15/02/2023 - Added Android MPV VVCEasy build with gpu-next support.
14/02/2023 - Update Android MPV VVCEasy build latest, but vulkan support is removed for some reason.
29/01/2023 - Updated vvdec code, mpv.net and others on Windows MPV VVCEasy build.
11/01/2023 - Updated vvdec, added Vulkan with shaderc on MPV Android VVCEasy build.
11/10/2022 - Removed libvorbis + updated SDL2 & mpv.net latest.
10/10/2022 - libplacebo removed (does not work Dolby Vision with my custom build) + update mpv, added zimg, & two improved decoders of libspeex & libvorbis.
11/09/2022 - Complete static adding LDFLAGS="-static" to fix new Intel CPU processor users for mpv.net.
11/09/2022 - Added libplacebo + ffnvcodec.
11/09/2022 - Added optional features: SDL2 gamepad, dvdnav & libbluray.
10/09/2022 - Initial release of MPV.NET.
01/09/2022 - New complete static of Windows MPV VVCEasy build.
```

# Limitations & Tips

MPV Android libvvdec app requires your system type of ARM64 (aarch64), x86 (i686), ARMv7 (armeabi-v7a) and x86_64 to run on Android or Windows requires to run x64.

Windows/Android MPV Player doesn't work seek duration of VVC decoded file only, but only mp4 video container mixed with VVC video codec is only seek supported, including audio & subtitle too.

Some Android users for 10-bit pixel format or/and tier high might not show video in mp4 container with VVC video codec only. 

Solution: Please download latest mp4box nightly version and re-mux from .266 to .mp4 file again.

### Tips

Make sure to allow apps from unknown sources. Link: [Wikihow](https://www.wikihow.com/Allow-Apps-from-Unknown-Sources-on-Android)

If Google warns you that Android MPV (libvvdec plugin) app is malicious by Play Protect, press "Install anyway" on your phone.

On Windows, there is available MPV.NET custom build on this download. Source code: https://github.com/stax76/mpv.net

# SHA256 SUMS
```
87af341d40f6010287f8afd80251c050bc5fe99c663033a97c32d52fb570650f  MPV-VVCEasy-API29debug.apk
9f6b12d045085560a5f3c957ac66e40c4d4d6f04d65ed2144618e86d3269663b  MPV-VVCEasy-API29release-unsigned.apk
6cca9e73a23a376f704f60e716d1ecc206c290e908b42aab341353f304dacc58  MPV-VVCEasy-API29debug-gpunext.apk
55a4182bf4a0bec8b0236e7de3c2f169a4df33735b842b083951647dbf5bfe64  MPV-VVCEasy-API29release-unsigned-gpunext.apk
35bb3422e977edb65405bd26e4de9b64705e08455fd8e3561a9610628f0bafab  MPV-VVCEasy-Windows-x64.7z
bcdd83d7d6e393e990808cdc19b7580e5d98c537c42eb67e9774f86b22f5e533  MPV.NET-VVCEasy-Windows-x64.7z
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
cd
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

**TIP: You can edit script of vvdec.sh on your own choice.**

Continue follow instructions to build your own MPV build:

https://github.com/mpv-android/mpv-android/blob/master/buildscripts/README.md

-   Martin Eesmaa