#!/bin/bash
WAKTU=$(date '+%Y-%m-%d.%H')

echo '[*] Building Docker Image'
echo "[*] Tag $WAKTU"
# build Docker image dari Dockerfile (name: <username-docker>/karsajobs-ui:latest)
docker build -t ghcr.io/nndakurnia/karsajobs-ui:latest .

echo "[*] List Docker Images"
# melihat list docker image di lokal
docker images

echo "[*] Login ke GitHub Package"
# export PAT github di terminal dalam variabel CR_PAT
# login ke github package, pake stdin untuk menghindari pw ada di shell history atau log-files
echo $CR_PAT | docker login ghcr.io -u nndakurnia --password-stdin

echo "[*] Push image to GitHub Package"
# mengunggah image ke github package
docker push ghcr.io/nndakurnia/karsajobs-ui:latest
