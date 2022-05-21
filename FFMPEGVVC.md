# FFmpeg VVC decoder installation (Windows, Mac OS and Linux)

Windows (Preview of vvc video in ffplay):

![ffmpegplaypreview](https://user-images.githubusercontent.com/88035011/169019033-bcb7fcc7-a196-4436-a396-61db3071280c.png)

# Limitations of FFmpeg VVC decoder

Mac OS doesn't include FFplay only for reason, only Mac OS users have to convert from vvc video to any encoder video codecs available.

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

To make playable VVC with audio, you need VVC video encoded, audio file and [GPAC Nightly build](https://gpac.wp.imt.fr/downloads/gpac-nightly-builds/). Code for mp4box/gpac:
```
mp4box -no-probe -add video.266 -add audio.opus -new convertedvvc.mp4
```

For Linux and Mac OS users: Replace **mp4box** by **gpac**

More coming soon...

-   Martin Eesmaa
