# Android vvdec/uvg266 applications (Termux app)

Requirements: Termux app with apk or F-Droid app. For uvg266/vvdecapp pipe, require FFmpeg on Termux app.

See the screenshot of vvdecapp in Termux app:

![termuxvvdecappinandroid](https://user-images.githubusercontent.com/88035011/176990694-52279bf1-86fd-419e-a2b7-1b6d1038ac18.jpg)

All system types of arm64, armeabi, x86 and x86_64 is built on vvdecapp & uvg266, it is use of Termux app.

arm64 - API 21 (64-bit phones only)

armeabi - API 19 (32-bit phones)

x86 - API 19 (32-bit tablets only)

x86_64 - API 21 (64-bit tablets only)

TIP: You can install my built applications:

```
chmod +x vvdecapp uvg266 vvencapp
cp vvencapp vvdecapp uvg266 $PREFIX/bin
```

### vvencapp encoder (Fraunhofer HHI)

Screenshot (tested my phone):

![vvencapptermux](vvencapptermux.png)

Please note, that supports 64-bit programs only.

### uvg266 encoder (Scalable video encoder)

Screenshot:

![termuxuvg266inandroid](https://user-images.githubusercontent.com/88035011/190282518-13c6dfd1-41a4-4a9b-aefe-de9e43c26759.jpg)

Before you download, there were two separated programs:

AndroidUVG266.7z - 10-bit input/encoder only.

AndroidUVG266-8bit.7z - 8-bit input/encoder only.

If you want pipe from FFmpeg to uvg266, you can do command:
```
ffmpeg -i example.mp4 -f yuv4mpegpipe -pix_fmt yuv420p10 -strict -1 - | uvg266 -i - --input-file-format y4m --input-bitdepth 10 -o converted.266
```

For 8-bit uvg266 application, remove `-strict -1`, change from `yuv420p10` to `yuv420p` and remove `--input-bitdepth-10`.

When you want make device sleep during uvg266 encoding, tap Acquire wake lock on Termux notification.

If uvg266 froze itself for a couple minutes without printing info, means finished, tap CTRL + C.

VVDEC might not decode with some uvg266 options (example uvg266 presets unplayable with vvdec: preset placebo & lossless.

- Martin Eesmaa
