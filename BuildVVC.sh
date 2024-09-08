#!/bin/bash
OS=$(uname)
echo "Martin Eesmaa / VVC Compiler (vvenc and vvdec)"
echo "You're running on $OS of bash script version to compile VVC binaries"
echo "Checking and installing required packages..."

setup_linux() {
    sudo apt update && sudo apt upgrade -y
    sudo apt install build-essential cmake -y
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
    if [ ! -d vvenc ]; then
        git clone --depth=1 https://github.com/fraunhoferhhi/vvenc
    else
        git pull -C vvenc
    fi

    if [ ! -d vvdec ]; then
        git clone --depth=1 https://github.com/fraunhoferhhi/vvdec
    else
        git pull -C vvdec
    fi

    for REPO in vvenc vvdec; do
        cd $REPO
        mkdir build && cd build
        if [ "$OS" = "Darwin" ]; then
            cmake -DCMAKE_BUILD_TYPE=Release ..
            cmake --build . -j $(sysctl -n hw.ncpu)
        else
            cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static" ..
            cmake --build . -j $(nproc)
    fi
    cd -
done
    echo "Please see the build files starting with (vvenc/vvdec)/bin/release-static."
}

# Main script execution
case "$OS" in
    Linux)
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
    *)
        echo "Unsupported OS: $OS"
        echo "Supports Windows MSYS64, macOS, Linux & FreeBSD"
        echo "May coming soon for some platforms..."
        exit 1
        ;;
esac

build_repos
read -p "Finished building vvenc & vvdec. Press [Enter] to continue..."
