![VVCEasy](VVCEasy.png)
![GitHub all releases](https://img.shields.io/github/downloads/MartinEesmaa/VVCEasy/total)
![GitHub](https://img.shields.io/github/license/MartinEesmaa/VVCEasy)
[![Build](https://github.com/MartinEesmaa/VVCEasy/actions/workflows/dotnet.yml/badge.svg)](
https://github.com/MartinEesmaa/VVCEasy/actions/workflows/dotnet.yml)
![GitHub repo size](https://img.shields.io/github/repo-size/MartinEesmaa/VVCEasy)
![GitHub release (release name instead of tag name)](https://img.shields.io/github/v/release/MartinEesmaa/VVCEasy?include_prereleases)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/MartinEesmaa/VVCEasy)
![Matrix](https://img.shields.io/matrix/vvceasy:matrix.org?label=VVCEasy%20Matrix)
![Discord](https://img.shields.io/discord/974611343237869619?label=VVCEasy%20Discord%20Chat)

<h1 align="center">VVCEasy by Martin Eesmaa</h1>

VVCEasy is that you don't have to compile or/and coding to encode VVC (known as Versatile Video Codec). Simple, Easy, Encode and Decode.

It supports Windows, macOS, Linux, BSD, Android & WebAssembly for VVCEasy builds.

VVCEasy comes for one-easy command by FFmpeg-VVC, Fraunhofer HHI VVC binaries, uvg266, MPV, LAVFilters with MPC-HC & MPC-BE and more.

Installation: Go to the releases and download latest version.

Windows source run (Batch-file): [VVCEasy.bat](VVCEasy.bat)

Windows/Mac/Linux source run (Csharp): Bin/Release or Debug/netX.x/VVCEasy.exe (after build of C#), this requires VVCEasy.dll to run console application.

### Community

| Communities | Link |
--- | --- |
Matrix chat ![Matrix](https://img.shields.io/matrix/vvceasy:matrix.org) | https://matrix.to/#/#vvceasy:matrix.org
Revolt | https://app.revolt.chat/invite/0Y10qHzP
Discord ![Discord](https://img.shields.io/discord/974611343237869619) | https://discord.gg/t54cADTbWW
Reddit | https://reddit.com/r/VVCEasy
lemmy.ml (c/VVC) | https://lemmy.ml/c/vvc
lemmy.ml (c/VVCEasy) | https://lemmy.ml/c/vvceasy
lemmy.world (c/VVC) | https://lemmy.world/c/vvc
lemmy.world (c/VVCEasy) | https://lemmy.world/c/vvceasy

*Note: Please note of my first language is Estonian and not native with English language. Some English words may be errors with incomprehensible.*

# All lists

- [Donate to Martin Eesmaa using cryptocurrency](#donate-to-martin-eesmaa-for-an-cryptocurrencies)

- [Tests of VVC videos](#tests-of-vvc-videos)

- [VLC InterDigital VTM VVC Plugin](#vlc-interdigital-vtm-vvc-plugin)

- [FFmpeg VVC En/Decoder & xHE-AAC support](#ffmpeg-vvencdec--xhe-aac-support)

- [MPV libvvdec + xHE-AAC support (Windows x64/Linux/Android only)](#mpv-libvvdec--xhe-aac-support-windows-x64linuxandroid-only)

- [LAVFilters VVC version x64](#lavfilters-vvc-version-x64)

- [VVC binaries](#vvc-binaries)

- [Deprecated builds](#deprecated-builds)

- [Compile for VVCEasy](#compile-for-vvceasy)

  - [VVCEasy Batchfile Compile](#vvceasy-batchfile-version-optional-windows-only)

  - [VVCEasy .NET Compile](#vvceasy-net-console-version-optional)

    - [Publish single .NET binary executable](#publish-single-net-binary-executable)

- [Encode/Decode easy](#encodedecode-easy)

- [GUI applications easy](#gui-applications-easy)

- [Hard option (deprecated)](#hard-option-deprecated)

- [FAQ](#faq-known-as-frequently-asked-questions)

- [Credits & Licenses](#credits--licenses)

# Donate to Martin Eesmaa for a cryptocurrencies

- **BTC (BITCOIN):** 
```
bc1qhf4zu5uythr7vyt2dru73qp0k2rzrx355fsx47yjxc2ueunz8frqxmwap3
```
- **XMR (MONERO):** 
```
46Fk6k3qzhwXpLsDRWo4Uh63DDmwRX7gbL6P3zodAnvnRDr9Psi9uau19nCRQFHbmp3nLR3d5Ve8WRid71nuLZxAGygZ258
```
- **BAT (BASIC ATTENTION TOKEN):** For Brave Browser users only, you can also contribute by supporting me, I'm a verified Brave user on Brave Rewards.

- **Estonian bank account (Luminor Eesti IBAN):** You can donate to me. You have to pay a little network send fees before donate.
```
EE511700017003558571
```

# Tests of VVC videos

You can test Martin Eesmaa's encoded movies of VVC video codec and follow README.txt instructions.

[Tears of Steel VVC](https://mega.nz/folder/64swUYxI#WE5njn2aX6-6fxypNC3gtA)

[Martin Eesmaa's VVC sample videos](https://mega.nz/folder/C5lFhALL#5fRQfHN4ulzdaq-B33WQ7w)

# VLC InterDigital VTM VVC Plugin

I have great news. VLC latest version worked out well of Inter Digital VTM plugins. On o266player, there were some problems on my computer for one reason...

One reason that my Windows 11 operating system won't view video of VVC file on o266player version. On VTM plugins of VLC, now it shows me VVC video good.

Here is a comparison of o266player version and VTM VVC plugins:

Top left and right is o266player by Tencent Cloud.

Bottom left and right is VLC VTM plugins by Inter Digital Inc.

![windows8testbetweno266playerandvtmplugins](https://user-images.githubusercontent.com/88035011/160266040-863aa216-4694-4b2f-9957-4aa5b5a07ec3.png)

***UPDATE of 19/04/2022 00:20 AEST:***

Bug of Inter Digital VTM VLC Plugin:

When you try to play your MPEG-TS or TS file, it will crash with your InterDigital VLC VTM Plugin installed on your VLC Media Player.

Without InterDigital VLC VTM Plugin, playing MPEG-TS or TS file will play fine in your all original plugins (except VLC VTM Plugin) on your VLC Media Player.

# FFmpeg VVENC/DEC & xHE-AAC support

FFmpeg VVC En/Decoder & xHE-AAC supports of Windows, Mac and Linux.

See [FFMPEGVVC.md](FFMPEGVVC.md).

# MPV libvvdec + xHE-AAC support (Windows x64/Linux/Android only)

MPV libvvdec & xHE-AAC supports only of Windows x64, Linux & Android.

The VVC and MP4 mux with VVC codec can be played on MPV libvvdec + xHE-AAC version. Only MP4 mixed with VVC supports seek.

MPV.NET is also only available for Windows.

See [MPV.md](MPV.md).

# LAVFilters VVC version x64

For more information about LAVFilters Windows VVC version.

See [LAVFilters folder](LAVFilters/README.md)

# VVC binaries

Versatile Video Codec binaries has two tools of vvenc & vvdec and uvg266.

See [VVC.md](VVC.md)

# Deprecated builds

Those deprecated builds were no new commits/codes after one year.

For Bitmovin VVDec Player, see [Bitmovin.md](docs-old/Bitmovin.md).

For VLC o266player build, see [o266player.md](docs-old/o266player.md).

# Compile for VVCEasy

### VVCEasy Batchfile Version (optional) (Windows only)

First, before you compile to VVCEasy Batchfile Version, you need to install Inno Setup before compiling VVCEasy.
Inno Setup link: https://jrsoftware.org/isdl.php

Step 1: Clone VVCEasy git and open up VVCEasy_compiler.iss file
```
cd %userprofile%\Downloads
git clone --depth=1 https://github.com/MartinEesmaa/VVCEasy && cd VVCEasy
VVCEasy_compiler.iss
```

Step 2: Press F9 to compile on your keyboard. After compiling, VVCEasy.exe (Installer) can be found on Install folder.
![VVCEasyclickblueplaybutton](https://user-images.githubusercontent.com/88035011/153736303-b0949f5a-5ac5-4123-92c5-305211a8aadc.png)

---

### VVCEasy .NET Console Version (optional)

First, before you compile to VVCEasy .NET Console Version, you need .NET SDK x64 from Microsoft.
Link: https://dotnet.microsoft.com/en-us/download

Step 1: Clone git and cd VVCEasy
```
git clone --depth=1 https://github.com/MartinEesmaa/VVCEasy && cd VVCEasy
```

Step 2: When you build, this will restore project first and then compiles.
```
dotnet build -c Release
```

Step 3: Once building is done, the build folder directory is bin/Release
```
cd bin/Release
```

*Tip: You can run VVCEasy without building.*
```
dotnet run
```

### Publish single .NET binary executable

If you want to compile and publish into one portable executable file, you can create if you wish like.
```
dotnet publish -c Release
```

After that, it should be found for example at bin\Release\netX.x\win-x64\publish.

# Encode/Decode (easy)

Before you run VVCEasy.bat or VVCEasy.exe, you need to change from your input video file name into input.mp4 (for example)
Follow the instructions, the commands will give you options. From 21 October 2021 to 23 June 2022, VVCEasy was pre-release, but it's construction mode and you can have look with .BAT source code.

Since 23 June 2022, VVCEasy was initial released on v1.0.0.

To encode/decode, please see the GUI applications.

# GUI applications (easy)

If you're not familiar for using CLI, you can use GUI with application window for ease use and without typing commands on your terminal.

These VVC programs of encode/decode are listed:

| Programs with website or GitHub link | Note | Creator
--- | --- | --- |
[Fastflix](https://github.com/cdgriffith/FastFlix) | You might need to download my custom FFmpeg builds for encoding/decoding VVC using external libraries, rename to ffmpeg.exe and ffprobe.exe from my custom names only, no ffplay executable file required | Chris Griffith
[VVC-GUI-Encoder](https://github.com/Disa-Kizonda/VVC-GUI-Encoder) | Only encoder | Disa Kizonda
[aVVCator](https://github.com/gianni-rosato/aVVCator) | Only encoder & Linux only | Gianni Rosato
[VVenCguiEx](https://github.com/rigaya/VVenCguiEx) | Original Japanese language only for instructions and application (you can still translate), only encoder & Windows only, requires Aviutl (this may be medium or hard) | rigaya
[VVConvert](https://vvconvert.app/) | (only encoder, encodes to VVC raw bitstream from any FFmpeg compatible video codecs, requires FFmpeg to open input video files) | Alec Carter ([source code](https://github.com/alectr0/VVConvert))
[Av1ador](https://github.com/porcino/Av1ador) | This program allows to encode VVC while transcoding by preview and comparison from original video, includes other encoders as well. | porcino

# Hard option (deprecated)

If you're looking hard option of document information, you can check out there: [docs-old/advanced.md](docs-old/advanced.md)

# FAQ (known as Frequently Asked Questions)

Before you ask any question, see the questions below please.

**Q1**: Are you the real creator of VVCEasy?

**A1**: Yes... but I'm not a real creator of VVC, I didn't built VVC, it was Fraunhofer HHI that he built VVC.

**Q2**: Are you trying to work build of VVCEasy?

**A2**: Well, yes... it takes longer time to make VVCEasy easier, but VVCEasy is not yet finished until further/update announcement. I don't have employees, so I'm the only one worker.

**Q3**: Is it okay to bring my proof screenshots of errors?

**A3**: Yes, you can bring error screenshots for your proof. More proof, easy to solve it.

**Q4**: My question is not listed on FAQ. Can I ask any question to you?

**A4**: Sure, just go to Issues tab, ask questions or/and give your issue to me, I'd be happy to solve :).

**Q5**: Do you know what you have skills in your programming?

**A5**: I know about batch file and HTML programming. Some hard programming languages might be difficult for me :/.
Update of 19th February 2022: Maybe I should make C# Console program, that will be easy for Windows, Mac and Linux multi support.

If you have any questions or/and any issues, please go to Issues tab and create your own issue.

Or you can join and chat us our community: [Link for communities at top](#community)
-   Martin Eesmaa

# Credits & Licenses

[VVCEasy](https://github.com/MartinEesmaa/VVCEasy) - VVCEasy is easy VVC, that no need to compile. 

License: MIT

© 2021-2024 [Martin Eesmaa](https://github.com/MartinEesmaa) (All rights reserved)

---

[Versatile Video Encoder](https://github.com/fraunhoferhhi/vvenc) - Fraunhofer Versatile Video Encoder (VVenC)

[Versatile Video Decoder](https://github.com/fraunhoferhhi/vvdec) - Fraunhofer Versatile Video Encoder (VVdeC)

[Versatile Video Decoder Web Player](https://github.com/fraunhoferhhi/vvdecWebPlayer) - A minimal proof-of-concept VVC player for the web using WebAssembly

License: BSD 3-Clause Clear License (all of three repositories)

© 2018-2024, Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V. & The VVC Authors. (All rights reserved)

GitHub: [Fraunhoferhhi](https://github.com/fraunhoferhhi)

---

[VLC VTM Decoder Plugin](https://github.com/InterDigitalInc/VTMDecoder_VLCPlugin) - VVC decoder plugin for VLC based on a multithreaded VTM

[VLC Original Version](https://code.videolan.org/videolan/vlc) - VLC Media Player

License: GPL Version 2 (VLC Original version) & LGPL-2.1 (VLC VTM Decoder Plugin)

© 2000-2024 [VLC Media Player](https://code.videolan.org/) Developers (All rights reserved)

© 2021-2024 [Inter Digital Inc](https://github.com/InterDigitalInc) (All rights reserved)

---

[uvg266](https://github.com/ultravideo/uvg266) - An open-source VVC encoder based on Kvazaar

License: BSD 3-Clause License

© 2021-2024, Tampere University, ITU/ISO/IEC, project contributors (All rights reserved)

---

[BitMovin Versatile Video Decoder Player](https://github.com/bitmovin/vvDecPlayer) - BitMovin VVDecPlayer

License: MIT

© 2021-2022 [Christian Feldmann](https://github.com/ChristianFeldmann) (All rights reserved)

---

[FFmpeg](https://github.com/FFmpeg/FFmpeg) - Mirror of https://git.ffmpeg.org/ffmpeg.git

VVC developers & forkers: [Christian Lehmann](https://github.com/lehmann-c), [tbiat](https://github.com/tbiat), [Isabelle Santin](https://github.com/IsaMorphic) & [Martin Eesmaa](https://github.com/MartinEesmaa)

License: LGPL-2.1+ & GPL-2.0+

For my custom build configuration license is GPL-3.0+ with nonfree (fdk-aac) for FFmpeg.

© 2000-2024 [FFmpeg developers](https://github.com/FFmpeg) (All rights reserved)

---

[fdk-aac](https://github.com/mstorsjo/fdk-aac) - A standalone library of the Fraunhofer FDK AAC code from Android.

License: None

© 2012-2023 [Martin Storsjö](https://github.com/mstorsjo) (All rights reserved)

---

[mpv](https://github.com/mpv-player/mpv) - 🎥 Command line video player

License: LGPL-2.1+ & GPL-2.0+

For my custom build license: GPL-3.0+ with nonfree (fdk-aac) for FFmpeg

© 2013-2024 [Vincent Lang, MPlayer, mplayer2 & MPV developers](https://github.com/mpv-player) (All rights reserved)

---

[mpv-android](https://github.com/mpv-android/mpv-android) - #mpv-android @ libera.chat

VVC forkers: [tbiat](https://github.com/tbiat) & [Martin Eesmaa](https://github.com/MartinEesmaa/mpv-android-vvc)

License: MIT

© 2016-2024 Ilya Zhuravlev, sfan5 & mpv developers (All rights reserved)

---

[GPAC/MP4BOX](https://github.com/gpac/gpac) - Modular Multimedia framework for packaging, streaming and playing your favorite content.

License: LGPL-2.1

© 2003-2024 [Jean Le Feuvre](https://github.com/jeanlf) & [GPAC developers/contributors](https://github.com/gpac/gpac/graphs/contributors) (All rights reserved)

---

[LAVFilters](https://github.com/Nevcairiel/LAVFilters) - LAV Filters - Open-Source DirectShow Media Splitter and Decoders

License: None

© 2010-2024 [Hendrik Leppkes](https://github.com/Nevcairiel) (All rights reserved)

---

[MPC-HC](https://github.com/clsid2/mpc-hc/) - Media Player Classic (forked by clsid2)

[MPC-BE](https://github.com/Aleksoid1978/MPC-BE) - Media Player Black Edition (forked by Aleksoid1978)

License: GPL-3.0

© 2007-2018 [MPC-HC Community Forum & contributors](https://github.com/mpc-hc) (Original) (All rights reserved)

© 2018-2024 [clsid2](https://github.com/clsid2) (forked of MPC-HC) (All rights reserved)

© 2012-2024 [Alexander Vodiannikov](https://github.com/Aleksoid1978) (forked of MPC-BE) (All rights reserved)

---

[7-Zip](https://sourceforge.net/projects/sevenzip/files/7-Zip/) - 7-Zip is a file archiver with a high compression ratio.

Official website: https://7-zip.org

License: LGPL-2.1-or-later with unRAR restriction & LZMA SDK in the public domain

© 1999-2024 Igor Pavlov (All rights reserved)

---

[wget](https://git.savannah.gnu.org/cgit/wget.git) - GNU Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS, the most widely used Internet protocols.

License: GPL-3.0-or-later

Original written by Hrvoje Nikšić

© 2015 Free Software Foundation, Inc. (All rights reserved)