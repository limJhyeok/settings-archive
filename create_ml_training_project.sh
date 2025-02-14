#!/bin/bash

# 사용자에게 프로젝트 이름 입력받기 (기본값: project-name)
read -p "Enter project name (default: project-name): " project_name
project_name=${project_name:-project-name}  # 기본값 설정

# 프로젝트 디렉토리 생성
mkdir -p $project_name/{data/{raw,processed},notebooks,src,tests,logs/{tensorboard,checkpoints},scripts}

# 파일 생성
touch $project_name/{README.md,pyproject.toml,config.yaml,.gitignore,.pre-commit-config.yaml}
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
    echo "✅ .gitignore created from template."
else
    echo "🚨 .pre-commit-config.yaml not found. Skipping pre-commit-config creation."
fi

# pytest.sh 생성
if [ -f "../pytest.sh" ]; then
    echo "🔹 Creating pytest.sh file from template..."
    touch ./scripts/pytest.sh
    cp ../pytest.sh ./scripts/pytest.sh
    echo "✅ .scripts/pytest.sh created from template."
else
    echo "🚨 pytest.sh not found. Skipping .scripts/pytest.sh creation."
fi

# format.sh 생성
if [ -f "../format.sh" ]; then
    echo "🔹 Creating format.sh file from template..."
    touch ./scripts/format.sh
    cp ../format.sh ./scripts/format.sh
    echo "✅ ./scripts/format.sh created from template."
else
    echo "🚨 format.sh not found. Skipping ./scripts/format.sh creation."
fi


# 실행 권한 추가 (스크립트 파일)
chmod +x ./scripts/*.sh

echo "🚀 Setting up Python environment in '$project_name'..."

# Poetry 설치 확인 및 설치
if ! command -v poetry &> /dev/null; then
    echo "🔹 Poetry not found. Installing..."
    curl -sSL https://install.python-poetry.org | python3 -
    export PATH="$HOME/.local/bin:$PATH"  # 설치 후 PATH 추가
    ln -s $HOME/.local/bin:$PATH /usr/local/bin
else
    echo "✅ Poetry is already installed."
fi

echo "🔹 Initializing Poetry project..."
poetry init --no-interaction

# pre-commit 설치
echo "🔹 Installing pre-commit..."
poetry add --dev pre-commit

# pytest 개발 의존성으로 설치
echo "🔹 Installing pytest (dev dependency)..."
poetry add --dev pytest

echo "🔹 Installing coverage (dev dependency)..."
poetry add --dev coverage

# pre-commit 설정 적용
echo "🔹 Setting up pre-commit hooks..."
poetry run pre-commit install

echo "✅ Environment setup complete!"
echo "📌 To activate your environment, use: eval $(poetry env activate)"

# 완료 메시지 출력
echo "✅ Project structure for '$project_name' has been created successfully!"
