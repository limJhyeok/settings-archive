# settings archive

<p align="left">
    <a href="README_KO.md">한국어</a>&nbsp ｜ &nbspEnglish&nbsp
</p>

The `settings archive` repository is designed to help you quickly set up Python projects.

The repository provides the following scripts:

- `create_ml_training_project.sh`: **Machine Learning training project setup(folder structure, uv, ruff, pre-commit, pytest, coverage)**
- `install_miniconda.sh`: **Miniconda installation**

## **📌 Script Features**
### create_ml_training_project.sh
The `create_ml_training_project.sh` script provides the following features:

- **Automatic Python project structure creation**  
- **Setup of `uv` virtual environment and installation of essential packages**  
- **Git repository initialization and `.gitignore` setup**  
- **Installation of `pre-commit`, `pytest`, and `coverage`**  
- **Integration of test and formatting scripts (`pytest.sh`, `format.sh`)**  

For detailed instructions, refer to the following:

[🛠 create_ml_training_project.sh detail](detail_ml_training.md)

### install_miniconda.sh

The `install_miniconda.sh` script **automates the installation of Miniconda**, 

- **Automatically downloads the Miniconda for Linux**  
- **Supports x86_64 and aarch64 architectures**  
- **Configures environment variables and initializes Conda**  

For detailed instructions, refer to the following:

[🛠 install_miniconda.sh detail](detail_miniconda.md)
