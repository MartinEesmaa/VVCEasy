![mpv-icon128](https://user-images.githubusercontent.com/88035011/169686347-e7f06fa5-01ea-4b13-9ec6-c87570873db7.png)

# MPV Windows/Android Player (libvvdec + xHE-AAC support)

MPV Windows/Android Player (libvvdec + xHE-AAC support) can play your VVC decoded video file and muxed MP4 container with VVC video codec + audio.

Screenshot preview, see top-left information of toggle stats on Windows/Android device:

![mpvandroidwithxheaacplusvvc](https://user-images.githubusercontent.com/88035011/184468869-7286272c-66e3-4b3e-b1cc-015a6e24103d.jpg)

![mpvplayerforwindowslibvvdec](https://user-images.githubusercontent.com/88035011/176990209-4c6bcc0d-ef14-4e4c-8738-edfbb9a6e1c1.png)

# Download MPV Windows/Android Player (libvvdec + xHE-AAC plugin)

[Windows 7 and later x64](https://mega.nz/file/OokShIzD#CU2dE3krSUiwCufB4O2EmTNL_INRlK6Aa76PZnNqXuU)

[Windows MPV.NET VVCEasy version x64](https://mega.nz/file/780DwIaB#pcsT5Zcmto2q9hlIF4I2nF_MKQZit0dyd89B-56LSo0)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/TxMDEZZA#TrR4vfCJe8xsyVfWJxNv7UtoZ8MBmKWBMmN8fr2pIWg)

[Android API 29 .APK Release unsigned](https://mega.nz/file/SwVEmDDa#dDIKgbmzPCEfqc5uY8peW3PB-YPTbNHXgukLrjtPmWw)

[Android API 29 .APK Debug with gpu-next](https://mega.nz/file/61FlFR5L#51PTo1F2t2Gv117WNsmIThckscJSjMnfU4nmD81j-1I)

[Android API 29 .APK Release with gpu-next](https://mega.nz/file/6wUwzAIK#4PoP_UrXVz0NjcEsnOaS5Zh-NLKfrUmGaCtrybO6m7s)

### Changelog

Please check changelog before you download the new version.

```
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
b22fdcdb40af54cc7e14420fd1c0a21881a09fec571c3d2a92ff6acbf86f3c25  MPV-VVCEasy-API29debug.apk
5a70234038a0d2f64b2a5fe9af5ab142ab9a9ebb4731dc3e7166b1a22b4f84c8  MPV-VVCEasy-API29release-unsigned.apk
2bd5060a36f4653e83b59413204376ee02fca2bfbc84b57faa1ebbd376a124a3  MPV-VVCEasy-API29debug-gpunext.apk
89b5787de2966158e689bafb979e32f88c1d44d7a26368e303e91789470d90c2  MPV-VVCEasy-API29release-unsigned-gpunext.apk
db5563b205755852717bb34330973a5572f1b0ae5e727bb9cb8a2c0ad2a36a13  MPV-VVCEasy-Windows-x64.7z
815c8fbdea6a8494b5900d8ddcb9b76ddb4b9c0ba10adf8e7c113c68115b682e  MPV.NET-VVCEasy-Windows-x64.7z
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
