# Compatibility Windows Operating System (VLC Media Player v3.0.11.1, o266player build version)

Limitations:

Note to Mac and Linux of o266player VLC: Sorry Mac and Linux users :(, here is a why MacOS and Linux cannot run VLC o266player.

On macOS 10.15.6, I tried build, but it failed, you can have a look for Stack Overflow: [Link](https://stackoverflow.com/questions/70387126/error-1-and-2-trying-to-compile-vlc-o266player-missing-git-and-txt).

On Linux, it doesn't support of VLC (o266player build).
If you want to run VLC (o266player version), you need to run Windows only for a virtual machine or your a real computer.

Windows | Compatibility (only x64)  | Screenshot | Date report (DD/MM/YYYY, 24hr)
------- | ------- | --------------- | ------------- |
Windows 2000/ME or older | :x: (Cannot run custom build) | [Link](https://i.imgur.com/hHnh5Cx.png) | 19/02/2022 18:35:34 (AEDT)
Windows XP | ⚠️ (Terminal only, GUI is not working) | [Link](https://i.imgur.com/v3jMW3d.png) | 11/12/2021 15:18:29 (AEDT)
Windows Vista | ⚠️ (GUI Works, but VVC won't show video)
Windows 7 | :white_check_mark: (All checked) | [Link](https://i.imgur.com/4cANwDQ.png) | 17/12/2021 21:32:38 (AEDT)
Windows 8.0   |   ⚠️ (GUI Works, but VVC won't show video) | [Link](https://i.imgur.com/cl8qASz.png) | 20/02/2022 15:27:40 (AEDT)
Windows 8.1 |   :white_check_mark: (All checked) | [Link](https://i.imgur.com/1Fe6xGW.png) | 17/12/2021 18:23:35 (AEDT)
Windows 10  |   ⚠️ (GUI Works, but VVC won't show video)
Windows 11  |   :white_check_mark: (All checked) | [Link](https://i.imgur.com/Me2L998.png) | 13/12/2021 15:58:55 (AEDT)

Windows Server | Compatibility (only x64) | Screenshot | Date report (DD/MM/YYYY, 24hr)
------- | ------- | --------- | --------- |
Windows Server 2003 | ⚠️ (Terminal only, GUI is not working) | [Link](https://i.imgur.com/G7F2bif.png) | 19/02/2022 21:38:20 (AEDT)
Windows Server 2008 | ⚠️ (GUI Works, but VVC won't show video) | [Link](https://i.imgur.com/GXFgIt8.png) | 20/02/2022 14:02:28 (AEDT)
Windows Server 2012 | :white_check_mark: (All checked) | [Link](https://i.imgur.com/Vcgag8B.png) | 17/12/2021 20:57:16 (AEDT)
Windows Server 2016   | :white_check_mark: (Already checked by Tencent Cloud)
Windows Server 2019 | :black_square_button: (Needs to be tested)
Windows Server 2022  | :black_square_button: (Needs to be tested)

VLC Custom build of o266player only accepts to run 64-bit / x64 on your computer. 32-bit / x86 won't work.

This cannot be run on Windows Vista / Windows Server 2008 or older and Windows 8.0 to play VVC video file of VLC Custom build. 

Note: I'm trying to work it out of VLC 3.0.16.

Reminder: Some operating systems are working to load VVC video format in Virtual Machine softwares, but real machines will work every operating system, example Windows Server 2016 has already been tested by Tencent Cloud.

If your operating system is working to decode VVC video format like you're running on Windows 10, please fork this repository, edit README and make pull request of my original repository from your forked repository. Screenshot must be required winver and VLC Media Player (custom build of o266player)

UPDATE 13th December 2021: VLC Media Player (custom VLC build of o266player, 3.0.11.1 Vetenari, Windows 11) is tested by Martin Eesmaa. It can play only about 600 frames limit / 20+ seconds.
![VLC Media Player (VVC test)](https://user-images.githubusercontent.com/88035011/145756567-d156f630-9e7f-4042-99b5-6ffe8a6b4b64.png)

-   Martin Eesmaa
