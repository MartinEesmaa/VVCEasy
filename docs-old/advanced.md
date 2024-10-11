# Without VVCEasy, experimental option for professional coders, other developers, and everyone (hard, deprecated)

You need 7-Zip (requires ffmpeg and ffplay), ffmpeg, ffplay, vvenc/vvdec(app).

Here are the links:
FFMPEG/FFPLAY: https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z (go to bin folder and extract two files of ffmpeg and ffplay)
VVENC/VVDEC (Windows, Mac and Linux):
Windows: https://github.com/MartinEesmaa/VVCEasy/blob/master/WindowsVVC/WindowsVVC.7z
Mac: https://github.com/MartinEesmaa/VVCEasy/tree/master/MacOSVVC/MacOSVVC.7z
Linux: https://github.com/MartinEesmaa/VVCEasy/blob/master/LinuxVVC/LinuxVVC.7z

Before we start, you need to make path environments for ffmpeg, ffplay and vvenc/vvdec to make easily.
In Command Prompt (Windows):

```
set PATH=%PATH%;C:\Users\blah\Downloads\VVCEasy\Executables
```
Verify path using Windows Command Prompt/Windows Terminal (CMD):
```
path
```

First:
Transcode any video formats to YUV/Y4M

**We recommend that you use from video to yuv/y4m for pixel format YUV420P, because YUV420P is smaller size than YUV420P10.**

**VVENC only supports pixel formats of YUV420 (8-bit) and YUV420_10 (10-bit), otherwise it will corrupt after vvc encoding.**

For YUV transcode (lossy from web quality, YouTube videos and others):
```
ffmpeg -i input.mp4 -pix_fmt yuv420p inputtranscode.yuv
```

For Y4M transcode (lossless from uncompressed video files, only 8 bit):
```
ffmpeg -i input.mp4 -pix_fmt yuv420p inputtranscode.y4m
```

Verify uncompressed video using FFplay before encode to VVENC (important add video size after the input file, else it will not correctly show video like scrambled eggs video):
```
ffplay inputtranscode.yuv -video_size 1280x720
``` 

Default pixel format of ffplay for yuv and y4m is yuv420p without `-pix_fmt` command.

For y4m, replace `-i inputtranscode.yuv` with `-i inputtranscode.y4m`. In `-c:v wrapped_avframe` for y4m only, so you can verify to play Y4M (wrapped_avframe) for VLC, FFplay or MPV player. For yuv420p10 on your input video 10 bits, add `-pix_fmt yuv420p10`.

Playing FFplay for y4m video with wrapped_avframe, you don't need to put anything commands, just simple play this:

```
ffplay transcoded.y4m
```

For easy to verify YUV/Y4M, use YUView, open your YUV or Y4M encoded, make sure video size, YUV/Y4M format and frame rate same like from input video file (e.g., MP4, AVI, MKV and others).

After verifying correctly of your YUV/Y4M video
Encode with VVENC (Simple settings, example)
```
vvencapp -i out.yuv -s 854x480 -r 30 -o vvc.266
```
`-s` means video size, `-r` means frame per second and `-o` means output. Note: (Simple) as Default settings is YUV420P (8-bit)

TIP: You could do the alternative without taking much disk space for uncompressed video (Y4M, recommended):

```
ffmpeg -i example.mp4 -pix_fmt yuv420p -f yuv4mpegpipe - | vvencapp --y4m -i - --preset medium --qp 35 -o converted.266
```

**PRO TIP: VVENC can detect your fps and video size for y4m file format, so you don't need to insert video size and frame per second of vvenc.**

**WARNING of vvenc pipe: VVENC does not support two-pass mode only when using pipe call/read from FFmpeg to vvenc.**

Or you could do legacy of YUV pipe video:

```
ffmpeg -i example.mp4 -pix_fmt yuv420p -f rawvideo - | vvencapp -i - -s 1920x1080 -r 25 --preset medium --qp 35 -o converted.266
```

**WARNING: If you encode from yuv/y4m of your frame rate is 11.988, 14.985, 23.976, 29.970 or 59.940 FPS, replace this command -r by --fps.**

11.988 fps = `--fps 12000/1001`

14.985 fps = `--fps 15000/1001`

23.976 fps = `--fps 24000/1001`

29.970 fps = `--fps 30000/1001`

59.940 fps = `--fps 60000/1001`

The default of VVENC: Quantization Parameter is 32 and preset is medium.

If you want to get smaller video size and lossy video, add `--qp 38`. (For web video or anything)

If you want to get lossless video without losing quality (visually lossless, minimum loss quality), use QP 16-19 and preset slow (optional slower). (Recommended for movies, camera footage or anything)

Lossy video/Smallest video size:
```
vvencapp --qp 38 -i out.yuv -s 854x480 -r 30 -o vvc.266
```

**NOTE 1: If you want to have true lossless on your video, please use H.264 Lossless video codec or VVC with vvencffapp command of CostMode Lossless**

**NOTE 1.1: In vvencffapp application, you can add command `--CostMode lossless`. Y4M accepts chroma subsampling 420 only, but YUV accepts 400, 420, 422 and 444.**

True lossless video of 8-bit and 10-bit 4:2:0:
```
vvencffapp -i test.y4m --CostMode lossless -qpa 1 -b test.266
```

Visually lossless video (or compress smaller than preset slow, use --preset slower):
```
vvencapp --qp 18 -i out.yuv -s 854x480 -r 30 --preset slow -o vvc.266
```

For Apple macOS and Linux terminal users: Command with `./vvencapp`

For Windows Users using Windows PowerShell: Command with `.\vvencapp`

Encode with VVENC (Best settings (visually lossless), replace video size (`-s`), frame rate (`-r`) and maximize threads of your cores (`--threads`), example) (Minimum loss quality) If you want true lossless video, use H.264 Lossless video codec or VVC with vvencffapp command of CostMode Lossless. (Necessary make smaller file (slower) than preset slow, use `--preset slower`)
```
vvencapp --qp 18 -i out.yuv -s 854x480 -r 30 --preset slow --threads 16 --tier high -o EXTREME.266
```

NOTE: It is acceptable only for encoding to .h266, .266 and .vvc file container.

Note to 10-bit YUV users: If you encode YUV 10 bit to VVC file, add `-c yuv420_10` before you type the ending word of -o EXTREME.266.

Note to 8-bit Y4M users: It's only from input video (8-bit) to Y4M (8 bit)

After encoding VVC, you can play using my custom VVCEasy build of [FFmpeg](https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md), [VLC](https://github.com/MartinEesmaa/VVCEasy/tree/master/INSTALLVLCPLUGIN) or [MPV](https://github.com/MartinEesmaa/VVCEasy/blob/master/MPV.md).
Drag your video file of .h266, .266 or .vvc to play.

If you are still not happy about VVC (known as Versatile Video Coding), that you think is too hard to encode and decode, use AOMEDIA ONE (AV1) that is recommended for most users to easily play VLC Media Player and others. VVC should need played on VLC Media Player in future.