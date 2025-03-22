# detail of install_docker_compose.sh

<p align="left">
    <a href="detail_docker_compose.md">English</a>&nbsp ｜ &nbsp;한국어&nbsp;
</p>

**install_docker_compose.sh** 스크립트는 **Ubuntu 환경에서 Docker Compose를 간편하게 설치**할 수 있도록 설계된 Bash 스크립트입니다.

## **📌 스크립트 기능**
### install_docker_compose.sh

`install_docker_compose.sh` 스크립트는 **Docker Compose 설치를 자동화**합니다.

- 최신 버전 또는 특정 버전의 Docker Compose 다운로드 및 설치
- 설치 후 실행 권한 부여
- 설치된 Docker Compose 버전 확인
- 기존 Docker Compose 버전이 있을 경우 업데이트

## **🔧 실행 방법**

### **1. 스크립트 실행**
```sh
sudo bash install_docker_compose.sh
```

### **2. Docker Compose 버전 선택**
```
Enter Docker Compose version you want (or press Enter to install the latest: v2.34.0):
```
- 특정 Docker Compose 버전을 설치하려면 해당 버전을 입력하세요.
- 입력하지 않으면 최신 버전이 자동으로 설치됩니다.

### **3. 설치 확인**
설치가 완료되면 다음과 같이 버전을 확인할 수 있습니다:
```sh
docker-compose --version
```

## **📌 설치 스크립트 주요 동작 과정**
1. 최신 Docker Compose 버전 확인 (GitHub API 사용)
2. 사용자 입력을 통해 설치할 버전 결정 (기본값: 최신 버전)
3. `curl`을 사용하여 Docker Compose 바이너리 다운로드
4. 실행 권한 부여 및 `/usr/local/bin/docker-compose`에 저장
5. 설치 완료 후 버전 확인

## **🛠 Docker Compose 제거 방법**
Docker Compose를 제거하려면 다음 명령어를 실행하세요:
```sh
sudo rm -f /usr/local/bin/docker-compose
```
그 후 시스템을 재부팅하는 것이 좋습니다.

## **📌 참고 사항**
- 스크립트 실행 전 인터넷 연결을 확인하세요.
- 설치 과정에서 관리자 권한이 필요할 수 있습니다.

