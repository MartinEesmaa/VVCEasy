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

[Windows 7 and later x64](https://mega.nz/file/ax1CDS5Y#a4pFaa4AK92pPs9lpNf51z5sI8z3ve74luvLi2Lah0w)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/ywlyhTgY#CF3nPL4q6ughGKmh3fw84VrLiEKNcW-4ck_oBo4GDUA)

[Android API 29 .APK Release unsigned](https://mega.nz/file/fwMTGKCZ#K0DKjMwUs0uTNyVX9Cwn5pfy21-9EmBVxMFfk8TZY64)

[Android Default 30 .APK Debug](https://mega.nz/file/zgFGXYxS#w0vC8RPRheF_LIxWUGYvoPOzVj7XmFLzTYjV0Ft6OSc)

[Android Default 30 .APK Release unsigned](https://mega.nz/file/ftVwHTRZ#h5mdcyk3JURuz1vsr7sAwtN8MKXqBOjXNGk48jN0PNs)

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
f36efd2e0de74a527df939dd3a24d604cd4190a019586cab8e0197f131733c84  MPV-VVCEasy-API29debug.apk
26ad71af3c45d030897e45f9c06117cb42926dadc1482a5130042f355d8f9004  MPV-VVCEasy-API29release-unsigned.apk
b977474f162f168b462b8fb33fbaccec2ef0200246f339208913348cb5683101  MPV-VVCEasy-debug.apk
f0117f9b8f6d21ed1e2b1d29ce53c22e15e7e62ea593a9816f4fc1a544a733ba  MPV-VVCEasy-release-unsigned.apk
ff3abded30768a2831cdd80ec5f2a108595365b4796fcc453924ba3e4e3bd025  MPV-VVCEasy-Windows-x64.7z
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
