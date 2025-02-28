#!/bin/bash

# 사용자에게 프로젝트 이름 입력받기 (기본값: project-name)
read -p "Enter project name (default: project-name): " project_name
project_name=${project_name:-project-name}  # 기본값 설정

# 프로젝트 디렉토리 생성
mkdir -p $project_name/{data/{raw,processed},notebooks,src,tests,logs/{tensorboard,checkpoints},scripts}

# 파일 생성
touch $project_name/{README.md,config.yaml,.gitignore,.pre-commit-config.yaml}
touch $project_name/data/README.md
touch $project_name/notebooks/{exploratory.ipynb,training.ipynb}
touch $project_name/src/{__init__.py,data_loader.py,model.py,train.py,evaluate.py,utils.py,config.py}
touch $project_name/tests/{__init__.py,conftest.py,test_data_loader.py,test_model.py,test_train.py}
touch $project_name/scripts/{train.sh,evaluate.sh}

cd $project_name

if [ ! -d ".git" ]; then
    echo "🔹 Initializing Git repository..."
    git init
    echo "✅ Git repository initialized."
else
    echo "✅ Git is already initialized."
fi

# .gitignore 파일 생성
if [ -f "../py_gitignore" ]; then
    echo "🔹 Creating .gitignore file from template..."
    cp ../py_gitignore .gitignore
    echo "✅ .gitignore created from template."
else
    echo "🚨 .gitignore template not found. Skipping .gitignore creation."
fi

# pre-commit 설정 파일 생성
if [ -f "../.pre-commit-config.yaml" ]; then
    echo "🔹 Creating .pre-commit-config file from template..."
    cp ../.pre-commit-config.yaml .pre-commit-config.yaml
    echo "✅ .pre-commit-config created from template."
else
    echo "🚨 .pre-commit-config.yaml not found. Skipping pre-commit-config creation."
fi

# pytest.sh 생성
if [ -f "../pytest.sh" ]; then
    echo "🔹 Creating pytest.sh file from template..."
    cp ../pytest.sh ./scripts/pytest.sh
    echo "✅ ./scripts/pytest.sh created from template."
else
    echo "🚨 pytest.sh not found. Skipping ./scripts/pytest.sh creation."
fi

# format.sh 생성
if [ -f "../format.sh" ]; then
    echo "🔹 Creating format.sh file from template..."
    cp ../format.sh ./scripts/format.sh
    echo "✅ ./scripts/format.sh created from template."
else
    echo "🚨 format.sh not found. Skipping ./scripts/format.sh creation."
fi

# 실행 권한 추가 (스크립트 파일)
if [ -d "./scripts" ]; then
    chmod +x ./scripts/*.sh
fi

echo "🚀 Setting up Python environment in '$project_name'..."

# uv 설치 확인 및 업데이트
if ! command -v uv &> /dev/null; then
    echo "🔹 Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    uv self update
else
    echo "✅ uv is already installed."
fi

read -p "Enter Python version (default: 3.10): " python_version
python_version=${python_version:-3.10}

# create virtual env of $python_version
uv venv .venv --python $python_version

echo "🔹 Initialize uv"
uv init --name $project_name

# 필수 패키지 설치
echo "🔹 Installing development dependencies..."
uv add --dev pre-commit pytest coverage ruff

# pre-commit 설정 적용
echo "🔹 Setting up pre-commit hooks..."
uv run pre-commit install

# 완료 메시지 출력
echo "✅ Project structure for '$project_name' has been created successfully!"

echo "To execute virtual env, command: uv run python"
