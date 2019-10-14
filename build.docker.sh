#! /bin/bash

sudo docker build -f amd64/Dockerfile . -t bestwu/deepin -t bestwu/deepin:lion -t bestwu/deepin:15.11
sudo docker build -f i386/Dockerfile . -t bestwu/deepin:i386 -t bestwu/deepin:lion-i386 -t bestwu/deepin:15.11-i386
# sudo docker push bestwu/deepin
