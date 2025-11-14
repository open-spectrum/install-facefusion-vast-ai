#!/bin/bash
apt update -y
apt upgrade -y
apt install git-all -y
apt install curl -y
apt install ffmpeg -y

sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main" | sudo tee /etc/apt/sources.list.d/cloudflared.list

sudo apt-get update && sudo apt-get install cloudflared

conda init --all
conda create --name facefusion python=3.12 pip=25.0
conda activate facefusion
conda install -y nvidia/label/cuda-12.9.1::cuda-runtime nvidia/label/cudnn-9.10.0::cudnn 
git clone https://github.com/open-spectrum/facefusion_erfix.git

