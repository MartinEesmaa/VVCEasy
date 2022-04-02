![bitmovinlogo1](https://user-images.githubusercontent.com/88035011/159108926-ee3ef996-4fe4-4c33-87d6-4a016486d27e.png)

# Bitmovin VVDec Player (instructions of encode segments)

If you want put your vvc file into Bitmovin VvDec Player, we need add `--segment`, `-f` as frames and `-fs` as frameskip into vvencapp.

Otherwise, if you put vvc file (which is all together of one file) without segments, your application might freeze your computer and application too.

To make probably decoded well for segments, here is an example of this:

Example of code (1 second/24 frames). After first segment (1 sec), it will go up 1 second (total frames 48):
```
vvencapp --qp 34 -i out.yuv -s 854x480 -r 24 --preset slow --threads 16 --tier high --segment mid -f 24 -fs 24 -o EXTREME-1.266
```

First segment (first) will be beginning from video, 0 sec -> 1 sec. (segment-0.vvc)

Middle segment (mid) will be during from video, 1 sec -> 2 sec. (segment-1.vvc)

Last segment (last) will be ending from video, 2 sec -> 3 sec. (segment-2.vvc)

Total is three seconds and three segments. Still not understand? Example of my segments, including log:

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

[Windows Pre-Builded](https://www.dropbox.com/s/75ouoeadcr2cl53/BitVVDecPlayerWIN.7z)

[Mac OS Pre-Builded](https://www.dropbox.com/s/ilsoica7c8dh4hq/BitVVDecPlayerMAC.7z)

[Linux Pre-Builded](https://www.dropbox.com/s/bihm3pyh21lcvte/BitVVDecPlayerLINUX.7z)

Wanna build VVDec (.dll (Windows)/.dylib (Mac OS)/.so (Linux)) yourself?

Here is an code:

```
git clone https://github.com/fraunhoferhhi/vvdec.git
cd vvdec
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=1 ..
cmake --build . --config Release
```

The build files might be vvdec/bin/release-shared

Windows: vvdec.dll

Mac OS: libvvdec.dylib

Linux: libvvdecLib.so

***Note to Linux: If the file (.so) can't load into your Bitmovin VVDec Player. You have to rename libvvdec.so into libvvdecLib.so***

# System requirements

### Windows
Operating System: Windows 7 / Windows Server 2012 and earlier versions

System type: x64

Requirements to run program: Microsoft Visual C++ Redistributable 2015-2017-2019-2022 and vvdec.dll

Internet required to download segments for Bitmovin streams

Offline availability for segments

---

### Mac OS
Operating System: macOS 10.15 and earlier versions.

System type: x64

Requirements to run program: Qt framework (version 5) and libvvdec.dylib

Internet required to download segments for Bitmovin streams

Offline availability for segments

---

### Linux
Operating System: Linux (Ubuntu 18.04 and earlier versions)

System type: x64

Requirements to run program: Qt framework (version 5), glib (build-essential) and libvvdecLib.so

Internet required to download segments for Bitmovin streams

Offline availability for segments

# Bitmovin VVDec Player (Test compatability)

### Windows 7+: 

![okd933](https://user-images.githubusercontent.com/88035011/158054088-5d28de91-c2f8-40e4-b1e0-e0a0788fab93.gif)
-------------------------
### macOS 10.15+:

![Macosbitvvdecplayer](https://user-images.githubusercontent.com/88035011/160053200-9f986127-46a5-48ca-b2b3-ba3540afa953.png)
-------------------------
### Linux: 

![LinuxBITVVCTest](https://user-images.githubusercontent.com/88035011/158130385-0f475e1f-9630-4623-acc4-6b0c842b6a35.gif)
-------------------------
Tests will be come soon later.

- Martin Eesmaa
