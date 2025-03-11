# detail of install_miniconda.sh

<p align="left">
    &nbsp한국어&nbsp ｜ <a href="detail_miniconda.md">English</a>&nbsp 
</p>

**install_miniconda.sh** 스크립트는 **Linux/Mac** 환경에서 **Miniconda3를 빠르게 다운로드**할 수 있도록 설계된 Bash 스크립트입니다.

## **📌 스크립트 기능**
### install_miniconda.sh

`install_miniconda.sh` 스크립트는 **Miniconda 설치를 자동화**합니다.

- **Linux 용 Miniconda를 자동으로 다운로드**
- **x86_64 및 aarch64 아키텍처 지원**
- **환경 변수를 설정하고 Conda를 초기화**

## **🔧 실행 방법**

### **1. 스크립트 실행**
```sh
bash install_miniconda.sh
```

### **2. Miniconda3 버전 설정**
```
Enter Miniconda3 version. You can check in https://repo.anaconda.com/miniconda (default: latest):
```
- Miniconda3 버전을 입력하지 않으면 기본값(`latest`)이 사용됩니다.
- 설치 가능한 Miniconda3 버전은 https://repo.anaconda.com/miniconda 에서 확인할 수 있습니다.

e.g., 만약 `Miniconda3-py39_25.1.1-2-Linux-x86_64.sh` 버전을 설치하고싶으시면

`py39_25.1.1-2` 를 입력해주세요.

### **3. 터미널 재시작**
Miniconda 적용을 위해 터미널을 재시작해야 합니다.

또는 아래 명령어를 실행할 수 있습니다:
```bash
source ~/.bashrc
```

### **4. 설치 확인**
```bash
conda --version
```

## **🔧 Miniconda 제거 방법**

Miniconda를 제거하려면 다음 명령어를 실행하세요:

```bash
rm -rf ~/miniconda3
sed -i '/export PATH="$HOME\/miniconda3\/bin:\$PATH"/d' ~/.bashrc
```

그 후 터미널을 다시 시작하세요.

## **📌 참고 사항**

- Miniconda가 이미 설치된 경우, 이 스크립트를 실행하면 기존 설치가 덮어씌워질 수 있습니다.
- 스크립트 실행 중 안정적인 인터넷 연결이 필요합니다.

