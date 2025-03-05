# detail of create_ml_training.sh

<p align="left">
    <a href="detail_ml_training_ko.md">한국어</a>&nbsp ｜ &nbspEnglish&nbsp
</p>


The **create_ml_training_project.sh** script is a Bash script for **Linux/Mac** environments, designed to **quickly set up a machine learning training project using Python**.
It installs essential packages such as Poetry, pre-commit, pytest, coverage, and ruff,
and **automates Git initialization, directory and file creation, and script copying**.

## **📌 Script Features**
The `create_ml_training_project.sh` script provides the following features:

- **Automatic Python project structure creation**  
- **Setup of `uv` virtual environment and installation of essential packages**  
- **Git repository initialization and `.gitignore` setup**  
- **Installation of `pre-commit`, `pytest`, and `coverage`**  
- **Integration of test and formatting scripts (`pytest.sh`, `format.sh`)** 


## **📂 Generated Project Structure**
When the script is executed, the following project structure is created:

```
project_name/
├── README.md
├── pyproject.toml          # Poetry project configuration file
├── config.yaml             # Training settings (hyperparameters, data paths, etc.)
├── data/                   # Data storage folder
│   ├── raw/                # Raw data
│   ├── processed/          # Processed data
│   ├── README.md
├── notebooks/              # Experimental Jupyter Notebooks
│   ├── exploratory.ipynb   # Data exploration
│   ├── training.ipynb      # Model training experiments
├── src/                    # Core code
│   ├── __init__.py
│   ├── data_loader.py      # Data loading and preprocessing
│   ├── model.py            # Model definition
│   ├── train.py            # Training loop
│   ├── evaluate.py         # Evaluation code
│   ├── utils.py            # Utility functions
│   ├── config.py           # Configuration file loader
├── tests/                  # Test code
│   ├── __init__.py
│   ├── conftest.py         # Test configuration file
│   ├── test_data_loader.py # Data loader test
│   ├── test_model.py       # Model test
│   ├── test_train.py       # Training code test
├── logs/                   # Training logs and results
│   ├── tensorboard/        # TensorBoard logs
│   ├── checkpoints/        # Model checkpoint storage
├── scripts/                # Execution scripts
│   ├── train.sh            # Training execution script
│   ├── evaluate.sh         # Evaluation execution script
│   ├── pytest.sh           # `pytest` (coverage) execution script
│   ├── format.sh           # Code formatting (`ruff`) execution script
├── .gitignore              # Git ignored files
├── .pre-commit-config.yaml # `pre-commit` configuration file
└── .git/                   # Git initialized
```

## **🔧 Execution Steps**

### **1. Run the Script**
```sh
bash create_ml_training_project.sh
```
### **2. Set the Project Name (Root Folder)**
**Example Input**
```
Enter project name (default: project-name): my_project
```

- If no project name is provided, the default (`project-name`) is used.
- The provided name will be used to create the project folder.

**Example Output**

```
...(truncated)...
✅ ./scripts/format.sh created from template.
🚀 Setting up Python environment in 'my_project'...
✅ uv is already installed.
Enter Python version (default: 3.10):
```
- The `uv` package manager is used to automatically create the virtual environment.
- Enter the desired Python version (e.g., 3.10). If no input is provided, the default (3.10) is used.

### **3. Activate the Virtual Environment**
```
export PATH=.venv/bin:$PATH
source .venv/bin/activate
```

### **4. Activate the Python Interpreter**
```
uv run python
```

### **5. Run pre-commit**
Execute the configured `pre-commit` hooks to automatically check code style and quality.

```sh
uv run pre-commit run --all-files
```

## **📌 Installed Packages**
| Package | Description |
|---------|--------------------------------------------|
| `uv` | Package manager and virtual environment setup |
| `pytest` | Python testing framework |
| `coverage` | Code coverage measurement tool |
| `pre-commit` | Automatic code formatting and quality checks before commits |
| `ruff` | Python formatting tool |

## 💡 Additional Features
### **✅ Automatic Git Initialization**
- If `.gitignore` and `.pre-commit-config.yaml` exist, they are automatically copied.
- Initializes a Git repository and sets up `pre-commit` automatically.

### **✅ Auto-Copy pytest and Formatting Scripts**
- If `pytest.sh` and `format.sh` exist, they are automatically copied and given execution permissions.

## 📌 Notes

- If `pytest.sh`, `format.sh`, or `.pre-commit-config.yaml` are missing, those features will be skipped.
- If `uv` is not installed, it will be automatically installed.

