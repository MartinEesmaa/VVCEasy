using System;
using System.Threading;

namespace VVCEasy
{
    public class Program
    {
        public static void Main()
        {
            bool exit = false;
            Console.Title = "Martin Eesmaa / VVCEasy";
            Console.WriteLine("MARTIN EESMAA / VVCEasy");
            Console.WriteLine("Welcome to VVCEasy. (.NET Console Alpha Version, v.0.0.1)");
            Console.ReadLine();
            do
            {
                Console.Clear();
                Console.WriteLine("VVCEasy (.NET Console Alpha Version, v.0.0.1)");
                Console.WriteLine("Note: C# is not ready yet, malfunction mode");
                Console.WriteLine("");
                Console.Title = "Martin Eesmaa / VVCEasy";
                Console.WriteLine("What would you like to do for encode/decode of VVC?\n1. Encode\n2. Decode\n3. Help\n4. Exit\n5. Test path environment\n6. Install VLC Media Player (o266player, Windows x64)\n7. Install quickly through Anaconda for ffmpeg (Windows)\n8. Install VVdec Web Player\n9. Decompress WindowsVVC.7z (Before you use new VVCEasy version!!!)");

                string input = Console.ReadLine();

                if (input == "1")
                {
                    EncodeStart:
                    Console.Clear();
                    Console.Title = "Encode to VVC";
                    Console.WriteLine("Welcome to VVC encoder.\nWhat do you like encode to VVC?\nBefore we move to settings quality, is your video lossy or lossless?\n1. Lossy (example YouTube videos, Web videos, lossy compressed videos, and other webs)\n2. Lossless (example XIPH Media, Camera uncompressed (MOV/MP4/AVI), Apple ProRes and others uncompressed files)\n3. Go back to menu");
                    
                    string input2 = Console.ReadLine();
                    if (input2 == "1")
                    {
                        Console.Clear();
                        Console.Title = "Lossy settings with Lossy compressed (VVC Encoder)";
                        Console.WriteLine("Do you have YUV?\nIf you have YUV already, move your YUV file into C:/Program Files/VVCEasy/\nIf you do not have YUV, your instruction will go to next...\n1. I have YUV already (I am ready)\n2. No, I am not ready yet (go back to previous)\nIf you don't have Y4M already... you need transcode file from your lossy video file to YUV.\nExample: ffmpeg -i yourfile.mp4 -strict 1 yourfinal.yuv\n");
                        
                        string input3 = Console.ReadLine();

                        if (input3 == "1")
                        {
                            Console.Clear();
                            Console.Title = "VVC ENCODER (YUV LOSSY)";
                            Console.WriteLine("Before we start encode from your YUV file to VVC file, I'm afraid I cannot do automatically for you.\nYou have to manually encode to VVC, the batchfile won't work.\nHere is code: vvencapp --qp 38 -i yourinput.yuv -s 854x480 -r 30 -o youroutputlossy.266\nYOU HAVE TO REPLACE VIDEO SIZE AND FRAME RATE. -s is video size and -r is frame rate.\nYou can also add for --tier high or/and 10-bit video -c yuv420_10, if necessary.");
                            Console.ReadLine();
                        }
                        else if (input3 == "2")
                        {
                            goto EncodeStart;
                        }
                    }
                }
                else if (input == "2")
                {
                    Console.Clear();
                    Console.Title = "Decode from VVC to YUV/Y4M";
                    Console.WriteLine("Do you want to transcode back from VVC to YUV or Y4M? Which did you choose settings?\nChoosing settings will transcode back.\nYou need copy from your VVC file to C:/Program Files/VVCEasy/WindowsVVC/.\nWindows Explorer will open automatically.\nAfter copying your VVC file into VVCEasy folder, you need rename to VVC.vvc.\nIt will transcode from your VVC file to YUV/Y4M.\nAfter transcoding, your transcoded file should be: C:/Program Files/VVCEasy/transcodedback\nNote, if you are using portable, like you git cloned VVCEasy or downloaded source files, go to your Downloads folder and select VVCEasy.\nPortable won't work, you need move from your Downloads folder/VVCEasy into Program Files/VVCEasy.\n1. YUV (lossy video VVC)\n2. Y4M (lossless video VVC)");

                    string decodestart1 =  Console.ReadLine();

                    if (decodestart1 == "1")
                    {
                        Console.Clear();
                        Console.Title = "STARTING TRANSCODING BACK FROM VVC TO YUV...";
                        Console.Beep();
                        Console.WriteLine("Sorry, this is currently maintenance of C#");
                        Console.ReadLine();
                    }
                    else if (decodestart1 == "2")
                    {
                        Console.Clear();
                        Console.Title = "STARTING TRANSCODING BACK FROM VVC TO Y4M...";
                        Console.Beep();
                        Console.WriteLine("Sorry, this is currently maintenance of C#");
                        Console.ReadLine();
                    }
                }
            }
            while (exit == false);
        }
    }
}
