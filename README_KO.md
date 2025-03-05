# settings archive

<p align="left">
    &nbsp한국어&nbsp ｜ <a href="README.md">English</a>&nbsp 
</p>

`settings archive` 레포지토리는 Python 프로젝트를 빠르게 설정할 수 있도록 도와주는 레포지토리입니다.

해당 레포지토리는 다음의 script들을 제공합니다.

- `create_ml_training_project.sh`: **머신 러닝 학습 프로젝트 셋팅(폴더 구조, uv, ruff, pre-commit, pytest, coverage)**
- `install_miniconda.sh`: **Miniconda 설치**


## **📌 스크립트 기능**
### create_ml_training_project.sh
`create_ml_training_project.sh` 스크립트는 다음과 같은 기능을 제공합니다.

-  **Python 프로젝트 구조 자동 생성**  
-  **uv 가상환경 설정 및 필수 패키지 설치**  
-  **Git 저장소 초기화 및 `.gitignore` 설정**  
-  **pre-commit, pytest, coverage 설치**  
-  **테스트 및 포맷팅 스크립트 (`pytest.sh`, `format.sh`) 적용**  

더 자세한 내용은 아래 링크를 클릭해주세요:

[🛠 create_ml_training_project.sh detail](detail_ml_training_ko.md)

### install_miniconda.sh

`install_miniconda.sh` 스크립트는 다음과 같은 기능을 제공합니다.

- **Linux 전용 Miniconda 설치**  
- **x86_64와 aarch64 architectures를 자동으로 구별합니다.**  
- **환경변수를 설정하고 Conda를 초기화합니다**  

더 자세한 내용은 아래 링크를 클릭해주세요:

[🛠 install_miniconda.sh detail](detail_miniconda_ko.md)
