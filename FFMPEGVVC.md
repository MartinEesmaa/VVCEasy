# FFmpeg VVC xHE-AAC & Decoder installation (Windows, Mac OS and Linux)

Windows, Mac and Linux (Preview of vvc video in ffplay):

![ffmpegplaypreview](https://user-images.githubusercontent.com/88035011/169019033-bcb7fcc7-a196-4436-a396-61db3071280c.png)
![macos_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693891-52271091-eb92-4198-82eb-2ad38296a917.png)
![linux_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693886-3f8e97da-ad57-46ab-b3eb-45e5ff4e687d.png)

# Play video file

You can play VVC video codec with .h266, .vvc, .266 and anything or .mp4 muxed with VVC codec:

```
ffplay_g versatile.266
```

# Limitations of FFmpeg VVC encoder (deprecated)

Before encode to VVC video codec, see the limitations below.

libvvenc (FFmpeg vvc version) works for:

- Pixel format ✅ (changeable of 8/10bit) 
- Video size (auto detects, but it doesn't detect for SAR and DAR anamorphic is glitch and corrupts the video ) ⚠️ (Better way to use vvencapp without FFmpeg)
- Frame rate ✅ (auto detects) 
- MP4 Muxing :x: (does not support, you need MP4BOX after encode.)
- Audio with encode VVC ⚠️ (does not support, because it can corrupt the file) To avoid corrupt file, you need to disable audio using `-an` or you could do output container for .266, .vvc and .h266 too.
- Bitrates ✅
- Passes ⚠️ (only one pass)
- Presets ⚠️ (only medium preset)
- QP/CRF ⚠️ (only you can set -global_quality command only, global_quality equals qp)

Built in libvvenc for FFmpeg command:

```
ffmpeg -i example.mp4 -c:v libvvenc -global_quality 37 -pix_fmt yuv420p10 example.266
```

Additional command: You can convert to vvc video without taking a much space for vvencapp, example:

```
ffmpeg -i example.mp4 -f rawvideo -pix_fmt yuv420p - | vvencapp -i - -s 1920x1080 -r 25 --preset medium --qp 32 -o example1.266
```

Replace video size for `-s` and frame rate for `-r`.

### Update 21th May 2022 of FFmpeg vvdec support

Good news, you can play .mp4 file after .h266 and audio format were merged into mp4 playable of VVC.

About [xHE-AAC](https://www.iis.fraunhofer.de/en/ff/amm/broadcast-streaming/xheaac.html), now it's available decode support xHE-AAC of FFmpeg. [Exhale](https://gitlab.com/ecodis/exhale) (encoder) is free to use and open source, but if you want Fraunhofer IIS xHE-AAC, you can download [EZ CD Audio Converter](https://www.poikosoft.com/music-converter) for Windows only. You can also merge your encoded xHE-AAC audio into mp4 too.

To make playable mp4 with audio and video together, you need VVC video encoded, audio file and [GPAC Nightly build](https://gpac.wp.imt.fr/downloads/gpac-nightly-builds/). Code for mp4box/gpac to merge VVC video encoded and audio file:
```
mp4box -no-probe -add video.266 -add audio.m4a -new convertedvvc.mp4
```

Containers are also acceptable video containers of .mkv, .mp4, .mov and more.

For Linux and Mac OS users: Replace **mp4box** by **gpac**

### Important Windows users for old builds

If you're using the old build, please download a new build of FFmpeg VVCEasy version.

Now it's static build of Windows FFmpeg VVCEasy version.

This is a fix of Intel CPU users and updated versions.

Special thanks to @ZenKiyoshi for Intel build bug. See the issue: #16

# FFmpeg Downloads (xHE-AAC & VVC decoder plugin compiled by Martin Eesmaa)

[Windows](https://mega.nz/file/6w8SkZRb#-x5xV1sOY7n2q_eD_qapNAQMuzXg2J2z1uPXIHYwaCY)

[Mac OS](https://mega.nz/file/K8MW0IAR#NgTpDwR5nXk3QvpKlsTDdatYS32igd_-36acbe4eyCo)

[Linux](https://mega.nz/file/PwVmTKYB#WsTte8csnpKRPRSwTCfE7WtTvndO1cM_3UKKb1T7p0s) (Only Ubuntu 22.04 build)

# Mac OS downloaders (Important note)

Please note, that is not a malware of my compiled build, see the three screenshots to make run ffmpeg tools customised version

You need to allow the app on your Mac OS for chmod write access & Security & Privacy:

Step 1: Click cancel button, do not move to bin.

![Kuvatõmmis 2022-06-18 103427](https://user-images.githubusercontent.com/88035011/174431074-10a867d3-787a-47aa-9910-53fcef89e30e.png)

Step 2: Go to Security & Privacy on Mac OS Settings app, then check App Store & identified developers or anywhere is on. Click "Allow anyway" to unblock an application.

![Kuvatõmmis 2022-06-18 103518](https://user-images.githubusercontent.com/88035011/174431083-1d1d9b2b-5b45-425e-86d1-015e44588b4e.png)

Step 3: Click "Open" button, this does not hurt your computer.

![Kuvatõmmis 2022-06-18 103557](https://user-images.githubusercontent.com/88035011/174431086-9eb0df35-2fde-4ca7-99d4-2efa45a0a946.png)

You may receive this error, if the vvc shared library was not found:
```
dyld: Library not loaded: @rpath/libvvdec.dylib
  Referenced from: /Users/martineesmaa/Downloads/dddd3/./ffplay_g
  Reason: image not found
```

The libvv(enc/dec).dylib needs to be patched of FFmpeg VVC version before run. You need patch two files to make work FFmpeg VVC version, you don't need to build if necessary:

```
sudo cp libvvenc.dylib /usr/local/lib/libvvenc.dylib
sudo cp libvvenc.dylib /usr/local/lib/libvvenc.dylib
```

Or outdated library was not found of some computers, so you can download x264 specified version of Homebrew or download new latest link of FFmpeg VVC version:
```
dyld: Library not loaded: /usr/local/opt/x264/lib/libx264.163.dylib
  Referenced from: /Users/runner/work/libvvdec_fixmywin/libvvdec_fixmywin/./ffmpeg_vvceasy_mac
  Reason: image not found
```

### Build Mac OS for FFmpeg VVC build

Requirements:

Xcode

Cmake

NASM

Homebrew

Code to build FFmpeg VVC version:

```
brew install x264 x265 libvpx libxml2 libopusenc
git clone https://github.com/fraunhoferhhi/vvenc
git clone https://github.com/fraunhoferhhi/vvdec
cd vvenc && mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=1 -DCMAKE_INSTALL_PREFIX=/usr/local ..
cmake --build . --config Release --target install
cd ../../
cd vvdec && mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=1 -DCMAKE_INSTALL_PREFIX=/usr/local ..
cmake --build . --config Release --target install
cd ../../
git clone --depth=1 https://github.com/tbiat/FFmpeg
cd FFmpeg
./configure --enable-gpl --enable-version3 --enable-libvvenc --enable-libvvdec --enable-pic --enable-libxml2 --enable-libx264 --enable-libx265 --enable-libvpx --enable-libopus --enable-sdl2
make
```

# Linux downloaders (Important note)

Unfortunately, this is Ubuntu 22.04 LTS build only.

If you are using other linux without Ubuntu 20.04 LTS, you have to build using this:

```
sudo apt install build-essential cmake nasm && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec && \
git clone --depth=1 https://github.com/mstorsjo/fdk-aac && \
git clone --depth=1 https://github.com/libsdl-org/SDL && \
git clone --depth=1 https://github.com/gnome/libxml2 && \
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-FixVVC && \
cd vvenc && sudo make install-release install-prefix=/usr/local && \
cd .. && \
cd vvdec && sudo make install-release install-prefix=/usr/local && \
cd .. && \
cd fdk-aac && autoreconf -if && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd libxml2 && autoreconf -if && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd SDL && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && cd FFmpeg-FixVVC && \
./configure --enable-static --pkg-config-flags="--static" --extra-libs="-lpthread -lm -lz" --extra-ldexeflags="-static" \
--enable-libfdk-aac --enable-libvvenc --enable-libvvdec --enable-pic \
--enable-libxml2 --enable-sdl2 && \
make -j
```

If compiling is success and finished, you can install FFmpeg VVC, using the code:

```
mv ffmpeg ffmpeg_vvceasy
mv ffplay ffplay_vvceasy
mv ffprobe ffprobe_vvceasy
sudo cp ffmpeg_vvceasy /usr/local/bin
sudo cp ffplay_vvceasy /usr/local/bin
sudo cp ffprobe_vvceasy /usr/local/bin
```

# Special thanks

VVC programmers of FFmpeg:

Original author: [@FFmpeg](https://github.com/FFmpeg) Repository: https://github.com/FFmpeg/FFmpeg

[@lehmann-c](https://github.com/lehmann-c) (Christian Lehmann) Repository: https://github.com/lehmann-c/FFmpeg

[@tbiat](https://github.com/tbiat) Repository: https://github.com/tbiat/FFmpeg

VVC encoder programmer to FFMpeg: [@IsaMorphic] Repository: https://github.com/IsaMorphic/FFmpeg-VVC

-   Martin Eesmaa
