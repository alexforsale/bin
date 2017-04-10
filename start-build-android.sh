#!/bin/bash -l
# Christian Alexander <alexforsale@yahoo.com>
# a simple script for automating environment setup for aosp and such.
# start this script in the repository root directory.
# this script should be sourced, eg.
# source ~/bin/start-build-android.sh
# 

# check the distro id first
if command -v lsb_release >/dev/null 2>&1; then
    distro=`lsb_release -si`
else # in case the distro I'm using don't provide lsb_release
    distro=`awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//'`
fi

function check-distro {
case "$distro" in
    Arch) # this is the distro I'm using right now
        echo "compiling in $distro"
        arch-venv
        ;;
    *)
        echo "linux distribution cannot be defined."
        echo "this script will stop here."
        exit 1
esac
}

function arch-venv() {
    # https://wiki.archlinux.org/index.php/android#Building_Android
    # The Android build process expects python to be python2.
    if command -v virtualenv2 >/dev/null 2>&1; then
        echo "setting up virtualenv2"
        check-venv
    else
        echo "virtualenv2 is not installed. Aborting..."
        exit 1
    fi
    
}

function check-venv {
    if [ ! -d "venv" ]; then
        echo "Creating a python2 virtual environment..."
        virtualenv2 venv
    else
        echo "python2 virtual environment existed."
    fi
}

function check-repo {
    if [ ! -d ".repo" ]; then
        echo "this directory does not contains android repository."
        exit 1
    fi
}

# the repository directory should be the directory this script is called.
repodir=`pwd`
check-distro
check-repo
source venv/bin/activate
source build/envsetup.sh
