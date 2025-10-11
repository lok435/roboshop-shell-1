#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "This script is started execution at : $TIMESTAMP" &>> $LOGFILE
TIMESTAMP=$(date)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 .. failed$N"
    else
        echo -e "$G $2 .. success$N"
    fi
}

cp .mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo

VALIDATE $1 "copying mongo-file"

sudo yum install -y mongodb-org  &>> $LOGFILE

VALIDATE $? "installation of mongodb"

systemctl enable mongod &>> $LOGFILE

VALIDATE $? "enabling mongodb"

systemctl start mongod &>> $LOGFILE

VALIDATE $? "starting mongodb"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>> $LOGFILE


VALIDATE $? "remote access to mongod"

systemctl restart mongod &>> $LOGFILE

VALIDATE $?  "restarting mongod"