![mpv-icon128](https://user-images.githubusercontent.com/88035011/169686347-e7f06fa5-01ea-4b13-9ec6-c87570873db7.png)

# MPV Windows/Android Player (libvvdec + xHE-AAC support)

MPV Windows/Android Player (libvvdec + xHE-AAC support) can play your VVC decoded video file and muxed MP4 container with VVC video codec + audio.

Screenshot preview, see top-left information of toggle stats on Windows/Android device:

![mpvandroidwithxheaacplusvvc](https://user-images.githubusercontent.com/88035011/184468869-7286272c-66e3-4b3e-b1cc-015a6e24103d.jpg)

![mpvplayerforwindowslibvvdec](https://user-images.githubusercontent.com/88035011/176990209-4c6bcc0d-ef14-4e4c-8738-edfbb9a6e1c1.png)

# Download MPV Windows/Android Player (libvvdec + xHE-AAC plugin)

[Windows 7 and later x64](https://mega.nz/file/Lx0UEZwD#K4NM9w-RQgmQpXl7rsGFugQIb1DM59v7WzxSnUDFdao)

[Windows MPV.NET VVCEasy version x64](https://mega.nz/file/21VF0RYA#IjcpER0VyAu_urc1mmQTHAFnKRX1k_YRS5WtxYrp1y0)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/DpcimBBD#kFGFlf816K6olbWhgjHK_S3aSXCKPpLSLj4o1rC3TIk)

[Android API 29 .APK Release unsigned](https://mega.nz/file/qgk2yYBZ#uHe01B1HGbLf6Rplvbm7_l2CGDeRGrhTL5JByRvVsB8)

[Android API 29 .APK Debug with gpu-next](https://mega.nz/file/249iyJIJ#8f6FOZ8K6wtOmpIVmOt-tFK1eM5i7PXuI7s3B_Esr1Q)

[Android API 29 .APK Release with gpu-next](https://mega.nz/file/K1Ulia5K#1w-2dIfJt2SZwMVQk9YaiB7J2tJcSjQWac3KAPPqu9w)

### Changelog

Please check changelog before you download the new version.

```
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

Windows/Android MPV Player doesn't work seek duration of VVC decoded file only, but only mp4 video container muxed with VVC video codec is only seek supported, including audio & subtitle too.

Some Android users for 10-bit pixel format or/and tier high might not show video in mp4 container with VVC video codec only. 

Solution: Please download latest mp4box nightly version and remux from .266 to .mp4 file again.

### Tips

Make sure to allow apps from unknown sources. Link: [Wikihow](https://www.wikihow.com/Allow-Apps-from-Unknown-Sources-on-Android)

If Google warns you, that Android MPV (libvvdec plugin) app is malicious by Play Protect, press "Install anyway" on your phone.

On Windows, there is available MPV.NET custom build on this downloads. Source code: https://github.com/stax76/mpv.net

# SHA256 SUMS
```
b9318771d287368e657751c8958b4a8f7c67f0dcfd565001c8496eff8e1c3a42  MPV-VVCEasy-API29debug.apk
1685b5126d3bf68347e412d6c04cc82d88f38eeadf0ebc334f3a9b582a7ceb0a  MPV-VVCEasy-API29release-unsigned.apk
f562ad25beb9156c675eecac74cdab66480a4ac9c1cabe69e5605c8045516fbc  MPV-VVCEasy-API29debug-gpunext.apk
c94cb197f249f317bff59d5ba20ae0d02192a6af046b62724343c6aa05aa95cc  MPV-VVCEasy-API29release-unsigned-gpunext.apk
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

**TIP: You can edit script of vvdec.sh on your own choise.**

Continue follow instructions to build your own MPV build:

https://github.com/mpv-android/mpv-android/blob/master/buildscripts/README.md

-   Martin Eesmaa
