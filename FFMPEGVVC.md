# FFmpeg VVC decoder installation (Windows, Mac OS and Linux)

Windows (Preview of vvc video in ffplay):

![ffmpegplaypreview](https://user-images.githubusercontent.com/88035011/169019033-bcb7fcc7-a196-4436-a396-61db3071280c.png)

# Limitations of FFmpeg VVC decoder:

Mac OS doesn't include FFplay only for reason, only Mac OS users can convert from vvc video to any video format.

For Windows, Mac OS and Linux for preview without converting, you can do sample this, including audio support:

```
ffmpeg_g -i example.266 -i example.opus -vcodec libx264 -acodec libopus -af adelay=1000 -f matroska - | ffplay_g -
```

***NOTE: libvvdec does not support with audio.*** 

More coming soon...

-   Martin Eesmaa
