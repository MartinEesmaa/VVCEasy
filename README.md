# VVCEasy (Windows (Full), Mac and Linux (partial)
VVCEasy is that you don't have to compile or/and coding to encode VVC (known as Versatile Video Codec). Simple, Easy, Encode and Decode.

VVCEasy comes to one-easy command of ffmpeg, VVC Tools, python, VLC o266player, VVDEC Web Player and YUView.

Installation: Go to releases and download latest version.

VVCEasy is not finished yet. I'm trying to work out with my codes. I'm not good for code programming, just simple coding.
Sorry to say this. I will give update announcement once I release news.

Windows source run: RUNVVCEASY.bat

Note to Mac and Linux of o266player VLC: Sorry Mac and Linux users :(, on macOS 10.15.6, I tried build, but it failed, you can have a look for Stack Overflow: https://bit.ly/3GTtNTJ
On Linux, it won't support of VLC (o266player build).
If you want to run VLC (o266player version), you must run Windows only for virtual machine or your real computer.

# Donate to me using cryptocurrency

- **BTC:** `bc1qhf4zu5uythr7vyt2dru73qp0k2rzrx355fsx47yjxc2ueunz8frqxmwap3`
- **MONERO:** `85Ahh93M88gV8ekymtYwb6TS14TZ36jNGTFgceaRH7hj8Rtx1qVB9PobnJLR5siz4nYBnzWy3pkV6KaVroifGMVh7n4br3J`
- **BAT:** For Brave users, you can also contribute by support to me, I'm verified Brave user on Brave Rewards.

# Compatibility Windows Operating System (VLC Media Player v3.0.11.1, o266player build version)

Windows | Compatibility (only x64)  | Screenshot
------- | ------- | --------------- | 
Windows 2000/ME or older | ❌ (Cannot run custom build) | [Link](https://i.imgur.com/hHnh5Cx.png)
Windows XP | ⚠️ (Terminal only, GUI is not working) | [Link](https://i.stack.imgur.com/5HAZk.png)
Windows Vista | ⚠️ (GUI Works, but VVC won't work)
Windows 7 | :white_check_mark: (All checked) | [Link](https://i.imgur.com/4cANwDQ.png)
Windows 8   |   :white_check_mark: (All checked)
Windows 8.1 |   :white_check_mark: (All checked) | [Link](https://i.imgur.com/1Fe6xGW.png)
Windows 10  |   :white_check_mark: (All checked)
Windows 11  |   :white_check_mark: (All checked) | [Link](https://i.imgur.com/Me2L998.png)

Windows Server | Check | Screenshot
------- | ------- | --------- |
Windows Server 2003 | ⚠️ (Terminal only, GUI is not working) | [Link](https://i.imgur.com/G7F2bif.png)
Windows Server 2008 | ⚠️ (GUI Works, but VVC won't work)
Windows Server 2012 | :white_check_mark: (All checked) | [Link](https://i.imgur.com/Vcgag8B.png)
Windows Server 2016   | :white_check_mark: (All checked)
Windows Server 2019 | :white_check_mark: (All checked)
Windows Server 2022  | :white_check_mark: (All checked)

VLC Custom build of o266player only accepts x64 / 64-bit to work. 32-bit / x86 won't work.

This cannot be run on Windows Vista / Windows Server 2008 or older to play VVC of VLC Custom build. Note: I'm trying to work it out of VLC 3.0.16.

# Compile of VVCEasy

First, before you compile to VVCEasy, you need Inno Setup to compile VVCEasy.
Inno Setup link: https://jrsoftware.org/isdl.php

Step 1: Clone VVCEasy git and open VVCEasy_compiler.iss
```
cd %userprofile%\Downloads
git clone https://github.com/MartinEesmaa/VVCEasy.git
VVCEasy_compiler.iss
```

Step 2: Before you compile, please replace example username by your username of LicenseFile, OutputDir and Source. See the image:
![Instructionsofcompilevvceasy](https://user-images.githubusercontent.com/88035011/153736145-a24a1997-1133-4933-8797-de7c62295d1d.png)

Step 3: Once you replaced of your username, press F9 to compile on your keyboard. After compiling, VVCEasy.exe will be on your Downloads folder.
![VVCEasyclickblueplaybutton](https://user-images.githubusercontent.com/88035011/153736303-b0949f5a-5ac5-4123-92c5-305211a8aadc.png)

# Encode/Decode (easy)

Before you run of RUNVVCEASY.bat or VVCEASY.exe, you need to change input from file name into input.mp4 (as example)
Follow the instructions, the commands will give your options. Since 21 October 2021, VVCEasy is pre-release, but it's construction mode, but you can have a look with .BAT code.

- Martin Eesmaa

# Without VVCEasy, experimental option for professional coders, other developers, and everyone (hard)

You need 7Zip (requires ffmpeg and ffplay), ffmpeg, ffplay, vvenc/vvdec(app) and YUView.

Here are the links:
FFMPEG/FFPLAY: https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z (go to bin folder and extract two files of ffmpeg and ffplay)
VVENC/VVDEC (Windows, Mac and Linux):
Windows: https://github.com/MartinEesmaa/VVCEasy/blob/master/WindowsVVC/WindowsVVC.7z
Mac: https://github.com/MartinEesmaa/VVCEasy/tree/master/MacOSVVC/MacOSVVC.7z
Linux: https://github.com/MartinEesmaa/VVCEasy/blob/master/LinuxVVC/LinuxVVC.7z

YUView:
https://github.com/IENT/YUView/actions/runs/1365560321

Before we start, you need to make path environments for ffmpeg, ffplay and vvenc/vvdec to make easily.
In Command Prompt (Windows):

```
set PATH=%PATH%;C:\Users\blah\Downloads\VVCEasy\Executables
```
Verify path using Windows Command Prompt/Windows Terminal (CMD):
```
echo %PATH%
```

First:
Transcode any video formats to YUV/Y4M

For YUV transcode (lossy from web quality, YouTube videos and others):
```
ffmpeg -i input.mp4 -strict 1 inputtranscode.yuv
```

For Y4M transcode (lossless from uncompressed video files, only 8 bit):
```
ffmpeg -i input.mp4 -strict 1 inputtranscode.y4m
```

Verify ffplay before encoding with VVENC (important replace video size, otherwise it will not correctly show video, it's like scrambled eggs video):
```
ffplay -f rawvideo -pix_fmt yuv420p -s 854x480 -i inputtranscode.yuv
``` 
Or replace -i inputtranscode.yuv with `-i inputtranscode.y4m` for y4m users. For yuv420p10 on your input video 10 bit, replace `-pixel_format yuv420p10`.

For easy to verify YUV/Y4M, use YUView, open your YUV or Y4M encoded, make sure video size, YUV/Y4M format and frame rate same like from input video file (e.g. MP4, AVI, MKV and others.

After verifying correctly your YUV/Y4M video
Encode with VVENC (Simple settings, example)
```
vvencapp -i out.yuv -s 854x480 -r 30 -o vvc.266
```
-s means video size, -r means frame per second and -o means output. Note: (Simple) as Default settings is YUV420P (8-bit)

The default of VVENC: Constant Quality is 32 and speed is medium.
If you want to get smaller video size and lossy video, add --qp 38. (Not recommended)
If you want to get lossless video without losing quality, use CQ 16-19 and preset slow (optional slower). (Recommended, only Y4M, Raw and Uncompressed video files)

Lossy video/Smallest video size:
```
vvencapp --qp 38 -i out.yuv -s 854x480 -r 30 -o vvc.266
```

Lossless video (minimum loss quality, only Y4M, Raw, Uncompressed video used) (or compress smaller than preset slow, use --preset slower):
```
vvencapp --qp 18 -i out.yuv -s 854x480 -r 30 --preset slow -o vvc.266
```

Note to Apple Mac OS and Linux users: Command with `./vvencapp`

Optional Windows Users using Windows PowerShell: Command with `.\vvencapp`

Encode with VVENC (Best settings (lossless only of Y4M, Raw and Uncompressed video files), replace video size (-s), framerate (-r) and maximize threads of your cores (--threads), example) (Minimum loss quality) If you want true lossless video, use FFV1 latest version 3.4. (Necessary make smaller file slower than preset slow, use --preset slower)
```
vvencapp --qp 18 -i out.yuv -s 854x480 -r 30 --preset slow --threads 16 --tier high -o EXTREME.266
```

NOTE: It is acceptable only for encoding to .h266, .266 and .vvc file container.

Note to 10-bit YUV users: If you encode YUV 10 bit to VVC file, add `-c yuv420_10` before you type ending word of -o EXTREME.266.

Note to 8-bit Y4M users: It is only from input video (8-bit) to Y4M (8 bit)

After VVEnc, you can play in YUView develop version, unfortunately this should not work on release version of June.
Drag any your video file of .h266, .266 or .vvc to play. YUView will play your video only about 10 seconds’ limit.

UPDATE 13th December 2021: VLC Media Player (custom VLC build of o266player, 3.0.11.1 Vetenari, Windows 11) is tested by Martin Eesmaa. It can play only about 600 frames limit / 20+ seconds.
![VLC Media Player (VVC test)](https://user-images.githubusercontent.com/88035011/145756567-d156f630-9e7f-4042-99b5-6ffe8a6b4b64.png)

If you are still not happy about VVC (known as Versatile Video Coding), that you think this is too hard to encode and decode, use AOMEDIA ONE (AV1) that is recommended for most users to easily play VLC Media Player and others. VVC should need played on VLC Media Player in future.


# Compatibility results (VVENC AND VVDEC) TEST COMPLETED BY MARTIN EESMAA

Windows (vvencapp):
![WindowsVVENCDEC](https://user-images.githubusercontent.com/88035011/145812753-eddf04c5-1a10-4892-9118-7478735b1475.png)

Mac (./vvencapp):
![MacOSterminal12](https://user-images.githubusercontent.com/88035011/146367066-1fbfcf2a-8e1f-470c-8701-c3ec8c2b9701.png)

Linux (./vvencapp):
![UbuntuVVENCDEC](https://user-images.githubusercontent.com/88035011/145812781-9a270e03-0dc0-47e6-95ad-4316757d3435.png)


# FAQ (known as Frequently Asked Questions)

Are you real creator of VVCEasy?
Yes... but I'm not real creator of VVC, I didn't build VVC, so it was Fraunhofer that he built VVC.

Are you trying to work build of VVCEasy?
Well yes... it takes longer time to make VVCEasy easier, but VVCEasy is not yet finished until further/update announcement. I don't have employees, so I'm only one.

Is it okay to bring proof screenshots of my errors?
I allow you to bring error screenshots, you can bring proof. More proofs, easier to solve it.

My question is not listed on FAQ. Can I ask any question?
Sure, just go to Issues tab, ask questions or/and give your issue to me.

Do you know what you have skills in your programming?
I know about Batch file and HTML programmer. Some hard programming languages might be difficult to me :/.
Update of 19th February 2022: Maybe I should make C# Console program, that will be easy of Windows, Mac and Linux multi support.

If you have any questions or/and any issues, please go to Issues tab and create your issue.
- Martin Eesmaa
