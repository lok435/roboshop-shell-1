#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "this script is started execution at : $TIMESTAMP" &>> $LOGFILE
TIMESTAMP=$(date -%F)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

cp /root/Loknath/roboshop-shell-1/mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo
sudo yum install -y mongodb-org
systemctl enable mongod
systemctl start mongod
sudo systemctl status mongod
mongo --version

