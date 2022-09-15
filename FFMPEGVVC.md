# FFmpeg VVC En/decoder & xHE-AAC installation (Windows, Mac OS and Linux)

Windows, Mac and Linux (Preview of vvc video in ffplay):

![ffmpegplaypreview](https://user-images.githubusercontent.com/88035011/169019033-bcb7fcc7-a196-4436-a396-61db3071280c.png)
![macos_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693891-52271091-eb92-4198-82eb-2ad38296a917.png)
![linux_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693886-3f8e97da-ad57-46ab-b3eb-45e5ff4e687d.png)

# Play video file

You can play VVC video codec with .h266, .vvc, .266 and anything or .mp4 muxed with VVC codec:

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

- Pixel format ✅ (changeable of 8/10bit) 
- Video size (auto detects, but it doesn't detect for SAR and DAR anamorphic is glitch and corrupts the video ) ⚠️ (Better way to use vvencapp without FFmpeg)
- Frame rate ✅ (auto detects) 
- MP4 Muxing :x: (does not support, you need MP4BOX after encode.)
- Audio with encode VVC ⚠️ (does not support, because it can corrupt the file) To avoid corrupt file, you need to disable audio using `-an` or you could do output container for .266, .vvc and .h266 too.
- Bitrates ✅
- Passes ⚠️ (only one pass)
- Presets ⚠️ (only medium preset)
- QP/CRF ⚠️ (only you can set -global_quality command only, global_quality equals qp)
- HDR ⚠️ (default SDR, but cannot encode HDR)

Built in libvvenc for FFmpeg command:

```
ffmpeg -i example.mp4 -c:v libvvenc -global_quality 37 -pix_fmt yuv420p10 example.266
```

Additional command: You can convert to vvc video without taking a much space for vvencapp, example:

```
ffmpeg -i example.mp4 -f rawvideo -pix_fmt yuv420p - | vvencapp -i - -s 1920x1080 -r 25 --preset medium --qp 32 -o example1.266
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

### Important Windows users for old builds

If you're using the old build, please download a new build of FFmpeg VVCEasy version.

Now it's static build of Windows FFmpeg VVCEasy version.

This is a fix of Intel CPU users and updated versions.

Special thanks to @ZenKiyoshi for Intel build bug. See the issue: #16

# FFmpeg Downloads (xHE-AAC & VVC en/decoder plugin compiled by Martin Eesmaa)

[Windows](https://mega.nz/file/exE3gR6D#6ZfwCS3o9dvKPvDWXV0Ld3zAVR5jaarli_HDRkT8ImY)

[Mac OS](https://mega.nz/file/3xtTAIiQ#MPsPcz-QlSquqahmEx8ANpqleiVm2Y3L1o3R6vy7qY8)

[Linux](https://mega.nz/file/PwVmTKYB#WsTte8csnpKRPRSwTCfE7WtTvndO1cM_3UKKb1T7p0s) (Only Ubuntu 22.04 build)

# Mac OS downloaders (Important note)

Please note, this is not a malware of my compiled build, see the three screenshots to make run ffmpeg tools customised version

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
brew install libxml2 ffmpeg fdk-aac nasm
git clone https://github.com/fraunhoferhhi/vvenc
git clone https://github.com/fraunhoferhhi/vvdec
cd vvenc && mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
sudo cmake --build . --target install -j $nproc
cd ../../
cd vvdec && mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
sudo cmake --build . --target install -j $nproc
cd ../../
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-FixVVC
cd FFmpeg-FixVVC
./configure --enable-libfdk-aac --enable-libvvenc --enable-libvvdec --enable-static --enable-pic --enable-libxml2 --pkg-config-flags="--static" --enable-sdl2
make -j
```

# Linux downloaders (Important note)

Unfortunately, this is Ubuntu 22.04 LTS build only.

If you are using other linux without Ubuntu 22.04 LTS, you have to build using this:

```
sudo apt install build-essential cmake nasm autoconf pkg-config python3-setuptools libtool && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvenc && \
git clone --depth=1 https://github.com/fraunhoferhhi/vvdec && \
git clone --depth=1 https://github.com/mstorsjo/fdk-aac && \
git clone --depth=1 https://github.com/libsdl-org/SDL && \
git clone --depth=1 https://github.com/gnome/libxml2 && \
git clone --depth=1 https://github.com/MartinEesmaa/FFmpeg-FixVVC && \
wget https://gist.githubusercontent.com/MartinEesmaa/6c4c8158139e04d432f49ac005ba7528/raw/04b05601cb51eec7e5041f8a45b71caa552669c2/libvvenc.pc.in && \
cp libvvenc.pc.in vvenc/pkgconfig/ && \
cd vvenc && sudo make install-release install-prefix=/usr/local disable-lto=1 && \
cd .. && \
cd vvdec && sudo make install-release install-prefix=/usr/local disable-lto=1 && \
cd .. && \
cd fdk-aac && autoreconf -if && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd libxml2 && autoreconf -if && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && \
cd SDL && ./configure --prefix=/usr/local --enable-static --disable-shared && sudo make install -j $nproc && \
cd .. && cd FFmpeg-FixVVC && \
./configure --enable-static --pkg-config-flags="--static" --extra-ldexeflags="-static" \
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

VVC encoder programmer to FFmpeg: [@IsaMorphic](https://github.com/IsaMorphic) (Isabelle Santin) Repository: https://github.com/IsaMorphic/FFmpeg-VVC

[@MartinEesmaa](https://github.com/MartinEesmaa) (Martin Eesmaa) Repository: https://github.com/MartinEesmaa/FFmpeg-FixVVC

AC4 decoder programmer to FFmpeg: [@richardpl](https://github.com/richardpl) (Paul B Mahol) Repository: https://github.com/richardpl/FFmpeg/tree/ac4

AC4 support in mp4 container: [@AUGxhub](https://github.com/AUGxhub) Repository: https://github.com/AUGxhub/FFmpeg/tree/patch-1

-   Martin Eesmaa
