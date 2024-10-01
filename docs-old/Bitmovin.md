![bitmovinlogo1](https://user-images.githubusercontent.com/88035011/159108926-ee3ef996-4fe4-4c33-87d6-4a016486d27e.png)

# Bitmovin VVDec Player (instructions of encode segments)

If you want to put your VVC file into Bitmovin VvDec Player, we need add `--segment`, `-f` as frames and `-fs` as frame skip into vvencapp.

Otherwise, if you put VVC file (which is all together of one file) without segments, your application might freeze your computer and application too.

To make probably decoded well for segments, here is an example of this:

Example of code (1 second/24 frames). After first segment (1 sec), it will go up 1 second (total frames 48):
```
vvencapp --qp 34 -i out.yuv -s 854x480 -r 24 --preset slow --threads 16 --tier high --segment mid -f 24 -fs 24 -o EXTREME-1.266
```

First segment (first) will be beginning from video, 0 sec -> 1 sec. (segment-0.vvc)

Middle segment (mid) will be during from video, 1 sec -> 2 sec. (segment-1.vvc)

Last segment (last) will be ending from video, 2 sec -> 3 sec. (segment-2.vvc)

Total is three seconds and three segments. Example of my segments, including log:

[Log file](https://pastebin.com/qrCyfDEU)

[VVC Segments](https://github.com/MartinEesmaa/VVCEasy/files/8308682/BBBVVCTHREESEC.zip)

JSON:
```
{
  "Name": "Big Buck Bunny Test Video Three Sec",
  "NrSegments": 2,
  "PlotMaxBitrate": 400000,
  "Renditions": [
    {
      "Name": "720p",
      "Resolution": "1280x720",
      "Fps": 24,
      "Url": "C:/Users/User/Downloads/BBBVVCTHREESEC/segment-%i.vvc"
    }
  ]
}
```

# Bitmovin VVDec Player Downloads (including build instructions):

[Windows Pre-Builded](https://www.dropbox.com/scl/fi/x4v1qb60u8zp505dtx8p6/BitVVDecPlayerWIN.7z?rlkey=gs9duytd6h1sos69o53rw8vyy)

[Mac OS Pre-Builded](https://www.dropbox.com/s/ilsoica7c8dh4hq/BitVVDecPlayerMAC.7z)

[Linux Pre-Builded](https://www.dropbox.com/scl/fi/9jgibpwxe52zkkjijycdc/BitVVDecPlayerLINUX.AppImage?rlkey=jrqxsnwuqltc1xj9fevk9xb1f)

Want to build VVDec (.dll (Windows)/.dylib (Mac OS)/.so (Linux)) yourself?

Here is a code:

```
git clone https://github.com/fraunhoferhhi/vvdec
cd vvdec
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=1 ..
cmake --build . --config Release
```

The build files can be located at vvdec/bin/release-shared

Windows: vvdec.dll

Mac OS: libvvdec.dylib

Linux: libvvdecLib.so

***Note to Linux: If the file (.so) can't load into your Bitmovin VVDec Player. You have to rename libvvdec.so into libvvdecLib.so***

# System requirements

This program requires architecture of x86_64/AMD64.

### Windows
Operating System: Windows 7 / Windows Server 2012 and later versions

Requirements to run program: Microsoft Visual C++ Redistributable 2015-2017-2019-2022 and vvdec.dll

Internet required to download segments for Bitmovin streams

Offline availability for local segments

---

### Mac OS
Operating System: macOS 10.15 and later versions.

Requirements to run program: Qt framework (version 5) and libvvdec.dylib

Internet required to download segments for Bitmovin streams.

Offline availability for local segments

---

### Linux
Operating System: Linux 3.20+ (Ubuntu 12.04 LTS and later versions)

Requirements to run program: Qt framework (version 5), glib (build-essential) and libvvdecLib.so

Internet required to download segments for Bitmovin streams.

Offline availability for local segments

# Bitmovin VVDec Player (Test compatibility)

### Windows 7+: 

![okd933](https://user-images.githubusercontent.com/88035011/158054088-5d28de91-c2f8-40e4-b1e0-e0a0788fab93.gif)
-------------------------
### macOS 10.15+:

![Macosbitvvdecplayer](https://user-images.githubusercontent.com/88035011/160053200-9f986127-46a5-48ca-b2b3-ba3540afa953.png)
-------------------------
### Linux: 

![LinuxBITVVCTest](https://user-images.githubusercontent.com/88035011/158130385-0f475e1f-9630-4623-acc4-6b0c842b6a35.gif)
-------------------------
Tests will be coming sooner.

- Martin Eesmaa
