# LAV Filters for Windows (VVC version)

LAV Filters is an open source of Windows DirectShow filters with splitter and decoder for FFmpeg.

For VVC version, it includes external VVC decoder libvvdec and xHE-AAC with LAV Filters and can be played by any DirectShow players, but it requires Windows Vista and later.

To install LAV Filters VVC version on your computer, you need right click and run as administrator for batch files (.BAT file).

Original source code: https://github.com/Nevcairiel/LAVFilters

Changelog:
```
22/06/2025: Updated LAVFilters for up to version 0.80 with new commits, FFmpeg, vvdec and others. Sorry for long time hiatus.
30/03/2025: Updated LAVFilters with new commits, FFmpeg, vvdec and others. Sorry long time and also sorry big DLL sizes.
01/10/2024: Updated LAVFilters with new commits, FFmpeg, vvdec and others. Added support VVC Matroska demux and also much better for shrinking DLL files down.
09/04/2024: Updated LAVFilters with new commits, FFmpeg and others.
30/03/2024: Updated LAVFilters with new commits, FFmpeg, vvdec and others, still uses libvvdec library and disabled VVC native decoder.
29/01/2024: Updated LAVFilters with new clsid2 commits, FFmpeg, vvdec and others.
15/11/2023: Updated LAVFilters, new clsid2 commits from forked repository, FFmpeg, vvdec and others.
11/08/2023: Updated vvdec
04/08/2023: Updated vvdec and others.
04/04/2023: Removed matroska demuxer of FFmpeg configuration to fix some computers having problem to play any Matroska container. Fixes #26.
21/03/2023: Full VVC support and libfdk_aac is default after native AAC and AAC Fixed decoder disabled to fix USAC/xHE-AAC playable.
```

## MPC-HC 2.4.3.6 (VVC version)

MPC-HC 2.4.3.6 comes with LAVFilters VVC installed and it is portable.

You can download via cloud link: https://mega.nz/file/z1ERTRAZ#50epxmZg65N9Hb2-qPE_vnphvVLpblBSo8qjnCredG8

After downloading, extract compressed file via [7-Zip](https://7-zip.org) and run `mpc-hc64.exe`. This program doesn't require administrator privileges.

Original forked source code: https://github.com/clsid2/mpc-hc

Changelog:
```
22/06/2025: Updated MPC-HC for up to 2.4.3.6, LAVFilters for up to 0.80 with new commits, FFmpeg, vvdec, yt-dlp and others. Also sorry for DLL files increased and also hiatus for 8 months.
01/10/2024: Updated MPC-HC, LAVFilters with new commits, FFmpeg, vvdec, yt-dlp and others. Added support VVC Matroska demux and also much better for shrinking DLL files down.
09/04/2024: Updated MPC-HC, LAVFilters with new commits, FFmpeg and others.
30/03/2024: Updated MPC-HC, LAVFilters with new commits, FFmpeg, MediaInfo, yt-dlp, vvdec and others, still uses libvvdec library and disabled VVC native decoder.
29/01/2024: Updated MPC-HC, LAVFilters with new clsid2 commits, FFmpeg, vvdec, Mediainfo, yt-dlp and others.
15/11/2023: Updated MPC-HC, LAVFilters, new clsid2 commits from forked repository, FFmpeg, vvdec and others. Added yt-dlp support.
11/08/2023: Updated vvdec
05/08/2023: Uploaded MPC-HC 2.0.0 portable x64 VVCEasy version with LAVFilters64 installed.
```

## MPC-BE 1.7.0+ (Black Edition)

Since MPC-BE version 1.7.0 and later, it supports VVC (libvvdec) and USAC (libfdk_aac) decoding.

MPC-BE is Windows universal video and audio player improved similar and more external features added than MPC-HC.

Original forked source code: https://github.com/Aleksoid1978/MPC-BE

You can download binaries on GitHub releases: https://github.com/Aleksoid1978/MPC-BE/releases

Nightly builds: https://github.com/Aleksoid1978/MPC-BE/wiki/Nightly-builds

- Martin Eesmaa