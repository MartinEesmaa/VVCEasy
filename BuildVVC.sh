#!/usr/bin/env sh
OS=$(uname)
DISTRO=""

echo "Martin Eesmaa / VVC Compiler (vvdec and vvenc)"

# Detect Linux distribution
if [ "$OS" = "Linux" ]; then
    if [ -f /etc/os-release ]; then
        DISTRO=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
    fi
fi

# Detect Android environment on Termux app
if [ -f /data/data/com.termux/files/usr/bin/termux-change-repo ]; then
    echo "Sorry, Android native build is not supported. Please use cross compiling of Android using NDK on a computer."
    exit 1
fi

if [ "$OS" = "Linux" ]; then
    echo "You're running on $OS with distribution $DISTRO of bash script version to compile VVC binaries"
    else
    echo "You're running on $OS of bash script version to compile VVC binaries"
fi

if [ "$OS" = "SunOS" ] || [ "$OS" = "NetBSD" ]; then
    echo "Sorry, SunOS like Oracle Solaris and NetBSD are not supported due to various error compilations for compiling VVC binaries."
    exit 1
fi

echo "Make sure your packages are up to date."
echo "Checking and installing required packages..."
echo "Always confirm manual review installation."

setup_linux() {
    sudo $pkgupdate
    sudo $pkginstall
}

setup_macos() {
    echo "Please make sure Xcode is installed in your Applications."
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew and rerun the script again."
        exit 1
    fi
    if ! brew list | grep -q cmake; then
        echo "Installing cmake..."
        brew install cmake
    fi
}

setup_msys64() {
    pacman -Sy
    pacman -S base-devel cmake git ccache
}

setup_freebsd() {
    pkg update
    pkg install cmake git gmake
}

setup_openbsd() {
    if ! command -v cmake &> /dev/null || ! command -v git &> /dev/null; then
        echo "Please install cmake and git using pkg_add and try again."
        echo "Manual installation command: pkg_add cmake git"
        exit 1
    fi
}

setup_haiku() {
    pkgman install cmake
}

build_repos() {
    if [ "$OS" = "Darwin" ] || [ "$OS" = "FreeBSD" ] || [ "$OS" = "OpenBSD" ]; then
        CORES=$(sysctl -n hw.ncpu || echo 1)
    else
        CORES=$(nproc || echo 1)
    fi

    for clone in vvdec vvenc; do
        if [ ! -d $clone ]; then
            git clone --depth=1 https://github.com/fraunhoferhhi/$clone.git
        else
            git -C $clone pull
        fi
    done

    for repo in vvdec vvenc; do
        cmake -B $repo/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static" $extrafix
        cmake --build $repo/build -j $CORES
    done
}

# Main script execution
case "$OS" in
    Linux)
        case "$DISTRO" in
            debian|ubuntu)
                pkgupdate="apt update"
                pkginstall="apt install build-essential cmake git ccache"
                ;;
            fedora)
                pkgupdate="dnf update"
                pkginstall="dnf install cmake gcc gcc-c++ make git ccache"
                ;;
            arch)
                pkgupdate="pacman -Sy"
                pkginstall="pacman -S base-devel cmake git ccache"
                ;;
            gentoo)
                pkgupdate="emerge --sync"
                pkginstall="emerge cmake git ccache"
                ;;
            *)
                echo "Unsupported Linux distribution: $DISTRO"
                exit 1
                ;;
        esac
        setup_linux
        ;;
    Darwin)
        setup_macos
        ;;
    MSYS_NT*|MINGW64*)
        setup_msys64
        ;;
    FreeBSD)
        setup_freebsd
        ;;
    OpenBSD)
        setup_openbsd
        ;;
    Haiku)
        extrafix="-DCMAKE_C_FLAGS="-fPIC" -DCMAKE_CXX_FLAGS="-fPIC""
        setup_haiku
        ;;
    *)
        echo "Unsupported OS: $OS"
        echo "Supports Windows MSYS64, macOS, Linux, FreeBSD, OpenBSD and Haiku."
        echo "May coming soon for some platforms..."
        exit 1
        ;;
esac

build_repos
echo "Please see the build files starting with (vvdec/vvenc)/bin/release-static."
echo "Finished building vvdec & vvenc."
