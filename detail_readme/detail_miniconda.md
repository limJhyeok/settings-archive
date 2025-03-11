# detail of install_miniconda.sh

<p align="left">
    <a href="detail_miniconda_ko.md">한국어</a>&nbsp ｜ &nbspEnglish&nbsp
</p>

The **install_miniconda.sh** script is a Bash script for **Linux/Mac** environments, designed to **download Miniconda3 quickly**.

## **📌 Script Features**
### install_miniconda.sh

The `install_miniconda.sh` script **automates the installation of Miniconda**, 

- **Automatically downloads the Miniconda for Linux**  
- **Supports x86_64 and aarch64 architectures**  
- **Configures environment variables and initializes Conda**  


## **🔧 Execution Steps**

### **1. Run the Script**
```sh
bash install_miniconda.sh
```
### **2. Set the Miniconda3 version**
```
Enter Miniconda3 version. You can check in https://repo.anaconda.com/miniconda (default: latest):
```

- If no Miniconda3 version is provided, the default (`latest`) is used.
- You can check the available Miniconda3 version in https://repo.anaconda.com/miniconda.

e.g., If you want to install `Miniconda3-py39_25.1.1-2-Linux-x86_64.sh`

Enter `py39_25.1.1-2`

### **3. Restart terminal**
You have to restart terminal for applying Miniconda

or you can run:
```bash
source ~/.bashrc
```

### **4.Verify the installation**
```bash
conda --version
```

## 🔧 Uninstallation

To remove Miniconda from your system, run:

```bash
rm -rf ~/miniconda3
sed -i '/export PATH="$HOME\/miniconda3\/bin:\$PATH"/d' ~/.bashrc
```

Then, restart your terminal.

## 📌 Notes

- If Miniconda is already installed, running this script will overwrite the existing installation.

- Ensure you have a stable internet connection while running the script.



