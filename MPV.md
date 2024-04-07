![mpv-icon128](https://user-images.githubusercontent.com/88035011/169686347-e7f06fa5-01ea-4b13-9ec6-c87570873db7.png)

# MPV Windows/Linux/Android Player (libvvdec + xHE-AAC support)

MPV Windows/Linux/Android Player (libvvdec + xHE-AAC support) can play your VVC decoded video file and mixed MP4 container with VVC video codec + audio.

Screenshot preview, see top-left information of toggle stats on Windows/Linux/Android device:

![mpvandroidwithxheaacplusvvc](https://user-images.githubusercontent.com/88035011/184468869-7286272c-66e3-4b3e-b1cc-015a6e24103d.jpg)

![mpvplayerforwindowslibvvdec](https://user-images.githubusercontent.com/88035011/176990209-4c6bcc0d-ef14-4e4c-8738-edfbb9a6e1c1.png)

![mpvlinuxvvceasy](mpvlinuxvvceasy.png)

# Download MPV Windows/Linux/Android Player (libvvdec + xHE-AAC plugin)

[Windows 7 and later x64](https://mega.nz/file/v5sy0arD#673X-XfbrQYqDViVzAe8YBPQblTXdxeYqxiRh5oip4A)

[Windows MPV.NET VVCEasy version x64](https://mega.nz/file/D98jkBrY#_8A8wNkiH5dOxQeVCK4zi9rdF2gx2X-h0sYX7NH23A4)

[Windows MPVLIB VVCEasy version x64](https://mega.nz/file/K912BbIB#q-7al1uTgejrA9m4jN6ZtYOpJER7yOkxB1fIIHw2zqY)

[Windows 7 and later x86_64-v3 native](https://mega.nz/file/u1l2zTYA#HmiZtkd46EMd9pqcTnhWGC-M3nCv3Y__jLN9T7jLc-c)

[Windows MPVLIB VVCEasy version x86_64-v3 native](https://mega.nz/file/24UggbYD#CsTqPGLa4nEfs_9UheV0auISenDXqFdu465PZfRqozY)

[Linux MPV VVCEasy version x64](https://mega.nz/file/P0lznbBb#Ab8XupeUXf2Hvu9dTqd-V5A7gq1QfL2Cr1Sm2npRX7E)

[Arch Linux MPV VVCEasy version x64](https://mega.nz/file/D9dAyKRA#ym6oYWtWzABoLWrzkw6SdKjh7F7eEtk_eVMlI9dLuJc)

[Android API 29 .APK Debug (Recommended)](https://mega.nz/file/P9USgJ7Y#jHdXXciF9HLtNPHVaEn4miydETTMVwUO1PPipYEsjl0)

[Android API 29 .APK Release unsigned](https://mega.nz/file/v4M2ja6K#IQ8OwbLnRBZ7QmIzv8p9gG2rb52I_Ggss1LtYlozcEs)

# Official MPV VVC native decoder implementation

It started at January 4 2024 when the native VVC decoder is released on FFmpeg, but it was experimental without IBC (Intra Block Copy).

On February 24 2024, the finally moment about Intra Block Copy has been merged into FFmpeg's official repository, which means native VVC decoder on FFmpeg is completed and it's stable.

His hard work is very good and made by [nuomi2021](https://github.com/nuomi2021) to make native VVC decoder release to FFmpeg.

Now you can use official MPV binaries by shinchiro or my custom build of MPV VVCEasy build to play or decode VVC in MPV. Also FFmpeg too with Btbn or Gyan or VVCEasy builds. :)

Update of 21.03.2024: On March 14th 2024, the official FFmpeg native VVC decoder set to experimental for some little bugs. 

See the FFmpeg commit: https://github.com/FFmpeg/FFmpeg/commit/110d8549d575aae6b2f627cd63e2eb7082ab8926

Switched native VVC decoder back to external VVC decoder of libvvdec after native VVC decoder is experimental.

### Changelog

Please check the changelog before you download the new version.

```
07/04/2024 - Updated Android MPV VVCEasy latest build with FFmpeg for up to 7.0 with nightly, vvdec and others. Removed libxml2 for configuration and compilation error for using latest version and NDK, so next time or some times I'll put libxml2 back when problem is solved. Downgraded from mbedtls v3 to v2 to make sure include "mbedtls/certs.h" is found during FFmpeg compiling.
07/04/2024 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build with FFmpeg for up to 7.0 with nightly, MediaInfo and others.
04/04/2024 - Updated FFmpeg latest with MPV VVCEasy Linux latest version, vvdec and others.
22/03/2024 - Added Windows MPV/MPV.LIB VVCEasy native x64-v3 build with use LLVM, Clang, mimalloc and LTO on, requested by Andarwinux at issue #42 improved.
21/03/2024 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build with FFmpeg, vvdec and others. Official FFmpeg commit made native VVC decoder set to experimental, now using libvvdec to decode VVC video. Fixed issue #42.
06/03/2024 - Updated Windows MPV/MPV.NET/MPV LIB VVCEasy build with FFmpeg, vvdec and others. Switched from external VVC decoder to native VVC decoder for reduce CPU usage.
01/03/2024 - Just small added words on instructions.
29/02/2024 - Note about official Windows MPV (shinchiro) and VVCEasy builds can play stable video of VVC for playing via decode. I'll release soon later...
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

AppImage needs required fuse installed of your Linux distribution on your computer.

Some Linux distributions may not work for AppImage, which may result segmentation fault. Builded & tested on Ubuntu 22.04.2.

If you're using Arch Linux, please download the Arch Linux AppImage version.

### Tips

Make sure to allow apps from unknown sources. Link: [Wikihow](https://www.wikihow.com/Allow-Apps-from-Unknown-Sources-on-Android)

If Google warns you that Android MPV (libvvdec plugin) app claimed is malicious by Play Protect, press "Install anyway" on your phone.

On Windows, there is available MPV.NET custom build on this download. You can have look for source code: https://github.com/stax76/mpv.net

# SHA256 SUMS
```
358bdaca1461eadf4e514e0d13f1adf6512591d9a6069f043759d5161254c862  MPV-VVCEasy-API29debug.apk
8165f7eb73b06a958c1f1991037d533bef8fc94834dd274c62fb940b3eab7842  MPV-VVCEasy-API29release-unsigned.apk
0543c9819db08d777386a616ba7317ada11109ababee18a7b7ea526de7f4c69d  MPV-VVCEasy-Windows-x64.7z
2aca485d75d4a300cb5ef50230f754f3737a1557565b058298061aa87a416b3c  MPV.NET-VVCEasy-Windows-x64.7z
fb320719d3b524cb79cfdfc079a2a7c39136df5a8fbdd747006ca747cfc6a02d  MPVLIB-VVCEasy-Windows-x64.7z
8d486291a371c8663e7ddd1d9845cf54f81c316a9c795333a5b490f7621a6cb3  MPV-VVCEasy-Windows-NativeX64.7z
003dbdf1cd6639ff906c2c17dde69a16c1df7fa565cf310ba014ea24b5b330a5  MPVLIB-VVCEasy-Windows-NativeX64.7z
892216b22bcb93573b0facb35097a0823b83454a5a2e5cb386ee3181e5a47e42  MPV-VVCEasy-Linux-x64.7z
95cc275bc9ebbe646a77fb805b847aad7ea7b635f1df973b57844bcf53fe472b  MPV-VVCEasy-ArchLinux-x64.7z
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