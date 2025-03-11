# detail of install_docker.sh

<p align="left">
    &nbsp;한국어&nbsp; ｜ <a href="detail_docker.md">English</a>&nbsp;
</p>

**install_docker.sh** 스크립트는 **Ubuntu 환경에서 Docker를 빠르게 설치**할 수 있도록 설계된 Bash 스크립트입니다.

## **📌 스크립트 기능**
### install_docker.sh

`install_docker.sh` 스크립트는 **Docker 설치를 자동화**합니다.

- 기존 Docker 관련 패키지 제거
- Docker의 공식 GPG 키 추가 및 저장소 등록
- 사용 가능한 Docker 버전 목록 조회
- 원하는 Docker 버전 선택 및 설치
- Docker 설치 후 정상 동작 여부 확인
- (선택 사항) non-root 사용자도 Docker를 실행할 수 있도록 설정

## **🔧 실행 방법**

### **1. 스크립트 실행**
```sh
bash install_docker.sh
```

### **2. Docker 버전 선택**
```
Enter the Docker version you want to install (or press Enter to install the latest):
```
- 특정 Docker 버전을 설치하려면 해당 버전을 입력하세요.
- 실행시킨 shell에 설치 가능한 docker version들이 예시로 나타나집니다.

    - e.g., 5:28.0.1-1~ubuntu.22.04~jammy

- 입력하지 않으면 최신 버전이 자동으로 설치됩니다.

### **3. 설치 확인**
성공적으로 Docker가 설치되었을 경우 script 내에서
```
sudo docker run hello-world
```
명령어를 자동으로 실행하므로 설치가 정상적으로 이루어졌는지 확인할 수 있습니다.

### **4. root 사용자 권한 설정 해제 (선택 사항)**
```
Do you want to allow non-root users to run Docker commands? (y/n):
```
- `y`를 입력하면 현재 사용자를 `docker` 그룹에 추가하여, `sudo` 없이 Docker 명령어를 실행할 수 있도록 설정합니다.

## **🔧 Docker 제거 방법**

Docker를 제거하려면 다음 명령어를 실행하세요:
```sh
# Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# Delete all images, containers, and volumes:
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

# Remove source list and keyrings
sudo rm /etc/apt/sources.list.d/docker.list
sudo rm /etc/apt/keyrings/docker.asc
```
그 후 시스템을 재부팅하는 것이 좋습니다.

## **📌 참고 사항**

- [Docker 공식 문서(Install Docker Engine on Ubuntu)](https://docs.docker.com/engine/install/ubuntu/)를 참고했습니다.
- 스크립트 실행 전 인터넷 연결을 확인하세요.
- 기존에 설치된 Docker가 있다면 제거 후 다시 설치됩니다.
- 설치 과정에서 패키지 목록을 업데이트하므로 시간이 소요될 수 있습니다.
