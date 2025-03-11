#!/bin/bash

# ----------------------------------------------------------
# Reference: https://docs.docker.com/engine/install/ubuntu/ |
# ----------------------------------------------------------

# Remove previous docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; 
    do sudo apt-get remove $pkg; 
done

# 1. Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 2. Add Docker repository
echo "Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# 3. print Docker version list
echo "Checking available Docker versions..."
AVAILABLE_VERSIONS=$(apt-cache madison docker-ce | awk '{ print $3 }')

# 4. Select Docker version.
echo "Available Docker versions:"
echo "$AVAILABLE_VERSIONS"
echo ""
read -p "Enter the Docker version you want to install (or press Enter to install the latest): " VERSION_CHOICE

# 5. if user selects version then install that version or not latest.
if [ -z "$VERSION_CHOICE" ]; then
    VERSION_CHOICE="latest"
fi

# 6. Install Docker package
if [ "$VERSION_CHOICE" == "latest" ]; then
    echo "Installing the latest Docker version..."
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "Installing Docker version $VERSION_CHOICE..."
    sudo apt-get install -y docker-ce=$VERSION_CHOICE docker-ce-cli=$VERSION_CHOICE containerd.io docker-buildx-plugin docker-compose-plugin
fi

# 7. Verifying Docker is installed properly
echo "Verifying Docker installation..."
sudo docker run hello-world

# 8. If user wants to execute Docker without root user athentication, describes how to do it.
echo ""
read -p "Do you want to allow non-root users to run Docker commands? (y/n): " ALLOW_NON_ROOT
if [ "$ALLOW_NON_ROOT" == "y" ]; then
    echo "Adding your user to the Docker group..."
    sudo usermod -aG docker $USER
    echo "You must log out and log back in for the changes to take effect."
else
    echo "Docker will require sudo for all commands."
fi

echo "Docker installation complete!"
