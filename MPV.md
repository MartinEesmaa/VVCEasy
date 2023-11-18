![mpv-icon128](https://user-images.githubusercontent.com/88035011/169686347-e7f06fa5-01ea-4b13-9ec6-c87570873db7.png)

# MPV Windows/Linux/Android Player (libvvdec + xHE-AAC support)

MPV Windows/Linux/Android Player (libvvdec + xHE-AAC support) can play your VVC decoded video file and mixed MP4 container with VVC video codec + audio.

Screenshot preview, see top-left information of toggle stats on Windows/Linux/Android device:

![mpvandroidwithxheaacplusvvc](https://user-images.githubusercontent.com/88035011/184468869-7286272c-66e3-4b3e-b1cc-015a6e24103d.jpg)

![mpvplayerforwindowslibvvdec](https://user-images.githubusercontent.com/88035011/176990209-4c6bcc0d-ef14-4e4c-8738-edfbb9a6e1c1.png)

![mpvlinuxvvceasy](mpvlinuxvvceasy.png)

# Download MPV Windows/Android Player (libvvdec + xHE-AAC plugin)

[Windows 7 and later x64](https://mega.nz/file/fskAlKwI#uujxR9bJdP-lzYWEwOcN2E09lv11CqTNxoce6xC1JSM)

[Windows MPV.NET VVCEasy version x64](https://mega.nz/file/D0VGnaoR#BRAMuixp5YEO-pHp83Ufoyp6rTNouCC4u6nb0UO4yDQ)

[Windows MPVLIB VVCEasy version x64](https://mega.nz/file/T1kGXDCY#nvAK48k84Bg3NnWLPOUIp6ZPx1SdlhL-jGVOYs0hE7w)

[Linux MPV VVCEasy version x64](https://mega.nz/file/qgcjFJhJ#m5O4SHVlPAoZZXVH75mPa39nxJvF-OS6IuCcoXlwD-s)

[Arch Linux MPV VVCEasy version x64](https://mega.nz/file/SwchXCqJ#Ht0ym-ru9WqaGvQIjz9nAFDrD7LrdG9nHVBEhZer5YE)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/ustAHAyD#3T3VyJAPz7L5gzDNDJ-_r9Tg_uORLMu0oAjHeSsKqnE)

[Android API 29 .APK Release unsigned](https://mega.nz/file/qx8yUBrR#XiFb24NNc8Uu8ZF2slztkPMhvulun7696yiHVk61bzI)

[Android API 29 .APK Debug with gpu-next](https://mega.nz/file/3p0zyCCI#BRmCY58lwikvck0gbcyFX3IvcGu_7wxZn-mWezaD1uk)

[Android API 29 .APK Release with gpu-next](https://mega.nz/file/C5dyXbpJ#ta2DouVYLOaXeZ6VW9fLqIm7a3I2AoFxWlD-unG18T4)

### Changelog

Please check the changelog before you download the new version.

```
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

On Windows, there is available MPV.NET custom build on this download. Source code: https://github.com/stax76/mpv.net

# SHA256 SUMS
```
a6c919faec391a0b4f0abeedcf8a25ba8d7f96fc1c15b949d00e1ecc2e1ede54  MPV-VVCEasy-API29debug.apk
8ebe2d883c85f301054069a91f5f50da4fdc64a5ef00a0782f72b4bccb69caa2  MPV-VVCEasy-API29release-unsigned.apk
6cca9e73a23a376f704f60e716d1ecc206c290e908b42aab341353f304dacc58  MPV-VVCEasy-API29debug-gpunext.apk
55a4182bf4a0bec8b0236e7de3c2f169a4df33735b842b083951647dbf5bfe64  MPV-VVCEasy-API29release-unsigned-gpunext.apk
074e05a14f934eb8bd05a2964e5a53e73a0ae9f72a93372ad8b2873c883a7d0d  MPV-VVCEasy-Windows-x64.7z
c418e4e06fef4c4774b22c8ab4d2a94305678fd3be088dfb1eceb6b5ba9fbe83  MPV.NET-VVCEasy-Windows-x64.7z
140da53d1a0a7153dfe2cad43d9598c4b50782d8cf2b75b7ea84ba4ea29b991f  MPVLIB-VVCEasy-Windows-x64.7z
e051b12c2a5fd4e4bf29ec809a03dbfc3cff20b4a16d5853f97dd66851f44dab  MPV-VVCEasy-Linux-x64.7z
824015159b5a26afa6e1110c35eb71af4aaf48f36305c44d6c377943e153c7ea  MPV-VVCEasy-ArchLinux-x64.7z
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