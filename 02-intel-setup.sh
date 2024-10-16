#!/bin/bash

# https://docs.openvino.ai/2024/get-started/install-openvino/install-openvino-apt.html

# Install the GPG key for the repository
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB

# Add this key to the system keyring:
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB

# Add the repository via the following command:
echo "deb https://apt.repos.intel.com/openvino/2024 ubuntu24 main" | sudo tee /etc/apt/sources.list.d/intel-openvino-2024.list

sudo apt update

sudo apt install -y \
  linux-headers-$(uname -r) \
  linux-modules-extra-$(uname -r) \
  flex bison \
  ocl-icd-libopencl1 intel-fw-gpu intel-i915-dkms xpu-smi \
  intel-opencl-icd intel-level-zero-gpu level-zero \
  intel-media-va-driver-non-free libmfx1 libmfxgen1 libvpl2 \
  libegl-mesa0 libegl1-mesa libegl1-mesa-dev libgbm1 libgl1-mesa-dev libgl1-mesa-dri \
  libglapi-mesa libgles2-mesa-dev libglx-mesa0 libigdgmm12 libxatracker2 mesa-va-drivers \
  mesa-vdpau-drivers mesa-vulkan-drivers va-driver-all vainfo hwinfo clinfo driverctl \
  intel-gpu-tools

 sudo usermod -a -G video,render,docker ${USER} 

# # Install Intel OpenVino GPU support https://docs.openvino.ai/2024/get-started/configurations/configurations-intel-gpu.html

# # https://dgpu-docs.intel.com/driver/release-streams.html#ubuntu-server-22-04

# # Intel repo pub key 
# wget -qO - https://repositories.intel.com/gpu/intel-graphics.key | sudo gpg --yes --dearmor --output /etc/apt/keyrings/intel.gpg
# sudo chmod a+r /etc/apt/keyrings/intel.gpg

# echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/intel.gpg] https://repositories.intel.com/gpu/ubuntu jammy/lts/2350 unified" | \
# sudo tee /etc/apt/sources.list.d/intel-gpu-jammy.list  

# sudo apt update

# sudo apt install -y \
#   linux-headers-$(uname -r) \
#   linux-modules-extra-$(uname -r) \
#   flex bison \
#   intel-fw-gpu intel-i915-dkms xpu-smi \
#   intel-opencl-icd intel-level-zero-gpu level-zero \
#   intel-media-va-driver-non-free libmfx1 libmfxgen1 libvpl2 \
#   libegl-mesa0 libegl1-mesa libegl1-mesa-dev libgbm1 libgl1-mesa-dev libgl1-mesa-dri \
#   libglapi-mesa libgles2-mesa-dev libglx-mesa0 libigdgmm12 libxatracker2 mesa-va-drivers \
#   mesa-vdpau-drivers mesa-vulkan-drivers va-driver-all vainfo hwinfo clinfo driverctl \
#   intel-gpu-tools

# sudo usermod -a -G video,render,docker ${USER}
