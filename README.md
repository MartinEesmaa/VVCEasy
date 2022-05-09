![VVCEasy](VVCEasy.png)
![GitHub all releases](https://img.shields.io/github/downloads/MartinEesmaa/VVCEasy/total)
![GitHub](https://img.shields.io/github/license/MartinEesmaa/VVCEasy)
[![Build](https://github.com/MartinEesmaa/VVCEasy/actions/workflows/dotnet.yml/badge.svg)](
https://github.com/MartinEesmaa/VVCEasy/actions/workflows/dotnet.yml)
![GitHub repo size](https://img.shields.io/github/repo-size/MartinEesmaa/VVCEasy)
![GitHub release (release name instead of tag name)](https://img.shields.io/github/v/release/MartinEesmaa/VVCEasy?include_prereleases)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/MartinEesmaa/VVCEasy)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/2c56e202bf3a466c84ccacef36df197e)](https://www.codacy.com/gh/MartinEesmaa/VVCEasy/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=MartinEesmaa/VVCEasy&amp;utm_campaign=Badge_Grade)
![Matrix](https://img.shields.io/matrix/vvceasy:matrix.org?label=VVCEasy%20Matrix)

# VVCEasy (Windows (Full), Mac and Linux (partial) (by Martin Eesmaa)
VVCEasy is that you don't have to compile or/and coding to encode VVC (known as Versatile Video Codec). Simple, Easy, Encode and Decode.

VVCEasy comes to one-easy command of ffmpeg, VVC Tools, python, VLC o266player, VVDEC Web Player, Bitmovin VVDec Player, YUView and more.

Installation: Go to releases and download latest version.

VVCEasy is not finished yet. I'm trying to work out with my codes. I'm not good for code programming, just simple coding.
Sorry to say this. I will give you of my update announcement once I release the news.

Windows source run (Batchfile): VVCEasy.bat

Windows/Mac/Linux source run (Csharp): Bin/Release or Debug/netX.x/VVCEasy.exe (after build of C#), this requires VVCEasy.dll to run console application.

Note to Mac and Linux of o266player VLC: Sorry Mac and Linux users :(, here is a why MacOS and Linux cannot run VLC o266player.

On macOS 10.15.6, I tried build, but it failed, you can have a look for Stack Overflow: [Link](https://stackoverflow.com/questions/70387126/error-1-and-2-trying-to-compile-vlc-o266player-missing-git-and-txt).

On Linux, it doesn't support of VLC (o266player build).
If you want to run VLC (o266player version), you need to run Windows only for a virtual machine or your a real computer.

Matrix chat: https://matrix.to/#/#vvceasy:matrix.org

Revolt: https://app.revolt.chat/server/01G1QSBZ4AMGDBWPVJ63EDZCD7/channel/01G1QSBZ4ABH7REMG6T47R8KS4

Discord: Coming soon...

# All lists

- [Donate to Martin Eesmaa using cryptocurrency](#donate-to-martin-eesmaa-using-cryptocurrency)
- [Compatibility of O266Player](#compatibility-windows-operating-system-vlc-media-player-v30111-o266player-build-version)
- [Bitmovin VVDec Player](#bitmovin-vvdec-player)
- [Compile for VVCEasy](#compile-for-vvceasy)
  - [VVCEasy Batchfile Compile](#vvceasy-batchfile-version-optional-windows-only)
  - [VVCEasy .NET Compile](#vvceasy-net-console-version-optional)
- [Encode/Decode easy](#encodedecode-easy)
- [Hard option](#without-vvceasy-experimental-option-for-professional-coders-other-developers-and-everyone-hard)
- [VVEnc & VVDec compatibility test](#compatibility-results-vvenc-and-vvdec-tested-by-martin-eesmaa)
- [FAQ](#compatibility-results-vvenc-and-vvdec-test-completed-by-martin-eesmaa)
- [Credits & Licenses](#credits--licenses)

# Donate to Martin Eesmaa using cryptocurrency

- **BTC (BITCOIN):** 
```
bc1qhf4zu5uythr7vyt2dru73qp0k2rzrx355fsx47yjxc2ueunz8frqxmwap3
```
- **XMR (MONERO):** 
```
85Ahh93M88gV8ekymtYwb6TS14TZ36jNGTFgceaRH7hj8Rtx1qVB9PobnJLR5siz4nYBnzWy3pkV6KaVroifGMVh7n4br3J
```
- **BAT (BASIC ATTENTION TOKEN):** For Brave users only, you can also contribute by support to me, I'm verified Brave user on Brave Rewards.

# Compatibility Windows Operating System (VLC Media Player v3.0.11.1, o266player build version)

Windows | Compatibility (only x64)  | Screenshot | Date report (DD/MM/YYYY, 24hr)
------- | ------- | --------------- | ------------- |
Windows 2000/ME or older | :x: (Cannot run custom build) | [Link](https://i.imgur.com/hHnh5Cx.png) | 19/02/2022 18:35:34 (AEDT)
Windows XP | ⚠️ (Terminal only, GUI is not working) | [Link](https://i.imgur.com/v3jMW3d.png) | 11/12/2021 15:18:29 (AEDT)
Windows Vista | ⚠️ (GUI Works, but VVC won't show video)
Windows 7 | :white_check_mark: (All checked) | [Link](https://i.imgur.com/4cANwDQ.png) | 17/12/2021 21:32:38 (AEDT)
Windows 8.0   |   ⚠️ (GUI Works, but VVC won't show video) | [Link](https://i.imgur.com/cl8qASz.png) | 20/02/2022 15:27:40 (AEDT)
Windows 8.1 |   :white_check_mark: (All checked) | [Link](https://i.imgur.com/1Fe6xGW.png) | 17/12/2021 18:23:35 (AEDT)
Windows 10  |   ⚠️ (GUI Works, but VVC won't show video)
Windows 11  |   :white_check_mark: (All checked) | [Link](https://i.imgur.com/Me2L998.png) | 13/12/2021 15:58:55 (AEDT)

Windows Server | Compatibility (only x64) | Screenshot | Date report (DD/MM/YYYY, 24hr)
------- | ------- | --------- | --------- |
Windows Server 2003 | ⚠️ (Terminal only, GUI is not working) | [Link](https://i.imgur.com/G7F2bif.png) | 19/02/2022 21:38:20 (AEDT)
Windows Server 2008 | ⚠️ (GUI Works, but VVC won't show video) | [Link](https://i.imgur.com/GXFgIt8.png) | 20/02/2022 14:02:28 (AEDT)
Windows Server 2012 | :white_check_mark: (All checked) | [Link](https://i.imgur.com/Vcgag8B.png) | 17/12/2021 20:57:16 (AEDT)
Windows Server 2016   | :white_check_mark: (Already checked by Tencent Cloud)
Windows Server 2019 | :black_square_button: (Needs to be tested)
Windows Server 2022  | :black_square_button: (Needs to be tested)

VLC Custom build of o266player only accepts to run 64-bit / x64 on your computer. 32-bit / x86 won't work.

This cannot be run on Windows Vista / Windows Server 2008 or older and Windows 8.0 to play VVC video file of VLC Custom build. 

Note: I'm trying to work it out of VLC 3.0.16.

Reminder: Some operating systems are working to load VVC video format in Virtual Machine softwares, but real machines will work every operating system, example Windows Server 2016 has already been tested by Tencent Cloud.

If your operating system is working to decode VVC video format like you're running on Windows 10, please fork this repository, edit README and make pull request of my original repository from your forked repository. Screenshot must be required winver and VLC Media Player (custom build of o266player)

***UPDATE of 27/03/2022 15:00 AEDT:***

I have a great news. VLC latest version worked out well of Inter Digital VTM plugins. On o266player, there was some problems on my computer for one reason...

One reason that my Windows 11 operating system won't view video of VVC file on o266player version. On VTM plugins of VLC, now it shows me VVC video good.

Here is a my comparision of o266player version and VTM VVC plugins:

Top left and right is o266player.

Bottom left and right is VLC VTM plugins by Inter Digital Inc.

![windows8testbetweno266playerandvtmplugins](https://user-images.githubusercontent.com/88035011/160266040-863aa216-4694-4b2f-9957-4aa5b5a07ec3.png)

***UPDATE of 19/04/2022 00:20 AEST:***

Bug of Inter Digital VTM VLC Plugin:

When you try to play your MPEG-TS or TS file, it will crash with your InterDigital VLC VTM Plugin installed on your VLC Media Player.

Without InterDigital VLC VTM Plugin, playing MPEG-TS or TS file will play fine in your all original plugins (except VLC VTM Plugin) on your VLC Media Player.

About o266player: Since o266player repository have no new commits than one year. 

We will remove o266player list, if no new commits than one year.

# Bitmovin VVDec Player

For more information about Bitmovin VVDec Player.

See [Bitmovin.md](https://github.com/MartinEesmaa/VVCEasy/blob/master/Bitmovin.md).

# Compile for VVCEasy

### VVCEasy Batchfile Version (optional) (Windows only)

First, before you compile to VVCEasy Batchfile Version, you need Inno Setup to compile VVCEasy.
Inno Setup link: https://jrsoftware.org/isdl.php

Step 1: Clone VVCEasy git and open VVCEasy_compiler.iss
```
cd %userprofile%\Downloads
git clone https://github.com/MartinEesmaa/VVCEasy.git
VVCEasy_compiler.iss
```

Step 2: Before you compile, please replace example username by your username of LicenseFile, OutputDir and Source. See the image:
![Instructionsofcompilevvceasy](https://user-images.githubusercontent.com/88035011/153736145-a24a1997-1133-4933-8797-de7c62295d1d.png)

Step 3: Once you replaced of your username, press F9 to compile on your keyboard. After compiling, VVCEasy.exe (Installer) will be on your Downloads folder.
![VVCEasyclickblueplaybutton](https://user-images.githubusercontent.com/88035011/153736303-b0949f5a-5ac5-4123-92c5-305211a8aadc.png)

---

### VVCEasy .NET Console Version (optional)

First, before you compile to VVCEasy .NET Console Version, you need .NET SDK x64 from Microsoft.
Link: https://dotnet.microsoft.com/en-us/download

Step 1: Clone git and cd VVCEasy
```
git clone https://github.com/MartinEesmaa/VVCEasy.git && cd VVCEasy
```

Step 2: Before you build, make sure to build and test it. Don't worry, when you build with .NET, it will restore project and build.
```
dotnet build && dotnet test --no-build --verbosity normal
```

Step 3: Once building is done, the build folder directory is bin/Debug
```
cd bin/debug
```

*Tip: You can run VVCEasy without building.*
```
dotnet run
```

# Encode/Decode (easy)

Before you run VVCEasy.bat or VVCEasy.exe, you need to change from your input video file name into input.mp4 (as example)
Follow the instructions, the commands will give your options. Since 21 October 2021, VVCEasy is pre-release, but it's construction mode, but you can have a look with .BAT source code.

- Martin Eesmaa

# Without VVCEasy, experimental option for professional coders, other developers, and everyone (hard)

You need 7-Zip (requires ffmpeg and ffplay), ffmpeg, ffplay, vvenc/vvdec(app) and YUView.

Here are the links:
FFMPEG/FFPLAY: https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z (go to bin folder and extract two files of ffmpeg and ffplay)
VVENC/VVDEC (Windows, Mac and Linux):
Windows: https://github.com/MartinEesmaa/VVCEasy/blob/master/WindowsVVC/WindowsVVC.7z
Mac: https://github.com/MartinEesmaa/VVCEasy/tree/master/MacOSVVC/MacOSVVC.7z
Linux: https://github.com/MartinEesmaa/VVCEasy/blob/master/LinuxVVC/LinuxVVC.7z

YUView:
https://github.com/IENT/YUView/releases

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
ffmpeg -i input.mp4 -pix_fmt yuv420p -strict 1 inputtranscode.yuv
```

For Y4M transcode (lossless from uncompressed video files, only 8 bit):
```
ffmpeg -i input.mp4 -pix_fmt yuv420p -strict 1 inputtranscode.y4m
```

Verify uncompressed video using ffplay before encode to VVENC (important replace video size, otherwise it will not correctly show video, it's like scrambled eggs video):
```
ffplay -i inputtranscode.yuv -s 854x480
``` 

Default pixel format of ffplay for yuv and y4m is yuv420p without `-pix_fmt` command.

For y4m videos, replace -i inputtranscode.yuv with `-i inputtranscode.y4m`. For yuv420p10 on your input video 10 bit, add `-pix_fmt yuv420p10`.

For easy to verify YUV/Y4M, use YUView, open your YUV or Y4M encoded, make sure video size, YUV/Y4M format and frame rate same like from input video file (e.g. MP4, AVI, MKV and others.

After verifying correctly your YUV/Y4M video
Encode with VVENC (Simple settings, example)
```
vvencapp -i out.yuv -s 854x480 -r 30 -o vvc.266
```
-s means video size, -r means frame per second and -o means output. Note: (Simple) as Default settings is YUV420P (8-bit)

The default of VVENC: Constant Quality is 32 and speed is medium.
If you want to get smaller video size and lossy video, add --qp 38. (Not recommended)
If you want to get lossless video without losing quality (minimum loss quality), use CQ 16-19 and preset slow (optional slower). (Recommended, only Y4M, Raw and Uncompressed video files)

Lossy video/Smallest video size:
```
vvencapp --qp 38 -i out.yuv -s 854x480 -r 30 -o vvc.266
```

**NOTE: If you want have true lossless on your video, please visit [FFV1](http://ffv1.org) or H.264 Lossless/H.265 Lossless/Libaom lossless video codec**

**NOTE 2: VVENC does not support lossless.**

Lossless video (minimum loss quality, only Y4M, Raw, Uncompressed video used) (or compress smaller than preset slow, use --preset slower):
```
vvencapp --qp 18 -i out.yuv -s 854x480 -r 30 --preset slow -o vvc.266
```

For Apple Mac OS and Linux terminal users: Command with `./vvencapp`

For Windows Users using Windows PowerShell: Command with `.\vvencapp`

Encode with VVENC (Best settings (lossless only of Y4M, Raw and Uncompressed video files), replace video size (-s), framerate (-r) and maximize threads of your cores (--threads), example) (Minimum loss quality) If you want true lossless video, use FFV1 latest version 3.4. (Necessary make smaller file slower than preset slow, use --preset slower)
```
vvencapp --qp 18 -i out.yuv -s 854x480 -r 30 --preset slow --threads 16 --tier high -o EXTREME.266
```

NOTE: It is acceptable only for encoding to .h266, .266 and .vvc file container.

Note to 10-bit YUV users: If you encode YUV 10 bit to VVC file, add `-c yuv420_10` before you type ending word of -o EXTREME.266.

Note to 8-bit Y4M users: It is only from input video (8-bit) to Y4M (8 bit)

After VVEnc, you can play in YUView of latest version.
Drag any your video file of .h266, .266 or .vvc to play. YUView will play your video only about 10 seconds’ limit.

UPDATE 13th December 2021: VLC Media Player (custom VLC build of o266player, 3.0.11.1 Vetenari, Windows 11) is tested by Martin Eesmaa. It can play only about 600 frames limit / 20+ seconds.
![VLC Media Player (VVC test)](https://user-images.githubusercontent.com/88035011/145756567-d156f630-9e7f-4042-99b5-6ffe8a6b4b64.png)

If you are still not happy about VVC (known as Versatile Video Coding), that you think is too hard to encode and decode, use AOMEDIA ONE (AV1) that is recommended for most users to easily play VLC Media Player and others. VVC should need played on VLC Media Player in future.


# Compatibility results (VVENC AND VVDEC) TESTED BY MARTIN EESMAA

Windows (vvencapp):
![WindowsVVENCDEC](https://user-images.githubusercontent.com/88035011/145812753-eddf04c5-1a10-4892-9118-7478735b1475.png)

Mac (./vvencapp):
![MacOSterminal12](https://user-images.githubusercontent.com/88035011/146367066-1fbfcf2a-8e1f-470c-8701-c3ec8c2b9701.png)

Linux (./vvencapp):
![UbuntuVVENCDEC](https://user-images.githubusercontent.com/88035011/145812781-9a270e03-0dc0-47e6-95ad-4316757d3435.png)


# FAQ (known as Frequently Asked Questions)

Are you real creator of VVCEasy?
Yes... but I'm not real creator of VVC, I didn't built VVC, it was Fraunhofer that he built VVC.

Are you trying to work build of VVCEasy?
Well yes... it takes longer time to make VVCEasy easier, but VVCEasy is not yet finished until further/update announcement. I don't have a employees, so I'm only the one.

Is it okay to bring my proof screenshots of errors?
I allow you to bring error screenshots, you can bring proof. More proofs, easier to solve it.

My question is not listed on FAQ. Can I ask any question?
Sure, just go to Issues tab, ask questions or/and give your issue to me.

Do you know what you have skills in your programming?
I know about Batch file and HTML programmer. Some hard programming languages might be difficult to me :/.
Update of 19th February 2022: Maybe I should make C# Console program, that will be easy of Windows, Mac and Linux multi support.

If you have any questions or/and any issues, please go to Issues tab and create your issue.

Or, you can chat us: https://matrix.to/#/#vvceasy:matrix.org
- Martin Eesmaa


# Credits & Licenses

[VVCEasy](https://github.com/MartinEesmaa/VVCEasy) - VVCEasy is easy VVC, that no need compile. 

License: MIT

© 2021-2022 [Martin Eesmaa](https://github.com/MartinEesmaa) (All rights reserved)

----------------

[Versatile Video Encoder](https://github.com/fraunhoferhhi/vvenc) - Fraunhofer Versatile Video Encoder (VVenC)

[Versatile Video Decoder](https://github.com/fraunhoferhhi/vvdec) - Fraunhofer Versatile Video Encoder (VVdeC)

[Versatile Video Decoder Web Player](https://github.com/fraunhoferhhi/vvdecWebPlayer) - A minimal proof-of-concept VVC player for the web using WebAssembly

License: Clear BSD (two repositories of vvenc & vvdec) + BSD (vvdecWebPlayer)

© 2018-2022, Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V. & The VVC Authors. (All rights reserved)

GitHub: [Fraunhoferhhi](https://github.com/fraunhoferhhi)

--------------------

[O266Player](https://github.com/TencentCloud/o266player) - VLC Media Player (o266player, Vetinari v3.0.11.1, modified version)

[VLC Original Version](https://code.videolan.org/videolan/vlc) - VLC Media Player

License: GPL Version 2 (both repositories)

© 2020-2021 [Tencent Cloud](https://github.com/TencentCloud) (All rights reserved)

© 2000-2022 [VLC Media Player](https://code.videolan.org/) Developers (All rights reserved)

--------------------

[BitMovin Versatile Video Decoder Player](https://github.com/bitmovin/vvDecPlayer) - BitMovin VVDecPlayer

License: MIT

© 2021-2022 [Christian Feldmann](https://github.com/ChristianFeldmann) (All rights reserved)

---------------------

[VLC VTM Decoder Plugin](https://github.com/InterDigitalInc/VTMDecoder_VLCPlugin) - VVC decoder plugin for VLC based on a multithreaded VTM

License: LGPL-2.1

© 2021-2022 [Inter Digital Inc](https://github.com/InterDigitalInc) (All rights reserved)

---------------------
