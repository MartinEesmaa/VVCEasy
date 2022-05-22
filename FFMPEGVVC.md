# FFmpeg VVC decoder installation (Windows, Mac OS and Linux)

Windows, Mac and Linux (Preview of vvc video in ffplay):

![ffmpegplaypreview](https://user-images.githubusercontent.com/88035011/169019033-bcb7fcc7-a196-4436-a396-61db3071280c.png)
![macos_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693891-52271091-eb92-4198-82eb-2ad38296a917.png)
![linux_vvceasy_ff](https://user-images.githubusercontent.com/88035011/169693886-3f8e97da-ad57-46ab-b3eb-45e5ff4e687d.png)

# Limitations of FFmpeg VVC decoder

For Windows, Mac OS and Linux for preview without converting, you can do sample this, including audio support:

```
ffmpeg_g -i example.266 -i example.opus -vcodec libx264 -acodec libopus -af adelay=1000 -f matroska - | ffplay_g -
```

Or you can play vvc with audio support:

```
ffplay_g -i convertedvvc.mp4
```

### Update 21th May 2022 of FFmpeg vvdec support

Good news, you can play .mp4 file after .h266 and audio format were merged into mp4 playable of VVC.

About [xHE-AAC](https://www.iis.fraunhofer.de/en/ff/amm/broadcast-streaming/xheaac.html), there is no decode support of FFmpeg, the reason is a license fee, but except [Exhale](https://gitlab.com/ecodis/exhale) (encoder) is free to use and open source. However, you can also merge encoded xHE-AAC audio into mp4 too.

To make playable mp4 with audio and video together, you need VVC video encoded, audio file and [GPAC Nightly build](https://gpac.wp.imt.fr/downloads/gpac-nightly-builds/). Code for mp4box/gpac:
```
mp4box -no-probe -add video.266 -add audio.opus -new convertedvvc.mp4
```

Containers are also acceptable video containers of .mkv, .mp4, .mov and more.

For Linux and Mac OS users: Replace **mp4box** by **gpac**

# FFmpeg Downloads (VVC decoder plugin compiled by Martin Eesmaa)

[Windows](https://mega.nz/file/e1MEUAwR#c7u7vDvwzp6JiSaRDwhCyOaH4cGnx1xQDPyKgbAd-qM)

[Mac OS](https://mega.nz/file/mxNTQTLb#1ifvaXap_a_cHLCIWZ-K5B0oKXvdHjgUc3Nb-YHFIio)

[Linux](https://mega.nz/file/T8l0GTqa#oWsDDrFYjzf3LhS9zRkuqqBz6H4yJmNQUNiu_erVQLo) (Only Ubuntu 20.04 build)

# Linux downloaders (Important note)

Unfortunately, this is Ubuntu 20.04 LTS built only.

Before you use FFmpeg, make sure you install all these requirements:

```
sudo apt install libxml2 libx264-dev libx265-dev libnuma-dev libxml2 libopus-dev
```

If you are using other linux without Ubuntu 20.04 LTS, you have to build using:

```
sudo apt install build-essential cmake libx264-dev libx265-dev libnuma-dev libxml2 libopus-dev nasm && \
git clone https://github.com/fraunhoferhhi/vvdec.git && cd vvdec \
make release && make install install-prefix=/usr/local && \
cd .. && git clone https://github.com/lehmann-c/FFmpeg.git && cd FFmpeg && \
./configure --enable-gpl \
  --enable-version3 \ 
  --enable-libvvdec \ 
  --enable-pic \ 
  --enable-libxml2 \ 
  --enable-libx264 \
  --enable-libx265 \
  --enable-libopus &&
make -j
```

If compiled is success and finished, you can install FFmpeg, using the code:

```
make install
```

# Special thanks

VVC programmers of FFmpeg:

Original author: [@FFmpeg](https://github.com/FFmpeg) Repository: https://github.com/FFmpeg/FFmpeg

[@lehmann-c](https://github.com/lehmann-c) (Christian Lehmann) Repository: https://github.com/lehmann-c/FFmpeg

[@tbiat](https://github.com/tbiat) Repository: https://github.com/tbiat/FFmpeg

-   Martin Eesmaa
