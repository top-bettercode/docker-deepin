#! /bin/bash
# sudo mount -i -o remount,exec,dev /data
sudo rm -rf build
sudo cp ./panda /usr/share/debootstrap/scripts/
sudo mkdir -p /usr/share/keyrings/
sudo cp ./deepin-archive-keyring.gpg /usr/share/keyrings/
mkdir build
cd build
sudo debootstrap --no-check-gpg --arch=amd64 panda rootfs http://packages.deepin.com/deepin/
cd rootfs
sudo rm -rvf var/lib/apt/lists/* var/cache/apt/* var/log/*
sudo tar -Jcvf ../../amd64/rootfs.tar.xz *