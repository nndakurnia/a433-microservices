#!/bin/bash
WAKTU=$(date '+%Y-%m-%d.%H')

echo '[*] Building Docker Image'
echo "[*] Tag $WAKTU"
# build Docker image dari Dockerfile (name:item-app, tag:v1)
docker build -t item-app:v1 .

echo "[*] List Docker Images"
# melihat list docker image di lokal
docker images

echo "[*] Mengubah nama image sesuai format GitHub Packages"
# mengubah nama image sesuai format GitHub Packages
docker image tag item-app:v1  ghcr.io/nndakurnia/item-app:v1

echo "[*] Login ke GitHub Packages"
# export PAT github di terminal dalam variabel CR_PAT
# login ke github packages, pake stdin untuk menghindari pw ada di shell history atau log-files
echo $CR_PAT | docker login ghcr.io -u nndakurnia --password-stdin

echo "[*] Push image to GitHub Packages"
# mengunggah image ke github packages
docker push ghcr.io/nndakurnia/item-app:v1
