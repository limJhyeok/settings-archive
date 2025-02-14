# settings archive
`create_ml_training_project.sh` 스크립트는 **ubuntu 22.04에서** **Python을 이용한 ml training 프로젝트를 빠르게 설정**하기 위한 자동화된 Bash 스크립트입니다.  
`Poetry`, `pre-commit`, `pytest` 및 `coverage` 등의 필수 패키지를 설치하고,  
**Git 초기화, 디렉토리 및 파일 생성, 실행 스크립트 복사** 등의 작업을 자동으로 수행합니다.

## **📌 스크립트 기능**
`create_ml_training_project.sh` 스크립트는 다음과 같은 기능을 제공합니다.

-  **Python 프로젝트 구조 자동 생성**  
-  **Poetry 환경 설정 및 필수 패키지 설치**  
-  **Git 저장소 초기화 및 `.gitignore` 설정**  
-  **pre-commit, pytest, coverage 설치**  
-  **테스트 및 포맷팅 스크립트 (`pytest.sh`, `format.sh`) 적용**  


## **📂 생성되는 프로젝트 구조**
스크립트를 실행하면 다음과 같은 프로젝트 구조가 생성됩니다.

```
project_name/
├── README.md
├── pyproject.toml          # Poetry 프로젝트 설정 파일
├── config.yaml             # 학습 설정 (하이퍼파라미터, 데이터 경로 등)
├── data/                   # 데이터 저장 폴더
│   ├── raw/                # 원본 데이터
│   ├── processed/          # 전처리된 데이터
│   ├── README.md
├── notebooks/              # 실험용 Jupyter Notebook
│   ├── exploratory.ipynb   # 데이터 탐색
│   ├── training.ipynb      # 모델 학습 실험
├── src/                    # 핵심 코드
│   ├── __init__.py
│   ├── data_loader.py      # 데이터 로드 및 전처리
│   ├── model.py            # 모델 정의
│   ├── train.py            # 학습 루프
│   ├── evaluate.py         # 평가 코드
│   ├── utils.py            # 유틸리티 함수
│   ├── config.py           # 설정 파일 로드
├── tests/                  # 테스트 코드
│   ├── __init__.py
│   ├── conftest.py         # 테스트 설정 파일
│   ├── test_data_loader.py # 데이터 로드 테스트
│   ├── test_model.py       # 모델 테스트
│   ├── test_train.py       # 학습 코드 테스트
├── logs/                   # 학습 로그 및 결과 저장
│   ├── tensorboard/        # TensorBoard 로그
│   ├── checkpoints/        # 모델 체크포인트 저장
├── scripts/                # 실행 스크립트
│   ├── train.sh            # 학습 실행 스크립트
│   ├── evaluate.sh         # 평가 실행 스크립트
│   ├── pytest.sh           # pytest(coverage) 실행 스크립트 
│   ├── format.sh           # 코드 포맷팅(ruff) 실행 스크립트 
├── .gitignore              # Git 무시할 파일 목록 
├── .pre-commit-config.yaml # pre-commit 설정 파일 
└── .git/                   # Git 초기화됨
```

## **🔧 실행 방법**

### **1. 실행 권한 부여**
```sh
chmod +x setup_project.sh
```
### **2. 스크립트 실행**
```sh
./setup_project.sh
```
### **3. 프로젝트 이름(root 폴더) 설정**
**입력 예시**
```
Enter project name (default: project-name): my_project
```

- 프로젝트 이름을 입력하지 않으면 기본값(`project-name`)이 사용됩니다.
- 입력하면 해당 이름으로 프로젝트가 생성됩니다.


### **4️. Poetry 환경 활성화**
Poetry가 설치되었으므로, 가상환경을 활성화하세요.

```sh
cd my_project
eval $(poetry env activate)  # 가상환경 활성화
```

### **5️. pre-commit 실행**
설정된 pre-commit 훅을 실행하여 코드 스타일 및 품질을 자동으로 검사합니다.

```sh
pre-commit run --all-files
```

## **📌 설치되는 패키지**
| 패키지 | 설명 |
|--------|--------------------------------------------------|
| `Poetry` | 패키지 관리 및 가상환경 설정 |
| `pytest` | Python 테스트 프레임워크 |
| `coverage` | 코드 커버리지 측정 도구 |
| `pre-commit` | Git 커밋 전 자동 코드 포맷 및 품질 검사 |


## 💡 추가 기능
### **✅ Git 자동 초기화**
- `.gitignore`, `.pre-commit-config.yaml`이 있으면 자동 복사
- Git을 자동 초기화하고, pre-commit 자동 설정

### **✅ pytest, format 실행 스크립트 자동 복사**
- `pytest.sh`, `format.sh`이 있으면 자동 복사 후 실행 권한 부여

