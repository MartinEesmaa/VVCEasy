# VVCEasy (Windows/Mac/Linux)
VVCEasy is that you don't have to compile or/and coding to encode VVC (known as Versatile Video Codec). Simple. Easy. Encode. Decode

VVCEasy comes to one-easy of ffmpeg, vvenc, vvdec and YUView.

Installation: Go to releases and download latest version.

VVCEasy is not yet finished. I'm trying to work with codes. I'm not good coding programming, just simple coding.
Sorry to say that. I will give update, once I release news.

Source run: RUNVVCEASY.bat

# Encode/Decode (easy)

Before you run of RUNVVCEASY.bat or VVCEASY.exe, you need to change input from file name to input.mp4 (as example)
Follow the instructions, the commands will give your options. Since 21 October 2021, VVCEasy is pre-release, but it's construction mode, but you can have a look with .BAT code.

- Martin Eesmaa

# Without VVCEasy, experimental option for professional coders, other developers and everyone (hard)

You need 7Zip (requires ffmpeg and ffplay), ffmpeg, ffplay, vvenc/vvdec(app) and YUView.

Here are the links:
FFMPEG/FFPLAY: https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z (go to bin folder and extract two files)
VVENC/VVDEC:
https://github.com/MartinEesmaa/VVCEasy/blob/main/VVC/vvencapp.exe
https://github.com/MartinEesmaa/VVCEasy/blob/main/VVC/vvdecapp.exe

YUView:
https://github.com/IENT/YUView/actions/runs/1365560321

Before we start, you need to make path environments for ffmpeg, ffplay and vvenc/vvdec to make easily.
In Command Prompt:
`set PATH=%PATH%;C:\Users\blah\Downloads\VVCEasy\Executables` (example)
verify `echo %PATH%` in Command Prompt

First of all:
Transcode any video formats to YUV/Y4M

For YUV transcode (replace f for frame rate):
`ffmpeg -i input.mp4 -r f inputtranscode.yuv`

For Y4M transcode (replace f for frame rate):
`ffmpeg -i input.mp4 -r f inputtranscode.y4m`

Verify ffplay before encode with VVENC (replace video size, important otherwise it will not show correctly video, it's like scramble eggs):
`ffplay -f rawvideo -pixel_format yuv420p -video_size 854x480 -i inputtranscode.yuv` or replace -i inputtranscode.yuv with `-i inputtranscode.y4m` for y4m users.

After verifying correctly
Encode with VVENC (Simple settings)
`vvencapp -i out.yuv/y4m -s 854x480 -r 30 -o vvc.266`
-s means video size, -r means frame per second and -o means output

Encode with VVENC (Best settings, replace video size, framerate and maximize threads of your cores)
`vvencapp -i out.yuv/y4m -s 854x480 -r 30 --preset slow --threads 16 --tier high -o EXTREME.266`

NOTE: It is acceptable only for encoding to .h266, .266 and .vvc file container.

After VVEnc, you can play in YUView develop version, unfortunately this should not work on release version of June.
Drag any your video file of .h266, .266 or .vvc to play. YUView will play your video about only 10 seconds.

If you are still not happy VVC, that you think this is too hard to encode and decode, or this cannot be played on VLC Media Player of VVC Video Codec, use AOMEDIA ONE that is recommended for most users for easily play VLC Media Player and others.

# FAQ (known as Frequently Asked Questions)

Are you real creator of VVCEasy?
Yes... but I'm not creator of VVC, I didn't build VVC, so it was Fraunhofer built VVC.

Are you trying to work build of VVCEasy?
Well yeah... it takes longer time to make VVCEasy easier, but VVCEasy is not yet finished until further/update announcement. I don't have employees, so I'm only one.

Is it okay to bring proof screenshots of my errors?
I allow you to bring error screenshots, you can bring proof. More proofs, more easy to solve it.

My question is not listed on FAQ. Can I ask any question?
Sure, just go to Issues tab and ask questions or give it issue to me.

If you have any questions or any issues, please go to Issues tab and create your issue.
- Martin Eesmaa
