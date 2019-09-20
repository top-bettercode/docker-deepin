#! /bin/bash

cd amd64
sudo docker build . -t bestwu/deepin -t bestwu/deepin:stable -t bestwu/deepin:15.11
cd ..
cd i386
sudo docker build . -t bestwu/deepin:i386 -t bestwu/deepin:stable-i386 -t bestwu/deepin:15.11-i386
cd ..
# sudo docker push bestwu/deepin
