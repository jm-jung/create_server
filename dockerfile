# Dockerfile
FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# 프로젝트 파일 복사
COPY pyproject.toml poetry.lock* /app/

# Poetry 설치 및 설정
RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false

# 프로젝트 의존성 설치
RUN poetry install --only main

# 애플리케이션 파일 복사
COPY . /app

# 포트 8000 노출
EXPOSE 8000

# 컨테이너 실행 명령어 설정
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
