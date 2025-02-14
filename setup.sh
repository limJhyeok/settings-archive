#!/bin/bash

set -e  # 스크립트 실행 중 오류 발생 시 즉시 종료

# 사용자 정의 프로젝트 이름
PROJECT_NAME=${1:-"project-name"}

echo "🚀 Setting up Python environment inside Docker for project: $PROJECT_NAME..."

# 프로젝트 디렉토리 생성
mkdir -p $PROJECT_NAME/{data/{raw,processed},notebooks,src,tests,logs/{tensorboard,checkpoints},scripts}

# 기본 파일 생성
touch $PROJECT_NAME/{README.md,pyproject.toml,config.yaml,.gitignore,.pre-commit-config.yaml}
touch $PROJECT_NAME/data/README.md
touch $PROJECT_NAME/notebooks/{exploratory.ipynb,training.ipynb}
touch $PROJECT_NAME/src/{__init__.py,data_loader.py,model.py,train.py,evaluate.py,utils.py,config.py}
touch $PROJECT_NAME/tests/{__init__.py,conftest.py,test_data_loader.py,test_model.py,test_train.py}
touch $PROJECT_NAME/scripts/{train.sh,evaluate.sh}

# 실행 권한 추가
chmod +x $PROJECT_NAME/scripts/*.sh

echo "🔹 Initializing Git repository..."
git init $PROJECT_NAME

# Poetry 환경 초기화
cd $PROJECT_NAME
poetry init --no-interaction

# 개발 의존성 설치
echo "🔹 Installing development dependencies..."
poetry add --dev pre-commit pytest coverage

# pre-commit 설정 적용
echo "🔹 Setting up pre-commit hooks..."
poetry run pre-commit install

echo "✅ Project setup inside Docker is complete!"
