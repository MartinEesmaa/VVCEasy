![vvc](https://upload.wikimedia.org/wikipedia/en/b/ba/Versatile_Video_Coding_%28logo%29.svg)

# Versatile Video Codec binaries

Versatile Video Codec binaries has available two tools for you to choose.

## Fraunhofer HHI (vvenc/vvdec)

Fraunhofer HHI VVC binaries is just standard easy tool, which allows to encode & decode with arguments and also encodes good quality for slow preset, but it may be slow...

* C++14 programming language
* Supports Windows, macOS, Linux, BSD, Android, iOS (library only with new app or non-signed binary executable on jailbroken device) & WebAssembly.
* SIMDE: SCALAR, SSE4.1, SSE4.2, AVX, AVX2, AVX512 (unsupported yet), NEON (arm only) and WASM (Web browsers only).
* Faster depends speeding up for newer computer machine of CPUs.
* Presets can be used from faster to slower.
* Includes advanced tool of encode (vvencFFapp)
* Two-pass control of bitrate is only allowed.
* Default encoding pixel format is 10-bit.
* For decoding, it can output to YUV, Y4M or pipe.
* Lossless encoding (only for vvencFFapp with CostMode argument)

Old screenshots in 2021 of three desktop operating systems:

Windows:
![WindowsVVENCDEC](https://user-images.githubusercontent.com/88035011/145812753-eddf04c5-1a10-4892-9118-7478735b1475.png)

Mac:
![MacOSterminal12](https://user-images.githubusercontent.com/88035011/146367066-1fbfcf2a-8e1f-470c-8701-c3ec8c2b9701.png)

Linux:
![UbuntuVVENCDEC](https://user-images.githubusercontent.com/88035011/145812781-9a270e03-0dc0-47e6-95ad-4316757d3435.png)

## uvg266 (VVC Scalable encoder tool)

uvg266 is only scalable encoder which helps to make it faster for older & newer computers, but still a bit good quality than vvenc, seems okay.

* C99 programming language
* Supports Windows, macOS, Linux, BSD, Android & iOS (library only with new app or non-signed binary executable on jailbroken device).
* SIMDE: MMX, SSE, SSE2, SSE3, SSSE3, SSE4.1, SSE4.2, AVX, AVX2, NEON & AltiVec (PowerPC only).
* Can only encode 8-bit VVC output for rest operating system supported, but for 10-bit needs compiled with definition, this only works for Android users.
* Faster encoding scalable of old & new computers than vvenc.
* Supports presets from ultrafast to placebo like x264 presets, however it is recommended to use from faster to slower to avoid VVC decoding fail issue.
* Lossless encoding is not recommended due decoding fail.

### Minimum requirements

**vvenc/vvdec**:

* Windows XP and later (requires Visual C++ Redistributable for Visual Studio 2019 installed)
* Mac OS X 10.9 and later (arm64 since macOS 11.0)
* Linux kernel 3.2.0 and later (eg. Ubuntu 12.04 LTS and later)
* BSD (FreeBSD & x64 only)
* Android 4.1 (API 16, Jelly Bean) and later (arm64 & x86_64 since Android 5.0)

**uvg266**:

* Windows Vista and later (requires Visual C++ Redistributable)
* Mac OS X 10.4 and later (amd64 since Mac OS X 10.4, x86 from Mac OS X 10.6 to 10.14, arm64 since macOS 11.0)
* Linux kernel 3.2.0 and later (eg. Ubuntu 12.04 LTS and later)
* BSD (FreeBSD & x64 only)
* Android 4.3 (API 18, Jelly Bean) and later (arm64 & x86_64 since Android 5.0)

### Downloads

NOTE: uvg266 compiled by same architectures supported of vvenc & vvdec.

All compiled builds are compressed files on 7-Zip.

| OS | vvenc & vvdec | uvg266 |
| --- | --- | --- |
| Windows | [x64/x86](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/WindowsVVC/WindowsVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/Windows/uvg266-Windows.7z) |
| macOS | [Arm64/x64](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/MacOSVVC/MacOSVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/macOS/uvg266-macOS.7z) |
| Linux | [x86_64/x86/arm64/armv7a](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/Linux/uvg266-Linux.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/Linux/uvg266-Linux.7z) |
| BSD | [x86_64](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/BSDVVC/BSDVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/BSD/uvg266-BSD.7z) |
| Android | [x86_64/x86/arm64/armv7a](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/AndroidVVC/AndroidVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/AndroidVVC/AndroidUVG266-8bit.7z) or [10-bit build](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/AndroidVVC/AndroidUVG266.7z) |

## Comparisions between vvenc/vvdec and uvg266

If you're using newer computer or/and you wanted it to encode 10-bit with fast encoding to get good quality, use vvenc recommended.

If you're using older computer or/and more faster encoding of 8-bit than vvenc, use uvg266 recommended.

Also for decoding, use vvdec and also it is faster decoding for older (possible) & newer computers.
