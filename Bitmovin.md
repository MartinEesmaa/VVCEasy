![bitmovinlogo1](https://user-images.githubusercontent.com/88035011/159108926-ee3ef996-4fe4-4c33-87d6-4a016486d27e.png)

# Bitmovin VVDec Player (instructions of encode segments)

If you want put your vvc file into Bitmovin VvDec Player, we need add `--segment`, `-f` as frames and `-fs` as frameskip into vvencapp.

Otherwise, if you put vvc file (which is all together of one file) without segments, your application might freeze your computer and application too.

To make probably decoded well for segments, here is an example of this:

Example of code (1 second/24 frames). After first segment (1 sec), it will go up 1 second (total frames 48):
```
vvencapp --qp 34 -i out.yuv -s 854x480 -r 24 --preset slow --threads 16 --tier high --segment mid -f 24 -fs 24 -o EXTREME-1.266
```

First segment will be beginning from video, 0 sec -> 1 sec. (segment-0.vvc)

Middle segment will be during from video, 1 sec -> 2 sec. (segment-1.vvc)

Last segment will be ending from video, 2 sec -> 3 sec. (segment-2.vvc)

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


# Bitmovin VVDec Player (Test compatability)

### Windows 7+: 

![okd933](https://user-images.githubusercontent.com/88035011/158054088-5d28de91-c2f8-40e4-b1e0-e0a0788fab93.gif)
-------------------------
macOS 10.15+:
-------------------------
### Linux: 

![LinuxBITVVCTest](https://user-images.githubusercontent.com/88035011/158130385-0f475e1f-9630-4623-acc4-6b0c842b6a35.gif)
-------------------------
Tests will be come soon later.

- Martin Eesmaa
