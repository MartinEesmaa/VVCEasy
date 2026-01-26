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
![Revolt](https://img.shields.io/revolt/invite/0Y10qHzP?label=VVCEasy%20Revolt)
![GitHub Repo stars](https://img.shields.io/github/stars/MartinEesmaa/VVCEasy?style=flat&label=Martin%20Eesmaa's%20VVCEasy%20stars&color=yellow)

<h1 align="center">VVCEasy by Martin Eesmaa</h1>

VVCEasy is that you don't have to compile or/and coding to encode VVC (known as Versatile Video Codec). Simple, Easy, Encode and Decode.

It supports Windows, macOS, Linux, BSD, Android & WebAssembly for VVCEasy builds.

From October 20, 2021, to June 23, 2022, VVCEasy was in pre-release and construction mode.

Since June 23, 2022, VVCEasy was initially released at version 1.0.0.

VVCEasy comes with one easy command, utilizing FFmpeg-VVC, Fraunhofer HHI VVC binaries, uvg266, MPV, LAVFilters, and MPC-HC & MPC-BE, among other features.

Installation: Go to the releases and download the latest version.

Windows source run (Batch-file) (for encoding/decoding, it needs to be manually edit batchfile to modify video file name): [VVCEasy.bat](VVCEasy.bat)

Windows/Mac/Linux source run (C#): Bin/Release or Debug/netX.x/VVCEasy.exe (after building the C# project), which requires VVCEasy.dll to run the console application.

### Community

| Communities | Link |
| --- | --- |
| Matrix chat ![Matrix](https://img.shields.io/matrix/vvceasy:matrix.org) | <https://matrix.to/#/#vvceasy:matrix.org> |
| Revolt ![Revolt](https://img.shields.io/revolt/invite/0Y10qHzP) | <https://app.revolt.chat/invite/0Y10qHzP> |
| Discord ![Discord](https://img.shields.io/discord/974611343237869619) | <https://discord.gg/t54cADTbWW> |
| Reddit | <https://reddit.com/r/VVC> |
| Reddit | <https://reddit.com/r/VVCEasy> |
| lemmy.ml (c/VVC) | <https://lemmy.ml/c/vvc> |
| lemmy.ml (c/VVCEasy) | <https://lemmy.ml/c/vvceasy> |
| lemmy.world (c/VVC) | <https://lemmy.world/c/vvc> |
| lemmy.world (c/VVCEasy) | <https://lemmy.world/c/vvceasy> |

> [!NOTE]
> Please note my first language is Estonian and not native to the English language. Some English words may be incorrect and incomprehensible.

Experimental GitLab mirror is available for alternative purposes or anything:

<https://gitlab.com/MartinEesmaa/VVCEasy>

# All lists

- [Donate to Martin Eesmaa using cryptocurrency](#donate-to-martin-eesmaa-for-a-cryptocurrencies)

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

- [GUI applications easy](#gui-applications-easy)

- [Alternative bindings of CLI](#alternative-bindings-of-cli)

- [Hard option (deprecated)](#hard-option-deprecated)

- [FAQ](#faq-frequently-asked-questions)

- [Credits & Licenses](#credits--licenses)

# Donate to Martin Eesmaa for a cryptocurrencies

- **BTC (BITCOIN):**

```text
bc1qhf4zu5uythr7vyt2dru73qp0k2rzrx355fsx47yjxc2ueunz8frqxmwap3
```

- **XMR (MONERO):**

```text
46Fk6k3qzhwXpLsDRWo4Uh63DDmwRX7gbL6P3zodAnvnRDr9Psi9uau19nCRQFHbmp3nLR3d5Ve8WRid71nuLZxAGygZ258
```

- **BAT (BASIC ATTENTION TOKEN):** For Brave Browser users only, you can also contribute by supporting me, I'm a verified Brave user on Brave Rewards.

- **Estonian bank account (Luminor Eesti IBAN):** You can donate to me. You have to pay a little network send fees before donate.

```text
EE511700017003558571
```

# Tests of VVC videos

You can test Martin Eesmaa's encoded movies of VVC video codec and follow the instructions in README.txt.

[Tears of Steel VVC](https://mega.nz/folder/64swUYxI#WE5njn2aX6-6fxypNC3gtA)

[Martin Eesmaa's VVC sample videos](https://mega.nz/folder/C5lFhALL#5fRQfHN4ulzdaq-B33WQ7w)

Update of 30.08.2025: New 4K Tears of Steel VVC video encoded with xHE-AAC existing audio.

# VLC InterDigital VTM VVC Plugin

VLC InterDigital VTM VVC Plugin is an external VVC decoder plugin from a third-party developer.

See [INSTALLVLCPLUGIN folder](INSTALLVLCPLUGIN/README.md).

# FFmpeg VVENC/DEC & xHE-AAC support

FFmpeg VVC En/Decoder & xHE-AAC supports of Windows, Mac and Linux.

See [FFMPEGVVC.md](FFMPEGVVC.md).

# MPV libvvdec + xHE-AAC support (Windows x64/Linux/Android only)

MPV libvvdec & xHE-AAC support only Windows x64, Linux, and Android.

The VVC and MP4 mux with VVC codec can be played on MPV libvvdec + xHE-AAC version. Only MP4 files mixed with VVC support seeking.

MPV.NET is also only available for Windows.

See [MPV.md](MPV.md).

# LAVFilters VVC version x64

For more information about LAVFilters Windows VVC version.

See [LAVFilters folder](LAVFilters/README.md)

# VVC binaries

The Versatile Video Codec binaries include two tools, vvenc and vvdec, as well as uvg266.

See [VVC.md](VVC.md)

# Deprecated builds

Those deprecated builds were no new commits/codes after one year.

For Bitmovin VVDec Player, see [Bitmovin.md](docs-old/Bitmovin.md).

For VLC o266player build, see [o266player.md](docs-old/o266player.md).

# Compile for VVCEasy

## VVCEasy Batchfile Version (optional) (Windows only)

First, before compiling to VVCEasy Batchfile Version, you need to install Inno Setup to compile it.
Inno Setup link: <https://jrsoftware.org/isdl.php>

Step 1: Clone VVCEasy git and open up VVCEasy_compiler.iss file

```batch
cd %userprofile%\Downloads
git clone --depth=1 https://github.com/MartinEesmaa/VVCEasy && cd VVCEasy
VVCEasy_compiler.iss
```

Step 2: Press F9 on your keyboard to compile. After compiling, VVCEasy.exe (Installer) can be found in the Install folder.

![VVCEasyclickblueplaybutton](https://user-images.githubusercontent.com/88035011/153736303-b0949f5a-5ac5-4123-92c5-305211a8aadc.png)

---

### VVCEasy .NET Console Version (optional)

You need .NET SDK from Microsoft.
Link: <https://dotnet.microsoft.com/en-us/download>

Step 1: Clone git and cd VVCEasy

```bash
git clone --depth=1 https://github.com/MartinEesmaa/VVCEasy && cd VVCEasy
```

Step 2: Start building the project by command:

```bash
dotnet build -c Release
```

Step 3: Once build is done, the result folder directory is bin/Release

```bash
cd bin/Release
```

> [!TIP]
> *You can run VVCEasy without building.*

```bash
dotnet run
```

### Publish single .NET binary executable

If you want to compile and publish it into a portable executable file, you can do so if you wish.

```bash
dotnet publish -c Release
```

After that, it can be found for example at bin\Release\netX.x\win-x64\publish.

# GUI applications (easy)

If you're not familiar with using the CLI, you can use a GUI with an application window for ease of use, eliminating the need to type commands in your terminal.

These VVC programs for encoding/decoding are listed:

| Programs with website or GitHub link | Note | Creator |
| --- | --- | --- |
| [Fastflix](https://github.com/cdgriffith/FastFlix) | You might need to download my custom FFmpeg builds for encoding/decoding VVC using external libraries, rename to ffmpeg.exe and ffprobe.exe from my custom names only, no ffplay executable file required | Chris Griffith |
| [VVC-GUI-Encoder](https://github.com/Disa-Kizonda/VVC-GUI-Encoder) | Only encoder | Disa Kizonda |
| [aVVCator](https://github.com/gianni-rosato/aVVCator) | Only encoder & Linux only | Gianni Rosato |
| [VVenCguiEx](https://github.com/rigaya/VVenCguiEx) | Original Japanese language only for instructions and application (you can still translate), only encoder & Windows only, requires Aviutl (this may be medium or hard) | rigaya |
| [VVConvert](https://vvconvert.app/) | Only encoder, encodes to VVC raw bitstream from any FFmpeg compatible video codecs, requires FFmpeg to open input video files | Alec Carter ([source code](https://github.com/alectr0/VVConvert)) |
| [Av1ador](https://github.com/porcino/Av1ador) | This program allows to encode VVC while transcoding by preview and comparison from original video, includes other encoders as well. | porcino |

## Alternative bindings of CLI

| Programs with website or GitHub link | Note | Creator |
| --- | --- | --- |
| [wrenc](https://github.com/hjmkt/wrenc) | An experimental H.266/VVC Rust encoder (last updated October 2022) | hjkmt |
| [xin26x](https://github.com/pigpeppa/xin26x) | Video Encoder for Now and Next Decade (please note it is partially open source and can only built for Windows) | pigpeppa |
| [vvdec-rs](https://github.com/cadubentzen/vvdec-rs) | Rust bindings for VVdeC | cadubentzen |
| [vvenc-rs](https://github.com/cadubentzen/vvenc-rs) | Rust bindings for VVenC | cadubentzen |
| [OpenVVC](https://github.com/OpenVVC/OpenVVC) | C binding of VVC decoder | OpenVVC (maintainer) |

# Hard option (deprecated)

If you're looking for a hard option of document information, you can check out there: [docs-old/advanced.md](docs-old/advanced.md)

# FAQ (Frequently Asked Questions)

Before you ask any question, see the questions below at table please.

| Question | Answer |
| --- | --- |
| **1:** Are you the real creator of VVCEasy? | That's correct, but I'm not a real founder of VVC nor I didn't build VVC. It was JVET built VVC. |
| **2:** Are you trying to build VVCEasy? | Well, yes... it takes a longer time to make VVCEasy easier, but VVCEasy is not yet finished until further update announcements. I don't have employees, so I'm the only worker. |
| **3:** Is it okay if I bring my proof screenshots? | Yes, you can include screenshots as proof. More proofs, easy to solve it. |
| **4:** My question is not listed on the FAQ. | It's okay. You can go to the Issues tab by filing an issue with your question. I'd be happy to solve it :). |
| **5:** Do you know what skills you have in your programming? | I know about batch files and HTML programming. Some programming languages might be difficult for me. Update of 19th February 2022: Perhaps I should create a C# Console program, which will support Windows, Mac, and Linux. |

If you have any questions or/any issues, please go to the Issues tab and feel free to create an issue.

Or you can join and chat with us in our community: [Link for communities at top](#community)

Martin Eesmaa, creator of VVCEasy

# Credits & Licenses

Special thanks with used softwares for purposes. All the copyright owners have all rights reserved.

[VVCEasy](https://github.com/MartinEesmaa/VVCEasy) - VVCEasy contains ready to serve prebuilt binaries VVC programs, including players and more.

License: MIT

© 2021-2025 [Martin Eesmaa](https://github.com/MartinEesmaa)

---

[Versatile Video Encoder](https://github.com/fraunhoferhhi/vvenc) - Fraunhofer Versatile Video Encoder (VVenC)

[Versatile Video Decoder](https://github.com/fraunhoferhhi/vvdec) - Fraunhofer Versatile Video Decoder (VVdeC)

[Versatile Video Decoder Web Player](https://github.com/fraunhoferhhi/vvdecWebPlayer) - A minimal proof-of-concept VVC player for the web using WebAssembly

License: BSD 3-Clause Clear License (all of three repositories)

© 2018-2025, Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V. & The VVC Authors

GitHub: [Fraunhoferhhi](https://github.com/fraunhoferhhi)

---

[VLC VTM Decoder Plugin](https://github.com/InterDigitalInc/VTMDecoder_VLCPlugin) - VVC decoder plugin for VLC based on a multithreaded VTM

[VLC Original Version](https://code.videolan.org/videolan/vlc) - VLC Media Player

License: GPL-2.0 (VLC Original version) & LGPL-2.1 (VLC VTM Decoder Plugin)

© 2000-2025 [VLC Media Player](https://code.videolan.org/) Developers

© 2021-2024 [Inter Digital Inc](https://github.com/InterDigitalInc)

---

[uvg266](https://github.com/ultravideo/uvg266) - An open-source VVC encoder based on Kvazaar

License: BSD 3-Clause License

© 2021-2025, Tampere University, ITU/ISO/IEC, project contributors

---

[BitMovin Versatile Video Decoder Player](https://github.com/bitmovin/vvDecPlayer) - BitMovin VVDecPlayer

License: MIT

© 2021-2022 [Christian Feldmann](https://github.com/ChristianFeldmann)

---

[FFmpeg](https://github.com/FFmpeg/FFmpeg) - Mirror of <https://git.ffmpeg.org/ffmpeg.git>

VVC developers & forkers: [Christian Lehmann](https://github.com/lehmann-c), [tbiat](https://github.com/tbiat), [Isabelle Santin](https://github.com/IsaMorphic) & [Martin Eesmaa](https://github.com/MartinEesmaa)

License: LGPL-2.1 & GPL-2.0

For my custom build configuration license is GPL-3.0+ with nonfree (fdk-aac) for FFmpeg.

© 2000-2025 [FFmpeg developers](https://github.com/FFmpeg)

---

[fdk-aac](https://github.com/mstorsjo/fdk-aac) - A standalone library of the Fraunhofer FDK AAC code from Android.

© 2012-2025 [Martin Storsjö](https://github.com/mstorsjo)

---

[mpv](https://github.com/mpv-player/mpv) - 🎥 Command line video player

License: LGPL-2.1 & GPL-2.0

For my custom build license: GPL-3.0 with nonfree (fdk-aac) for FFmpeg

© 2013-2025 [Vincent Lang, MPlayer, mplayer2 & MPV developers](https://github.com/mpv-player)

---

[mpv-android](https://github.com/mpv-android/mpv-android) - #mpv-android @ libera.chat

VVC forkers: [tbiat](https://github.com/tbiat) & [Martin Eesmaa](https://github.com/MartinEesmaa/mpv-android-vvc)

License: MIT

© 2016-2025 Ilya Zhuravlev, sfan5 & mpv developers

---

[GPAC/MP4BOX](https://github.com/gpac/gpac) - Modular Multimedia framework for packaging, streaming and playing your favorite content.

License: LGPL-2.1

© 2003-2025 [Jean Le Feuvre](https://github.com/jeanlf) & [GPAC developers/contributors](https://github.com/gpac/gpac/graphs/contributors)

---

[LAVFilters](https://github.com/Nevcairiel/LAVFilters) - LAV Filters - Open-Source DirectShow Media Splitter and Decoders

© 2010-2025 [Hendrik Leppkes](https://github.com/Nevcairiel)

---

[MPC-HC](https://github.com/clsid2/mpc-hc/) - Media Player Classic (forked by clsid2)

[MPC-BE](https://github.com/Aleksoid1978/MPC-BE) - Media Player Black Edition (forked by Aleksoid1978)

License: GPL-3.0

© 2007-2018 [MPC-HC Community Forum & contributors](https://github.com/mpc-hc) (Original)

© 2018-2025 [clsid2](https://github.com/clsid2) (forked of MPC-HC)

© 2012-2025 [Alexander Vodiannikov](https://github.com/Aleksoid1978) (forked of MPC-BE)

---

[7-Zip](https://sourceforge.net/projects/sevenzip/files/7-Zip/) - 7-Zip is a file archiver with a high compression ratio.

Official website: <https://7-zip.org>

License: LGPL-2.1 with unRAR restriction & LZMA SDK in the public domain

© 1999-2025 Igor Pavlov

---

[wget](https://git.savannah.gnu.org/cgit/wget.git) - GNU Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS, the most widely used Internet protocols.

License: GPL-3.0

Original written by Hrvoje Nikšić

© 2015 Free Software Foundation, Inc.
