#!/bin/bash

# Miniconda version 
read -p "Enter Miniconda3 version. You can check in https://repo.anaconda.com/miniconda (default: latest): " CONDA_VERSION
CONDA_VERSION=${CONDA_VERSION:-latest}


# System architecture (x86_64, aarch64)
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH_SUFFIX="Linux-x86_64.sh"
elif [[ "$ARCH" == "aarch64" ]]; then
    ARCH_SUFFIX="Linux-aarch64.sh"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# latest version
MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-${ARCH_SUFFIX}"

INSTALL_DIR="$HOME/miniconda3"

# Update and install necessary packages
echo "Updating package list and installing dependencies..."
sudo apt update && sudo apt install -y wget bzip2

# Download Miniconda script
echo "Downloading Miniconda installer from $MINICONDA_URL..."
wget --quiet --show-progress "$MINICONDA_URL" -O miniconda.sh || { echo "Download failed!"; exit 1; }
chmod +x miniconda.sh

echo "Installing Miniconda to $INSTALL_DIR..."
./miniconda.sh -b -p "$INSTALL_DIR"
rm miniconda.sh

echo "Configuring environment variables..."
touch ~/.bashrc
if ! grep -q 'export PATH="$HOME/miniconda3/bin:$PATH"' ~/.bashrc; then
    echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
fi

export PATH="$INSTALL_DIR/bin:$PATH"

echo "Initializing Conda..."
conda init bash

echo "Finish installing Miniconda"
conda --version
