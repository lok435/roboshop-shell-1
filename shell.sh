#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "this script is started execution at : $TIMESTAMP" &>> $LOGFILE
TIMESTAMP=$(date -%F)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 .. failed"
    else
        echo "$2 .. success"
    fi
}

cp .mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo

VALIDATE $1 "copying mongo-file"

sudo yum install -y mongodb-org  &>> LOGFILE

VALIDATE $? "installation of mongodb"

systemctl enable mongod

VALIDATE $? "enabling mongodb"

systemctl start mongod

VALIDATE $? "starting mongodb"

sudo systemctl status mongod
mongo --version

