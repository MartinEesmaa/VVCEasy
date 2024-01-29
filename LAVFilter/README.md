# LAV Filters for Windows (VVC version)

LAV Filters is an open source of Windows DirectShow filters with splitter and decoder for FFmpeg.

For VVC version, it includes external VVC decoder libvvdec and xHE-AAC with LAV Filters and can be played by any DirectShow players, but it requires Windows Vista and later.

To install LAV Filters VVC version on your computer, you need right click and run as administrator for batch files (.BAT file).

Original source code: https://github.com/Nevcairiel/LAVFilters

Changelog:
```
29/01/2023: Updated LAVFilters with new clsid2 commits, FFmpeg, vvdec and others.
15/11/2023: Updated LAVFilters, new clsid2 commits from forked repository, FFmpeg, vvdec and others.
11/08/2023: Updated vvdec
04/08/2023: Updated vvdec and others.
04/04/2023: Removed matroska demuxer of FFmpeg configuration to fix some computers having problem to play any Matroska container. Fixes #26.
21/03/2023: Full VVC support and libfdk_aac is default after native AAC and AAC Fixed decoder disabled to fix USAC/xHE-AAC playable.
```

## MPC-HC 2.1.4 (VVC version)

MPC-HC 2.1.4 comes with LAVFilters VVC installed and it is portable.

You can download via cloud link: https://mega.nz/file/qpczzJSJ#87Mu3jMtzTo5T7zWVYviLYGdsXslumfpjk-A1vS7j1g

After downloading, extract compressed file via [7-Zip](https://7-zip.org) and run `mpc-hc64.exe`. This program doesn't require administrator privileges.

Original forked source code: https://github.com/clsid2/mpc-hc

Changelog:
```
29/01/2023: Updated MPC-HC, LAVFilters with new clsid2 commits, FFmpeg, vvdec, Mediainfo, yt-dlp and others.
15/11/2023: Updated MPC-HC, LAVFilters, new clsid2 commits from forked repository, FFmpeg, vvdec and others. Added yt-dlp support.
11/08/2023: Updated vvdec
05/08/2023: Uploaded MPC-HC 2.0.0 portable x64 VVCEasy version with LAVFilters64 installed.
```

- Martin Eesmaa