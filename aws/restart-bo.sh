#!/bin/bash
# 1
echo "> 현재 구동중인 애플리케이션 pid 확인"
PROJECT_NAME=davogo-bo

CURRENT_PID=$(pgrep -f ${PROJECT_NAME}.war)
echo "현재 구동 중인 애플리케이션 pid: $CURRENT_PID"


# 2
if [ -z "$CURRENT_PID" ]; then
    echo "> 현재 구동 중인 애플리케이션이 없으므로 종료하지 않습니다."
else
    echo "> kill -15 $CURRENT_PID"
    kill -15 $CURRENT_PID
    sleep 5
fi

# 3
nohup java -jar -Xms128M -Xmx256M ./${PROJECT_NAME}.war --spring.profiles.active=dev > /home/ec2-user/log/${PROJECT_NAME}_log.out 2>&1 &