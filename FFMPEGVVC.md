# FFmpeg VVC En/decoder & xHE-AAC installation (Windows, Mac OS and Linux)

Windows, Mac and Linux (Preview of VVC video in FFplay):

![ffmpegplaypreview](https://user-images.githubusercontent.com/88035011/169019033-bcb7fcc7-a196-4436-a396-61db3071280c.png)
![macos_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693891-52271091-eb92-4198-82eb-2ad38296a917.png)
![linux_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693886-3f8e97da-ad57-46ab-b3eb-45e5ff4e687d.png)

# Play video file

You can play VVC video codec with .h266, .vvc, .266 and anything or .mp4 mixed with VVC codec:

```
ffplay_vvceasy versatile.266
```

Or if you have xHE-AAC audio codec:

```
ffplay_vvceasy -codec:a libfdk_aac -i versatile.m4a
```

# Limitations of FFmpeg VVC encoder

Before encode to VVC video codec, see the limitations below.

libvvenc (FFmpeg vvc version) works for:

- Pixel format ⚠️ (only pixel format 10 bit)
- Video size (auto detects, but it doesn't detect for SAR and DAR anamorphic is glitch and corrupts the video) ⚠️ (Better way to use vvencapp without FFmpeg)
- Frame rate ✅ (auto detects)
- MP4/TS Mux ✅ (only works for stable if it's encoded VVC with MP4 or TS on FFmpeg and mp4box for muxing still works)
- Mux MP4/TS container from raw bitstream on FFmpeg ⚠️ (the first frame freezes may just print error messages for libvvdec when muxed and seeking in FFmpeg, use mp4box for recommendation)
- Matroska mux ⚠️ (Only matroska mux has an experimental, causing problem of the video sync delay with audio and others for FFmpeg libvvdec. It is unofficial support)
- Demux ✅
- Audio with encode VVC ✅
- Broadcasting ✅ (MPEG-TS)
- Streaming ✅ (MPEG-DASH)
- Bitrates ✅
- Passes ⚠️ (you may need get passes using vvenc params on FFmpeg VVCEasy or use vvencapp)
- Presets ✅
- QP ✅
- HDR ✅

Built in libvvenc for FFmpeg command:

```
ffmpeg -i example.mp4 -c:v libvvenc -qp 37 -preset slow example.266
```

For more options for libvvenc in FFmpeg VVCEasy version, type `ffmpeg_vvceasy -h encoder=libvvenc` for available commands.

Additional command: You can convert to VVC video without taking a much space for vvencapp, example:

```
ffmpeg -i example.mp4 -pix_fmt yuv420p -f yuv4mpegpipe - | vvencapp --y4m -i - --preset medium --qp 35 -o converted.266
```

Converting xHE-AAC to AAC audio:

```
ffmpeg -c:a libfdk_aac -i mymusic.m4a -c:a aac -b:a 128k mymusic.aac
```

Replace video size for `-s` and frame rate for `-r`.

### Update 21th May 2022 of FFmpeg vvdec support

Good news, you can play .mp4 file after .h266 and audio format were merged into mp4 playable of VVC.

About [xHE-AAC](https://www.iis.fraunhofer.de/en/ff/amm/broadcast-streaming/xheaac.html), now it's available decode support xHE-AAC of FFmpeg. [Exhale](https://gitlab.com/ecodis/exhale) (encoder) is free to use and open source, but if you want Fraunhofer IIS xHE-AAC, you can download [EZ CD Audio Converter](https://www.poikosoft.com/music-converter) for Windows only. You can also merge your encoded xHE-AAC audio into mp4 too.

To make playable mp4 with audio and video together, you need VVC video encoded, audio file and [GPAC Nightly build](https://gpac.wp.imt.fr/downloads/gpac-nightly-builds/). Code for mp4box/gpac to merge VVC video encoded and audio file:
```
mp4box -add video.266 -add audio.m4a -new convertedvvc.mp4
```

Containers are also acceptable video containers of .mkv, .mp4, .mov and more.

For Linux and Mac OS users: Replace **mp4box** by **gpac**

# FFmpeg Downloads (xHE-AAC & VVC en/decoder plugin compiled by Martin Eesmaa)

[Windows x64](https://mega.nz/file/38tAUZhY#Sjn2WFVmCMCW9nkaASlHczXl4L6L8dhd5KZbEV1ozDs)

[Mac OS x86_64](https://mega.nz/file/rsNgBJaI#VcXHfakVVrxWp6-vZDj8QeYk8WD7bMaTMjWHxH8_Gao)

[Linux x64](https://mega.nz/file/2tVg1abB#2haTUj-PHGvF6xDzkw-OLYWjdVzNgJmeT4vciW_wJJo)

[FFmpeg-FixVVC archived old source code](https://mega.nz/file/G81QyT5S#jcbE1sYPEy1OMIDPCF8BPeAK-3KAGF50u23MVJzmBgw) (old)

### Note about downloads

I use always Windows to compile FFmpeg, so I forgot to compile every time for Mac OS and Linux. Also, please check changelog before you download the new version.

### Changelog
```
26/01/2024: Updated FFmpeg & vvdec. Added libxavs & libsnappy features to Windows and Linux for Chinese AVS & Vidvox Hap external video encoders.
19/01/2024: Updated FFmpeg, vvenc and vvdec.
16/01/2024: Updated FFmpeg and added libspeex & libshine encoder features into FFmpeg VVCEasy builds for Windows & Linux.
15/01/2024: Updated FFmpeg, vvenc, vvdec and other libraries. Added AMR-WB & iLBC encoder using libvo_amrwbenc & libilbc to FFmpeg for Windows and Linux (except only for ilBC encoder on Linux build), but for Linux build does not include iLBC encoder for linking failed to FFmpeg reason about PIE.
27/12/2023: Updated FFmpeg, vvenc and other libraries.
16/12/2023: Updated FFmpeg, vvenc and other libraries.
06/12/2023: Updated FFmpeg and other libraries.
28/11/2023: Updated FFmpeg and others.
22/11/2023: New FFmpeg VVCEasy Linux complete static build using BtbN FFmpeg-Builds script of my forked repository. FFplay is now working and no broken.
22/11/2023: New FFmpeg VVCEasy Windows build cross compiled on Linux using BtbN FFmpeg-Builds script of my forked repository.
17/11/2023: Enable all filters via additional configuration of GPL 3 and non-free. Updated FFmpeg and others.
12/11/2023: New FFmpeg 6.1+ latest VVCEasy build with updated vvenc, vvdec and others. Released new Mac OS x86_64 build.
10/10/2023: Updated FFmpeg features with vvenc and vvdec on Windows build.
21/09/2023: Added zimg and soxr features build configuration on Windows FFmpeg.
20/09/2023: Update vvenc & libraries on FFmpeg.
16/09/2023: Update libraries.
11/08/2023: Update vvdec.
07/08/2023: Added Ittiam Systems MPEG-H 3D Audio encoder and others were updated.
30/07/2023: Updated external features, including vvenc & vvdec. Added XPSNR filter support.
22/06/2023: Updated Linux FFmpeg by FFmpeg commits and other libraries. (still does not work for FFplay static only, others working fine)
21/06/2023: Updated vvenc and FFmpeg commits.
17/06/2023: Updated of vvenc, vvdec, dav1d, FFmpeg commits and others.
01/05/2023: Added missing libvmaf feature in FFmpeg VVCEasy only.
19/04/2023: Updated of vvenc, vvdec, FFmpeg commits and others.
03/04/2023: New FFmpeg master latest VVCEasy builds with updated vvenc, vvdec and added libvmaf & libjxl. Removed AC4 for compilation/decoder errors for new AC4 audio files.
03/02/2023: Updated vvenc library on Windows FFmpeg VVCEasy build.
02/02/2023: Updated vvenc library and others on Windows FFmpeg VVCEasy build.
29/01/2023: Updated vvenc, vvdec and other libraries on Windows FFmpeg VVCEasy build.
10/01/2023: Updated vvenc latest and others.
05/01/2023: Update Linux FFmpeg static builds (still does not work for FFplay static only, others working fine)
30/12/2022: Improved vvenc codes of FFmpeg VVCEasy, thanks Thomas Siedel from Spin Digital! TIP: Type "ffmpeg_vvceasy -h encoder=libvvenc" for FFmpeg vvenc available. See the new vvenc patch: https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=7922
23/12/2022: Update all libraries, fix MP4-ALS mono audio & added libcodec2 to FFmpeg.
07/12/2022: Update vvenc, vvdec and others. Fixed Windows N version. (#22)
20/10/2022: Add Linux static binaries of FFmpeg, but only FFplay does not work only.
11/10/2022: Removed libvorbis + updated SDL2 latest.
10/10/2022: Revert from flt to s16 for two decoders of libvorbis & libspeex.
10/10/2022: Removed libvmaf (reason: not working), added libvorbis + libspeex improve decode quality. 
30/09/2022: Improved vmaf (float, built models to FFmpeg) & updated sdl2. Update: Fixed libvmaf models
24/09/2022: Improved libvmaf up to date of FFmpeg code + update dav1d & vvenc.
07/09/2022: Added Dolby AC4 decoder + updated vvenc/vvdec.
01/09/2022: Added libopus with latest version for improve decode quality, libdav1d and libvmaf (optional if they want calculate score by vvc video and original video).
29/08/2022: Brought back vvenc.
```

# Mac OS downloaders (Important note)

Please note, this is not a malware of my compiled build, see the three screenshots to make run FFmpeg tools customized version

You need to allow the app on your Mac OS for chmod write access & Security & Privacy:

Step 1: Click cancel button, do not move to bin.

![Kuvatõmmis 2022-06-18 103427](https://user-images.githubusercontent.com/88035011/174431074-10a867d3-787a-47aa-9910-53fcef89e30e.png)

Step 2: Go to Security & Privacy on Mac OS Settings app, then check App Store & identified developers or anywhere is on. Click "Allow anyway" to unblock an application.

![Kuvatõmmis 2022-06-18 103518](https://user-images.githubusercontent.com/88035011/174431083-1d1d9b2b-5b45-425e-86d1-015e44588b4e.png)

Step 3: Click "Open" button, this does not hurt your computer.

![Kuvatõmmis 2022-06-18 103557](https://user-images.githubusercontent.com/88035011/174431086-9eb0df35-2fde-4ca7-99d4-2efa45a0a946.png)

### Build Mac OS for FFmpeg VVC build

Requirements:

Xcode

CMake

NASM

Homebrew

Code to build FFmpeg VVC version:

```
brew install libxml2 ffmpeg nasm
git clone https://github.com/fraunhoferhhi/vvenc
git clone https://github.com/fraunhoferhhi/vvdec
git clone https://github.com/mstorsjo/fdk-aac
cd vvenc && mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
sudo cmake --build . --target install -j $nproc
cd ../../
cd vvdec && mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
sudo cmake --build . --target install -j $nproc
cd ../../
cd fdk-aac && ./autogen.sh && ./configure
make -j
sudo make install
cd ../
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-VVC
cd FFmpeg-VVC
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
./configure --enable-libfdk-aac --enable-libvvenc --enable-libvvdec --enable-static --enable-pic --enable-libxml2 --pkg-config-flags="--static" --enable-sdl2
make -j
```

# Linux builders (Important for FFplay)

You can build using [Linux script](libvvdecffmpeg.sh).

If you want actually play VVC file with FFplay on your local distro, you need to remove command `--extra-ldexeflags="-static"`, otherwise it might give result segmentation fault for FFplay static only.

If compiling is success and finished, you can install FFmpeg VVC for using the code:

```
mv ffmpeg ffmpeg_vvceasy
mv ffplay ffplay_vvceasy
mv ffprobe ffprobe_vvceasy
sudo cp ffmpeg_vvceasy ffplay_vvceasy ffprobe_vvceasy /usr/local/bin
```

# Special thanks

VVC programmers of FFmpeg:

Original author: [@FFmpeg](https://github.com/FFmpeg) Repository: https://github.com/FFmpeg/FFmpeg

[@lehmann-c](https://github.com/lehmann-c) (Christian Lehmann) Repository: https://github.com/lehmann-c/FFmpeg

[@tbiat](https://github.com/tbiat) (Thibaud Biatek) Repository: https://github.com/tbiat/FFmpeg

VVC encoder programmer to FFmpeg: [@IsaMorphic](https://github.com/IsaMorphic) (Isabelle Santin) Repository: https://github.com/IsaMorphic/FFmpeg-VVC

[@MartinEesmaa](https://github.com/MartinEesmaa) (Martin Eesmaa) Repository: https://github.com/MartinEesmaa/FFmpeg-VVC

[@NuoMi](https://github.com/nuomi2021) of some codes and [Thomas Siedel](https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=8577) of new external VVC encoder & decoder.

AC4 decoder programmer to FFmpeg: [@richardpl](https://github.com/richardpl) (Paul B Mahol) Repository: https://github.com/richardpl/FFmpeg/tree/ac4

AC4 support in mp4 container: [@AUGxhub](https://github.com/AUGxhub) Repository: https://github.com/AUGxhub/FFmpeg/tree/patch-1

-   Martin Eesmaa
