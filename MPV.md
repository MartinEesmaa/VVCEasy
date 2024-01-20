![mpv-icon128](https://user-images.githubusercontent.com/88035011/169686347-e7f06fa5-01ea-4b13-9ec6-c87570873db7.png)

# MPV Windows/Linux/Android Player (libvvdec + xHE-AAC support)

MPV Windows/Linux/Android Player (libvvdec + xHE-AAC support) can play your VVC decoded video file and mixed MP4 container with VVC video codec + audio.

Screenshot preview, see top-left information of toggle stats on Windows/Linux/Android device:

![mpvandroidwithxheaacplusvvc](https://user-images.githubusercontent.com/88035011/184468869-7286272c-66e3-4b3e-b1cc-015a6e24103d.jpg)

![mpvplayerforwindowslibvvdec](https://user-images.githubusercontent.com/88035011/176990209-4c6bcc0d-ef14-4e4c-8738-edfbb9a6e1c1.png)

![mpvlinuxvvceasy](mpvlinuxvvceasy.png)

# Download MPV Windows/Linux/Android Player (libvvdec + xHE-AAC plugin)

[Windows 7 and later x64](https://mega.nz/file/agtEibwQ#eq2SJGn7b31o9gKjUkrUXFlv2R0X5tXh_qeqs372LXU)

[Windows MPV.NET VVCEasy version x64](https://mega.nz/file/64sSCY7R#qwv_Jr07W0G-lUK7lWk1sgnUbOVdkoRT2GoL9U0RSA8)

[Windows MPVLIB VVCEasy version x64](https://mega.nz/file/e4EQAZBa#xxFU_s0FMYi3Pat2C-MT7nA3q9BZeiDmw8MGWSTtgsE)

[Linux MPV VVCEasy version x64](https://mega.nz/file/StMQ0aCY#ZKzzLgtvdWrrnm1m8aigIA363qpSH3iwentBeGwcXUg)

[Arch Linux MPV VVCEasy version x64](https://mega.nz/file/79sWRZiB#bZmEzEAci8o1vW2jdqkCmxpiHq06idr0NcDx8f_ILZU)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/T1MAjBCQ#Ii88wsE1iIhLOr-iVCofnnWTW8eQMteQQfygxgN0XSs)

[Android API 29 .APK Release unsigned](https://mega.nz/file/rgsizBBR#Ay2cqwRIaJg_APDnVbXlj0b4JptFOq22xUe7uNbiryE)

[Android API 29 .APK Debug with gpu-next](https://mega.nz/file/3p0zyCCI#BRmCY58lwikvck0gbcyFX3IvcGu_7wxZn-mWezaD1uk)

[Android API 29 .APK Release with gpu-next](https://mega.nz/file/C5dyXbpJ#ta2DouVYLOaXeZ6VW9fLqIm7a3I2AoFxWlD-unG18T4)

### Changelog

Please check the changelog before you download the new version.

```
20/01/2024 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build with FFmpeg, vvdec and others. About vvdec update, this lowers CPU usage than previous build.
05/01/2024 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build with FFmpeg and others.
28/12/2023 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build with FFmpeg, vvdec, Mediainfo and others.
02/12/2023 - Updated FFmpeg latest with MPV VVCEasy Linux latest version and others.
01/12/2023 - Updated Android MPV VVCEasy latest build
29/11/2023 - Fixed MPV Android VVCEasy build for file picker legacy issue
29/11/2023 - Updated Android MPV VVCEasy build with latest FFmpeg, vvdec and others.
18/11/2023 - Updated FFmpeg with MPV/MPV.NET/MPV LIB VVCEasy Windows build, vvdec and others.
24/10/2023 - Updated Android MPV VVCEasy build with vvdec and others.
23/10/2023 - Removed libmujs for error shared libraries loading reason on Arch Linux.
23/10/2023 - Added X11 support to Arch Linux AppImage of MPV VVCEasy build.
23/10/2023 - Added Arch Linux support to avoid segmentation fault reason, just another new AppImage.
11/10/2023 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build, vvdec, Mediainfo and others.
20/09/2023 - Update vvenc & libraries on FFmpeg.
16/09/2023 - Update MPV Linux VVCEasy build with libraries.
14/08/2023 - Update Android MPV VVCEasy build with vvdec updated.
11/08/2023 - Update Linux MPV VVCEasy build and vvdec.
11/08/2023 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build, vvdec, Mediainfo and others.
03/08/2023 - Initial release of MPV Linux version AppImage.
05/07/2023 - Updated MPV/MPV.NET VVCEasy build.
18/06/2023 - Improved codes and new commits of Android MPV VVCEasy custom build standalone.
17/06/2023 - Cross compiled of Windows using Arch Linux for improved libraries and updated FFmpeg, MPV & MPV.NET VVCEasy build. New libmpv build.
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

Windows/Linux/Android MPV Player doesn't work seek duration of VVC decoded file only, but only mp4 video container mixed with VVC video codec is only seek supported, including audio & subtitle too.

Some Android users for 10-bit pixel format or/and tier high might not show video in mp4 container with VVC video codec only.

Solution: Please download latest mp4box nightly version and re-mux from .266 to .mp4 file again.

AppImage needs required fuse installed on your Linux distribution.

Some Linux distributions may not work for AppImage, which may result segmentation fault. Builded & tested on Ubuntu 22.04.2.

If you're using Arch Linux, please download the Arch Linux AppImage version.

### Tips

Make sure to allow apps from unknown sources. Link: [Wikihow](https://www.wikihow.com/Allow-Apps-from-Unknown-Sources-on-Android)

If Google warns you that Android MPV (libvvdec plugin) app is malicious by Play Protect, press "Install anyway" on your phone.

On Windows, there is available MPV.NET custom build on this download. You can have look for source code: https://github.com/stax76/mpv.net

# SHA256 SUMS
```
6325fabf9d7bea8886f2339d3338c2745dff088e25878176be39eec5356a8513  MPV-VVCEasy-API29debug.apk
d58559388f7f04087ff01ca809b979f76d7d6fa1c21c6377a5123876f9135f9e  MPV-VVCEasy-API29release-unsigned.apk
6cca9e73a23a376f704f60e716d1ecc206c290e908b42aab341353f304dacc58  MPV-VVCEasy-API29debug-gpunext.apk
55a4182bf4a0bec8b0236e7de3c2f169a4df33735b842b083951647dbf5bfe64  MPV-VVCEasy-API29release-unsigned-gpunext.apk
637c6fd905643b850885be12bb96dd7e8721b3060ca03cc465c163a411f3f2fd  MPV-VVCEasy-Windows-x64.7z
f781262bd993a8eb13570fb9a837b509221a14b64520aebf6fefcf08f5218875  MPV.NET-VVCEasy-Windows-x64.7z
c27ba7202a650578cb36df26f4466c958a959992a7ec3ec2f5533e55ba53a127  MPVLIB-VVCEasy-Windows-x64.7z
8baab60eca7d6047f59629219d54459de50e07348ef6d3a2f6f7dec015d99da2  MPV-VVCEasy-Linux-x64.7z
22f0b865dea27ef4978d897bb733dd8ad32be98eefb9eb087f4201767e2b2fa6  MPV-VVCEasy-ArchLinux-x64.7z
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