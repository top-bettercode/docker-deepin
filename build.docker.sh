#! /bin/bash

cd amd64
sudo docker build -t bestwu/deepin .
sudo docker tag bestwu/deepin bestwu/deepin:panda
sudo docker tag bestwu/deepin bestwu/deepin:15.7
cd ..
cd i386
sudo docker build -t bestwu/deepin:i386 .
sudo docker tag bestwu/deepin:i386 bestwu/deepin:panda-i386
sudo docker tag bestwu/deepin:i386 bestwu/deepin:15.7-i386
cd ..
sudo docker push bestwu/deepin