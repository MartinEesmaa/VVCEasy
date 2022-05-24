# VLC Media Player (Inter Digital VLC VTM Decoder Plugin installation of Windows and Linux)
This can work only for VLC 3.0.9.2 and later version (eg. 3.0.17.4). VLC 4.0.0-dev won't work.

To install Inter Digital VLC VTM Decoder Plugin, you need VLC Media Player latest version installed on your computer and supported 64-bit.

Step 1: Copy libvtmdec.dll and libvvcdecoder_plugin.dll into your VLC Media Player folder following folder: VLC/plugins/codec

C:\Program Files\VideoLAN\VLC\plugins\codec

Step 2: Copy libvvctsdemux_plugin.dll into your VLC Media Player folder following: VLC/plugins/demux

C:\Program Files\VideoLAN\VLC\plugins\demux

Step 3: Enjoy and play your h266 file into your VLC Media Player :).

### For Linux users

Open terminal, type `sudo su` to gain root access, copy code:
```
cp libvvcdecoder_plugin.so /lib/x86_64-linux-gnu/vlc/plugins/codec
cp libvtmdec.so /lib/x86_64-linux-gnu/vlc/plugins/codec
cp libvctsdemux_plugin.so /lib/x86_64-linux-gnu/vlc/plugins/demux
```

VLC from Snap Store:
```
cp libvvcdecoder_plugin.so /snap/vlc/2344/usr/lib/vlc/plugins/codec
cp libvtmdec.so /snap/vlc/2344/usr/lib/vlc/plugins/codec
cp libvctsdemux_plugin.so /snap/vlc/2344/usr/lib/vlc/plugins/demux

Preview:

![preview](vvceasylinuxvlc.png)

### Alternative using command line of Windows

Open Windows Terminal/Windows Command Prompt, make sure you do cd of C:/Users/(put your username)/Downloads/VVCEasy/VLC

Copy code following:
```
copy libvtmdec.dll "%programfiles%\VideoLAN\VLC\plugins\codec" 
copy libvvcdecoder_plugin.dll "%programfiles%\VideoLAN\VLC\plugins\codec"
copy libvvctsdemux_plugin.dll "%programfiles%\VideoLAN\VLC\plugins\demux"
```

Note to VLC 4.0.0-dev users:

The VVC video file cannot loaded by newest version of VLC 4.0.0-dev, because it is nightly build and it's unstable.

For more information about VLC 4.0.0-dev see: https://www.theverge.com/2021/2/12/22279750/vlc-4-0-new-user-interface-videolan-media-player-video-music-movie-database-web-player

I tried build two DLL files on VLC 4.0.0 SDK, but the compiler failed, so you have to use VLC 3.0.9.2 and latest of VLC 3 version branch.

-   Martin Eesmaa
