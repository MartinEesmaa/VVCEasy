using System.Net;

namespace VVCEasy
{
    public class Program
    {
        public static void Main()
        {
            string version = "v.1.0.1";
            string codeversion = "Summer time for fun.";
            string title = "Martin Eesmaa / VVCEasy";
            bool exit = false;
            Console.Title = title;
            Console.WriteLine("Martin Eesmaa / VVCEasy\nWelcome to VVCEasy. (.NET Console Release Version, " + version + ")\nVersion codename: " + codeversion);
            Console.ReadLine();
            do
            {
                Console.Clear();
                Console.WriteLine("VVCEasy (.NET Console Release Version, " + version + ")");
                Console.WriteLine("Version codename: " + codeversion);
                Console.WriteLine("Note: C# is not ready yet, malfunction mode\n");
                Console.Title = title;
                Console.WriteLine("What would you like to do for encode/decode of VVC?\n1. Encode\n2. Decode\n3. Help\n4. Exit\n5. Install/Test path environment\n6. Install FFmpeg VVDec support\n7. Install quickly through Anaconda for ffmpeg (Windows)\n8. Install VVdec Web Player\n9. Decompress WindowsVVC.7z (Before you use new VVCEasy version!!!)\n10. Install vvDecPlayer from BitMovin\n11. Install/Update VLC VTM Plugins (Windows/Linux x64 of VLC plugins by Inter Digital Inc)\n12. Install MPV Windows/Android (libvvdec plugin)\n13. Tests of VVC videos");

                string input = Console.ReadLine();

                if (input == "1")
                {
                encodestart:
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
                            goto encodestart;
                        }
                    }
                }
                else if (input == "2")
                {
                    Console.Clear();
                    Console.Title = "Decode from VVC to YUV/Y4M";
                    Console.WriteLine("Do you want to transcode back from VVC to YUV or Y4M? Which did you choose settings?\nChoosing settings will transcode back.\nYou need copy from your VVC file to C:/Program Files/VVCEasy/WindowsVVC/.\nWindows Explorer will open automatically.\nAfter copying your VVC file into VVCEasy folder, you need rename to VVC.vvc.\nIt will transcode from your VVC file to YUV/Y4M.\nAfter transcoding, your transcoded file should be: C:/Program Files/VVCEasy/transcodedback\nNote, if you are using portable, like you git cloned VVCEasy or downloaded source files, go to your Downloads folder and select VVCEasy.\nPortable won't work, you need move from your Downloads folder/VVCEasy into Program Files/VVCEasy.\n1. YUV (lossy video VVC)\n2. Y4M (lossless video VVC)");

                    string decodestart1 = Console.ReadLine();

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
                else if (input == "3")
                {
                helpingvvc:
                    Console.Clear();
                    Console.WriteLine("Welcome to VVCEasy help instructions!\nHere is tutorial about... How to use VVCEasy?");
                    Console.ReadLine();
                    Console.WriteLine("Step 1: Run on VVCEasy.bat. When you see the screen of Welcome to VVCEasy. You can press any key continue to main menu.\nStep 2: Here are the list of main menus, that you need type any number will go to direction like (goto) command.\nStep 3: Follow the command instructions and that is easy.");
                    Console.ReadLine();
                    Console.WriteLine("If you have any problems that you do not understand of VVCEasy. Please contact to Martin Eesmaa by creating issues for questions or/and problems.\nDo you want to start over help instructions? If yes, then it will go back from beginning. If No, going to back menu. Y/N?");

                    string helper = Console.ReadLine();

                    if (helper == "Y")
                    {
                        goto helpingvvc;
                    }
                }
                else if (input == "4")
                {
                    Console.Clear();
                    Console.Title = "Have a wonderful day!";
                    Console.WriteLine("Have a wonderful day! Thank you for using VVCEasy. :)");
                    Console.WriteLine("    _   _                 _                      \n    | | | |               | |                     \n    | |_| |__   __ _ _ __ | | ___   _  ___  _   _ \n    | __| '_ / / _` | '_ /| |/ / | | |/ _ /| | | |\n    | |_| | | | (_| | | | |   <| |_| | (_) | |_| |\n     /__|_| |_|/__,_|_| |_|_|/_\\__, |/___/ /__,_|\n                                 __/ |            \n                                |___/\n\n\n    __      ____      _______ ______                \n    / /    / // /    / / ____|  ____|               \n      / // /    / // /| |    |  __| / _` / __| | | |\n       /  /      /  / | |____| |___| (_| /__ / |_| |\n        //        //   /_____|______/__,_|___//__, |\n                                               __/ |\n                                              |___/ \n\n\n     __  __            _   _         ______                                \n    |  //  |          | | (_)       |  ____|                               \n    | /  / | __ _ _ __| |_ _ _ __   | |__   ___  ___ _ __ ___   __ _  __ _ \n    | |//| |/ _` | '__| __| | '_ /  |  __| / _ // __| '_ ` _ / / _` |/ _` |\n    | |  | | (_| | |  | |_| | | | | | |___|  __//__ / | | | | | (_| | (_| |\n    |_|  |_|/__,_|_|   /__|_|_| |_| |______/___||___/_| |_| |_|/__,_|/__,_|\nCopyright 2021-2022 Martin Eesmaa\n\nExiting program...");
                    Thread.Sleep(5000);
                    exit = true;
                }
                else if (input == "5")
                {
                    Console.Clear();
                    Console.Title = "INSTALL/TEST PATH ENVIRONMENT";
                    Console.WriteLine("Martin Eesmaa is testing your paths, that you installed programs in PATH. Not sure, what is path?\nYou can go here for link: https://stackoverflow.com/questions/4910721/python-on-cmd-path\nAlso you can also search What is PATH in Windows? in DuckDuckGo or SearX.\nAre you ready to test? (Y/N) or type I to install path environment.");

                    string readytestbefore = Console.ReadLine();

                    if (readytestbefore == "Y")
                    {
                        Console.Title = "Testing time...";
                        Console.WriteLine("Sorry, it's malfunction mode in C#...");
                        Console.ReadLine();
                    }
                    else if (readytestbefore == "I")
                    {
                        Console.WriteLine("Installer path environment will be only for 7-Zip.\nOthers programs should need manual, but Python, FFmpeg, wget and git must be installed manually and add automatically path environments.\nDo you want patch 7-Zip on your path environment, so you can type 7z next time.\nInstall 7-Zip on your path environments? Y/N? No means go back to test menu.\n\nAnswer: ");

                        string installpath1 = Console.ReadLine();

                        if (installpath1 == "Y")
                        {
                            Console.Title = "INSTALLING 7-ZIP on your path environments...";
                            Console.WriteLine("Sorry, it's malfunction mode in C#...");
                            Console.ReadLine();
                        }
                    }
                }
                else if (input == "6")
                {
                    Console.Clear();
                    Console.Title = "FFmpeg VVDec support";
                    Console.WriteLine("Hello, would you like to download FFmpeg VVDec support? Y/N?");

                    string vlcinstall = Console.ReadLine();

                    if (vlcinstall == "Y")
                    {
                        Console.WriteLine("Your favourite operating system is available on FFmpeg VVDec support. Please copy the link to a web browser.\nWindows: https://mega.nz/file/e1MEUAwR#c7u7vDvwzp6JiSaRDwhCyOaH4cGnx1xQDPyKgbAd-qM\nMac OS: https://mega.nz/file/K09gRbYJ#SewWjY4LqVdvlivXJhqQMjrsXO6ec8a1jmapj5nO2Gs\nLinux (Only Ubuntu 20.04 built): https://mega.nz/file/T8l0GTqa#oWsDDrFYjzf3LhS9zRkuqqBz6H4yJmNQUNiu_erVQLo\n\nSee information on FFMPEGVVC.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md\nPress enter to go back menu.\n");
                        Console.ReadLine();
                    }
                }
                else if (input == "7")
                {
                    Console.Clear();
                    Console.Title = "ANACONDA";
                    Console.WriteLine("Welcome to Anaconda Quick Install. This will only one task for ffmpeg. Would you like to install? Y/N?");

                    string anacondaman = Console.ReadLine();

                    if (anacondaman == "Y")
                    {
                        Console.WriteLine("SUCCESS, going to back menu...");
                        Console.ReadLine();
                    }
                }
                else if (input == "8")
                {
                    Console.Clear();
                    Console.Title = "VVdec Web Player.";
                    Console.WriteLine("By installing, you will have to agree to download VVDec Web Player from Fraunhoferhhi GitHub.\nSee the code of VVDEC Web Player: https://github.com/fraunhoferhhi/vvdecWebPlayer\nWhen you agree to install, it will clone of VVDec Web Player repository using git. After git, we will copy from VVDECWEBINSTALL files into vvdecWebPlayer/bin folder.\nAfter all of that, we will run Python to start web server of your localhost port 8000.\nWould you like to install of VVDEC Web Player?");

                    string okletsdoit = Console.ReadLine();

                    if (okletsdoit == "Y")
                    {
                        Console.Clear();
                        Console.Title = "INSTALLING VVDEC WEB PLAYER...";

                        using (WebClient web1 = new())
                            web1.DownloadFile("", "");

                        Console.WriteLine("Sorry, the command is not ready yet...");
                        Console.ReadLine();
                    }
                }
                else if (input == "9")
                {
                    Console.Clear();
                    Console.Title = "WindowsVVC.7z (decompressing)";
                    Console.WriteLine("Decompressing...\nSorry, the command is not ready yet...");
                    Console.ReadLine();
                }
                else if (input == "10")
                {
                    Console.Clear();
                    Console.Title = "Install vvDecPlayer from BitMovin";
                    Console.WriteLine("Would you like to install?\nY/N?\n");

                    string installbitmovin = Console.ReadLine();

                    if (installbitmovin == "Y")
                    {
                    bitmovingotoinstall:
                        Console.Title = "Installing vvDecPlayer from BitMovin...";
                        Console.WriteLine("Installing vvDecPlayer from BitMovin on your computer...\nWhich operating system are you using?\nWindows, Mac or Linux?\nType W for Windows\nType M for Mac\nType L for Linux");

                        string installbitmovin1 = Console.ReadLine();

                        if (installbitmovin1 == "W")
                        {
                            Console.WriteLine("Installing vvDecPlayer from BitMovin for Windows...\nSorry, the C# console is not ready yet...");

                            using (WebClient web1 = new())
                                web1.DownloadFile("", "");

                            Console.ReadLine();
                        }
                        else if (installbitmovin1 == "M")
                        {
                            Console.WriteLine("Installing vvDecPlayer from BitMovin for Mac OS...\nSorry, the C# console is not ready yet...");

                            using (WebClient web1 = new())
                                web1.DownloadFile("", "");

                            Console.ReadLine();
                        }
                        else if (installbitmovin1 == "L")
                        {
                            Console.WriteLine("Installing vvDecPlayer from BitMovin for Linux...\nSorry, the C# console is not ready yet...");

                            using (WebClient web1 = new())
                                web1.DownloadFile("", "");

                            Console.ReadLine();
                        }
                        else if (installbitmovin1 == "Back")
                        {

                        }
                        else
                        {
                            Console.WriteLine("You typed wrong input command, follow the commands instructions... type Back to go back menu...");
                            goto bitmovingotoinstall;
                        }
                    }
                }
                else if (input == "11")
                {
                    Console.Clear();
                    Console.Title = "VLC VTM Plugins Install (Windows & Linux)";
                    Console.WriteLine("Welcome to VLC Media Player of VTM Plugins Installation.\nYou need to run Windows version of Windows Vista / Windows Server 2008 to play VVC files.\nWindows XP can't load VTM plugins, but other plugins work.\nSystem type only = x64\nLinux is now available, see Linux installation at: https://github.com/MartinEesmaa/VVCEasy/tree/master/INSTALLVLCPLUGIN#for-linux-users\nCurrent version = 3.0.17.4\nWould you like to install VTM plugins to your VLC Media Player? Y/N?");

                    string vtmvlcinstallnow1 = Console.ReadLine();

                    if (vtmvlcinstallnow1 == "Y")
                    {
                        Console.Title = "Installing of VLC VTM Plugins by Inter Digital Inc... (Compiled by Martin Eesmaa)";
                        Console.WriteLine("Installing of VLC VTM Plugins by Inter Digital Inc... (Compiled by Martin Eesmaa)\nSorry C# is malfunction mode...");

                        using (WebClient web1 = new())
                            web1.DownloadFile("", "");

                        Console.ReadLine();
                    }
                }
                else if (input == "12")
                {
                    Console.Clear();
                    Console.Title = "Android MPV PLayer (OpenVVC support)";
                    Console.WriteLine("See information MPV.md or online Github: https://github.com/MartinEesmaa/VVCEasy/blob/master/MPV.md\nPress enter to go back menu.\n");
                    Console.ReadLine();
                }
                else if (input == "13")
                {
                    Console.Clear();
                    Console.Title = "Tests of VVC videos";
                    Console.WriteLine("Please see the paragraph in README.md.\nhttps://github.com/MartinEesmaa/VVCEasy/#tests-of-vvc-videos\n\nSee information on FFMPEGVVC.md or online GitHub: https://github.com/MartinEesmaa/VVCEasy/blob/master/FFMPEGVVC.md\n\nPress enter to go back menu.");
                    Console.ReadLine();
                }
            }
            while (exit == false);
        }
    }
}
