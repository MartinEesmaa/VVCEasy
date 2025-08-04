#!/usr/bin/env bash
OS=$(uname)
DISTRO=""

# Detect Linux distribution
if [ "$OS" = "Linux" ]; then
    if [ -f /etc/os-release ]; then
        DISTRO=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
    fi
fi

echo "Martin Eesmaa / VVC Compiler (vvenc and vvdec)"

if [ "$OS" = "Linux" ]; then
    echo "You're running on $OS with distribution $DISTRO of bash script version to compile VVC binaries"
    else
    echo "You're running on $OS of bash script version to compile VVC binaries"
fi

if [ "$OS" = "SunOS" ]; then
    echo "Sorry, SunOS like Oracle Solaris is not supported due to various error compilations for compiling VVC binaries."
    exit 1
fi

echo "Checking and installing required packages..."

setup_debian() {
    sudo apt update && sudo apt upgrade -y
    sudo apt install build-essential cmake git -y
}

setup_fedora() {
    sudo dnf update -y
    sudo dnf install cmake gcc gcc-c++ make git -y
}

setup_arch() {
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm base-devel cmake git
}

setup_gentoo() {
    sudo emerge --sync
    sudo emerge cmake git
}

setup_macos() {
    echo "Please make sure Xcode is installed in your Applications."
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew and rerun the script."
        exit 1
    fi
    if ! brew list | grep -q cmake; then
        echo "Installing cmake..."
        brew install cmake
    fi
}

setup_msys64() {
    pacman -Syu --noconfirm
    pacman -S --noconfirm base-devel cmake git
}

setup_freebsd() {
    pkg update && pkg upgrade -y
    pkg install -y cmake git gmake
}

build_repos() {
    
    for clone in vvenc vvdec; do
        if [ ! -d $clone ]; then
            git clone --depth=1 https://github.com/fraunhoferhhi/$clone
        else
            git -C $clone pull
        fi
    done

    for REPO in vvenc vvdec; do
        cd $REPO
        mkdir -p build && cd build
        if [ "$OS" = "Darwin" ]; then
            CORES=$(sysctl -n hw.ncpu || echo 1)
            cmake -DCMAKE_BUILD_TYPE=Release ..
            cmake --build . -j $CORES
        else
            CORES=$(nproc || echo 1)
            cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static" ..
            cmake --build . -j $CORES
        fi
        cd -
    done
    echo "Please see the build files starting with (vvenc/vvdec)/bin/release-static."
}

# Main script execution
case "$OS" in
    Linux)
        case "$DISTRO" in
            debian|ubuntu)
                setup_debian
                ;;
            fedora)
                setup_fedora
                ;;
            arch)
                setup_arch
                ;;
            gentoo)
                setup_gentoo
                ;;
            *)
                echo "Unsupported Linux distribution: $DISTRO"
                exit 1
                ;;
        esac
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
    *)
        echo "Unsupported OS: $OS"
        echo "Supports Windows MSYS64, macOS, Linux & FreeBSD"
        echo "May coming soon for some platforms..."
        exit 1
        ;;
esac

build_repos
read -p "Finished building vvenc & vvdec. Press [Enter] to continue..."