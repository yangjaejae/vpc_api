FROM node:10.15.2

# 앱 디렉터리 생성
RUN mkdir -p /usr/src/app

RUN echo "Asia/Seoul" > /etc/timezone

WORKDIR /usr/src/app
CMD chmod 777 ./*

# 앱 의존성 설치
COPY package*.json ./
RUN npm install