#!/bin/bash

printf "\033[33m"
echo "Warning: It is deprecated, but you're welcome to use it anyway."
printf "\033[39m"
PREFIX="$(pwd)/buildffmpeg/prefix"
echo "Note: Your prefix folder with full directory will be built: $PREFIX"
case "$(uname -s)" in
    Linux*)
        OS="Linux"
        DISTRO=$(cat /etc/*release | grep ^ID= | cut -d= -f2 | tr -d '"')
        echo "Building FFmpeg VVCEasy $OS version..."
        echo "Downloading system required packages..."

        case $DISTRO in
            debian|ubuntu)
                echo "Detected Debian/Ubuntu"
                sudo apt update
                echo "Installing dependencies for Debian/Ubuntu..."
                sudo apt install build-essential cmake nasm autoconf pkg-config \
                python3-setuptools ninja-build python3-pip libtool git wget xxd -y
                sudo pip3 install meson
                ;;
            arch)
                echo "Detected Arch Linux"
                sudo pacman -Sy
                echo "Installing dependencies for Arch..."
                sudo pacman -S --noconfirm base-devel cmake nasm autoconf pkg-config \
                python-setuptools ninja python-pip libtool git wget xxd
                sudo pip install meson
                ;;
            fedora)
                echo "Detected Fedora"
                sudo dnf update -y
                echo "Installing dependencies for Fedora..."
                sudo dnf install -y gcc gcc-c++ cmake nasm autoconf pkgconfig \
                python3-setuptools ninja-build python3-pip libtool git wget xxd
                sudo pip3 install meson
                ;;
            gentoo)
                echo "Detected Gentoo"
                sudo emerge --sync
                echo "Installing dependencies for Gentoo..."
                sudo emerge -av dev-util/cmake media-libs/nasm sys-devel/autoconf \
                dev-python/setuptools dev-util/ninja dev-python/pip sys-libs/libtool \
                dev-vcs/git net-misc/wget app-editors/vim
                sudo pip3 install meson
                ;;
            *)
                echo "Unsupported Linux distribution: $DISTRO"
                exit 1
                ;;
        esac
        ;;
    MSYS*|MINGW*)
        OS="Windows"
        extra="--disable-w32threads --enable-libcodec2"
        echo "Building FFmpeg VVCEasy Windows version..."
        echo "Updating and upgrading MSYS2 packages..."
        pacman -Sy
        echo "Installing MSYS2 packages..."
        pacman -S python git nasm vim wget xxd $MINGW_PACKAGE_PREFIX-{toolchain,cmake,autotools,meson,ninja}
        ;;
    Darwin*)
        OS="macOS"
        echo "Building FFmpeg VVCEasy macOS version..."
        echo "Checking for Brew packages requirements..."
        
        if ! command -v brew &> /dev/null; then
            echo "Homebrew is not installed. Please install Homebrew and try again."
            exit 1
        else
            brew install ffmpeg cmake nasm opus meson autoconf automake wget ninja
        fi
        ;;
    *)
        echo "Only for Windows, macOS & Linux are only supported"
        exit 1
        ;;
esac

clonepull() {
  if [ ! -d "$1" ]; then
    git clone --depth=1 "$2" "$1"
  else
    git -C "$1" pull
  fi
}

[ ! -d buildffmpeg ] && mkdir buildffmpeg
cd buildffmpeg

[ ! -d prefix ] && mkdir prefix

clonepull FFmpeg-VVC https://github.com/MartinEesmaa/FFmpeg-VVC
clonepull vvenc https://github.com/fraunhoferhhi/vvenc
clonepull vvdec https://github.com/fraunhoferhhi/vvdec
clonepull fdk-aac https://github.com/mstorsjo/fdk-aac
clonepull SDL https://github.com/libsdl-org/SDL -b SDL2
clonepull libxml2 https://github.com/gnome/libxml2
clonepull opus https://github.com/xiph/opus
clonepull libjxl https://github.com/libjxl/libjxl
clonepull zimg https://github.com/sekrit-twc/zimg
clonepull soxr https://github.com/chirlu/soxr
clonepull dav1d https://code.videolan.org/videolan/dav1d
clonepull vmaf https://github.com/netflix/vmaf

gitsub="submodule update --init --recursive --depth 1 --recommend-shallow"

if [ $OS = "Windows" ]; then
clonepull codec2 https://github.com/drowe67/codec2
fi

if [ ! -d libjxl ]; then
sed -i 's/-lm/-lm -lstdc++/g' libjxl/lib/jxl/libjxl.pc.in libjxl/lib/threads/libjxl_threads.pc.in
git -C libjxl $gitsub
fi

if [ ! -d zimg ]; then
git -C zimg $gitsub
wget -q -O - https://raw.githubusercontent.com/m-ab-s/mabs-patches/master/zimg/0001-libm_wrapper-define-__CRT__NO_INLINE-before-math.h.patch | git -C zimg apply
fi

make="make install-r install-prefix=$PREFIX"
autogen="./autogen.sh && ./configure --prefix=$PREFIX --enable-static --disable-shared && make install -j $(nproc)"
cmakeoptions="-DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS=OFF -B build"
mesonoptions="-Ddefault_library=static -Dprefix=$PREFIX -Denable_docs=false"

for MKBUILD in vmaf/libvmaf dav1d; do
    mkdir -p "$MKBUILD"/build
done

cd vvenc && $make && cd ..
cd vvdec && $make && cd ..
cd fdk-aac && $autogen && cd ..
cd libxml2 && $autogen && cd ..
cd opus && CFLAGS="-O2 -D_FORTIFY_SOURCE=0" LDFLAGS="-flto -s" $autogen && cd ..
cd libjxl && cmake $cmakeoptions -DBUILD_TESTING=OFF -DJPEGXL_ENABLE_{BENCHMARK,MANPAGES,EXAMPLES,DOXYGEN}=OFF -DJPEGXL_FORCE_SYSTEM_BROTLI=ON -G Ninja && ninja -C build install && cd ..
cd vmaf/libvmaf/build && CFLAGS="-msse2 -mfpmath=sse -mstackrealign" meson -Denable_tests=false -Denable_float=true $mesonoptions .. && ninja install && cd ../../..
cd SDL && cmake $cmakeoptions && make install -C build -j $(nproc) && cd ..
cd zimg && $autogen && cd ..
cd soxr && cmake -D{WITH_{LSR_BINDINGS,OPENMP},BUILD_TESTS}=off $cmakeoptions && cmake --build build -j $(nproc) --target install && cd ..
cd dav1d/build && meson $mesonoptions .. && ninja install && cd ../..

sed -i 's/-lm/-lm -lstdc++/g' $PREFIX/lib/pkgconfig/libvmaf.pc

if [ "$OS" = "Windows" ]; then
    cd codec2
    sed -i 's|if(WIN32)|if(FALSE)|g' CMakeLists.txt
    grep -ERl "\b(lsp|lpc)_to_(lpc|lsp)" --include="*.[ch]" | \
                xargs -r sed -ri "s;((lsp|lpc)_to_(lpc|lsp));c2_\1;g"
    cmake -B build $cmakeoptions -D{UNITTEST,INSTALL_EXAMPLES}=off -G "MinGW Makefiles"
    cmake --build build -j $nproc --target install
    cd ..
fi

cd FFmpeg-VVC
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
./configure --prefix=$PREFIX --enable-{static,pic,sdl2} --disable-audiotoolbox --pkg-config-flags="--static" --extra-ldexeflags="-static" \
--enable-lib{fdk-aac,vvenc,vvdec,xml2,opus,dav1d,jxl,zimg,vmaf,soxr} $extra --extra-version=VVCEasy && \
make -j
cd ..
echo It is ready to go for prebuilt binaries of FFmpeg-VVC, you need to go directory called FFmpeg-VVC.
echo "- 2024 Martin Eesmaa (VVCEasy, MIT License)"
