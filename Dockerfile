# Base image
FROM python:3.11

# Set working directory
WORKDIR /app

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    git curl && \
    rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Bash 스크립트 복사 및 실행 권한 부여
COPY setup.sh /app/setup.sh
COPY format.sh /app/${PROJECT_NAME}/scripts/format.sh
COPY pytest.sh /app/${PROJECT_NAME}/scripts/pytest.sh

RUN chmod +x /app/setup.sh


# setup.sh 실행
RUN /app/setup.sh $PROJECT_NAME

