# detail of install_docker_compose.sh

<p align="left">
    &nbsp;English&nbsp; ｜ <a href="detail_docker_compose_ko.md">한국어</a>&nbsp;
</p>

The **install_docker_compose.sh** script is designed to **easily install Docker Compose on Ubuntu**.

## **📌 Script Features**
### install_docker_compose.sh

The `install_docker_compose.sh` script **automates the installation of Docker Compose**.

- Downloads and installs the latest or a specific version of Docker Compose
- Grants execution permissions after installation
- Verifies the installed Docker Compose version
- Updates existing Docker Compose version if applicable

## **🔧 How to Run**

### **1. Run the script**
```sh
sudo bash install_docker_compose.sh
```

### **2. Choose Docker Compose Version**
```
Enter Docker Compose version you want (or press Enter to install the latest: v2.34.0):
```
- To install a specific version, enter the desired version.
- If no version is entered, the latest version will be installed automatically.

### **3. Verify Installation**
Once the installation is complete, check the version with:
```sh
docker-compose --version
```

## **📌 Installation Process**
1. Checks for the latest Docker Compose version (using GitHub API)
2. Determines the installation version based on user input (default: latest version)
3. Downloads the Docker Compose binary using `curl`
4. Grants execution permissions and saves it to `/usr/local/bin/docker-compose`
5. Confirms installation by checking the version

## **🛠 How to Uninstall Docker Compose**
To remove Docker Compose, run the following command:
```sh
sudo rm -f /usr/local/bin/docker-compose
```
It is recommended to reboot the system afterward.

## **📌 Notes**
- Ensure an active internet connection before running the script.
- Administrator privileges may be required during the installation process.

