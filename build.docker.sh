#! /bin/bash

sudo docker build -f amd64/Dockerfile . -t bestwu/deepin -t bestwu/deepin:stable 
sudo docker build -f i386/Dockerfile . -t bestwu/deepin:i386 -t bestwu/deepin:stable-i386 
# sudo docker push bestwu/deepin
