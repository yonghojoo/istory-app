#!/bin/bash
cd /home/ec2-user/app

# 필요한 디렉토리 생성
mkdir -p /home/ec2-user/app/logs

# 환경 변수 설정
export SERVER_PORT=8080
export JAVA_OPTS="-Xms512m -Xmx1024m"

# 이전 프로세스 종료 (혹시 모를 중복 실행 방지)
if [ -f /home/ec2-user/app/pid.file ]; then
    pid=$(cat /home/ec2-user/app/pid.file)
    kill -9 $pid || true
    rm /home/ec2-user/app/pid.file
fi

# 애플리케이션 시작
cd /home/ec2-user/app
nohup java -jar *.jar > /home/ec2-user/app/logs/application.log 2>&1 &
echo $! > /home/ec2-user/app/pid.file

# 시작 대기
sleep 10