# detail of install_docker.sh

<p align="left">
     <a href="detail_docker_ko.md">한국어</a>&nbsp; ｜ &nbsp;English&nbsp;
</p>

The **install_docker.sh** script is designed to **quickly install Docker in an Ubuntu environment** using a Bash script.

## **📌 Script Features**
### install_docker.sh

The `install_docker.sh` script **automates Docker installation** by:

- Removing existing Docker-related packages
- Adding Docker's official GPG key and repository
- Retrieving available Docker version lists
- Selecting and installing the desired Docker version
- Verifying Docker installation
- (Optional) Allowing non-root users to execute Docker commands

## **🔧 Execution Instructions**

### **1. Run the Script**
```sh
bash install_docker.sh
```

### **2. Select Docker Version**
```
Enter the Docker version you want to install (or press Enter to install the latest):
```
- To install a specific Docker version, enter the desired version.
- The script will display the available Docker versions as examples.

    - e.g., 5:28.0.1-1~ubuntu.22.04~jammy

- If no input is given, the latest version will be installed automatically.

### **3. Verify Installation**
If Docker is successfully installed, the script automatically runs:
```
sudo docker run hello-world
```
This ensures that Docker is installed correctly.

### **4. Disable Root Privilege Requirement (Optional)**
```
Do you want to allow non-root users to run Docker commands? (y/n):
```
- Entering `y` adds the current user to the `docker` group, allowing execution of Docker commands without `sudo`.

## **🔧 Uninstall Docker**

To remove Docker, execute the following commands:
```sh
sudo apt-get remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```
It is recommended to restart the system afterward.

## **📌 Notes**

- This script is based on the [Docker Official Documentation (Install Docker Engine on Ubuntu)](https://docs.docker.com/engine/install/ubuntu/).
- Ensure a stable internet connection before executing the script.
- If Docker is already installed, this script will remove and reinstall it.
- Since the package list is updated during installation, the process may take some time.

