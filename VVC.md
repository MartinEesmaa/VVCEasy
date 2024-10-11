![vvc](https://upload.wikimedia.org/wikipedia/en/b/ba/Versatile_Video_Coding_%28logo%29.svg)

# Versatile Video Codec binaries

Versatile Video Codec binaries has available two tools for you to choose.

## Fraunhofer HHI (vvenc/vvdec)

Fraunhofer HHI VVC binaries is just standard easy tool, which allows to encode & decode with arguments and also encodes good quality for slow preset, but it may be slow...

* C++ 17 programming language
* Supports Windows, macOS, Linux, BSD, Android, iOS & WebAssembly.
* SIMDE: SCALAR, SSE4.1, SSE4.2, AVX, AVX2, AVX512 (unsupported yet), NEON (arm only) and WASM (Web browsers only).
* Faster speeding up for newer computer machine of CPUs.
* Preset can be used from faster to slower.
* Includes advanced tool of encode (vvencFFapp)
* Two-pass control of bitrate is only allowed.
* Default encoding pixel format is 10-bit.
* For decoding, it can output to YUV, Y4M or pipe.
* Lossless encoding (only for vvencFFapp with CostMode argument)

## uvg266 (VVC Scalable encoder tool)

uvg266 is only scalable encoder which helps to make it faster for older & newer computers, but still a bit good quality than vvenc, seems okay.

* C99 programming language
* Supports Windows, macOS, Linux, BSD, Android & iOS.
* SIMDE: MMX, SSE, SSE2, SSE3, SSSE3, SSE4.1, SSE4.2, AVX, AVX2, NEON & AltiVec (PowerPC only).
* Can only encode 8-bit VVC output for rest operating system supported, but for 10-bit needs compiled with definition, this only works for Android users.
* Faster encoding scalable of old & new computers than vvenc.
* Supports presets from ultrafast to placebo like x264 presets, however it is recommended to use from faster to slower to avoid VVC decoding fail issue.
* Lossless encoding, but not recommended due decoding fail.

### Downloads

NOTE: uvg266 compiled by same architectures supported of vvenc & vvdec.

All compiled builds are compressed files on 7-Zip.

| OS | vvenc & vvdec | uvg266 |
--- | --- | --- |
Windows | [x64/x86](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/WindowsVVC/WindowsVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/Windows/uvg266-Windows.7z)
macOS | [Arm64/x64](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/MacOSVVC/MacOSVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/macOS/uvg266-macOS.7z)
Linux | [x86_64/x86/arm64/armv7a](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/Linux/uvg266-Linux.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/Linux/uvg266-Linux.7z)
BSD | [x86_64](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/BSDVVC/BSDVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/uvg266/BSD/uvg266-BSD.7z)
Android | [x86_64/x86/arm64/armv7a](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/AndroidVVC/AndroidVVC.7z) | [Download](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/AndroidVVC/AndroidUVG266-8bit.7z) or [10-bit build](https://github.com/MartinEesmaa/VVCEasy/raw/refs/heads/master/AndroidVVC/AndroidUVG266.7z)

## Comparisions between vvenc/vvdec and uvg266

If you're using newer computer or/and you wanted it to encode 10-bit with fast encoding to get good quality, use vvenc recommended.

If you're using older computer or/and more faster encoding of 8-bit than vvenc, use uvg266 recommended.

Also for decoding, use vvdec and also it is faster decoding for older (possible) & newer computers.