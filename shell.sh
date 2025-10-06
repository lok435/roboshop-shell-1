#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "this script is started execution at : $TIMESTAMP" &>> $LOGFILE
TIMESTAMP=$(date -%F)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

cp mongo.repo /etc/yum.rep.d/mongo.repo
dnf install mongodb-org -y 
systemctl enable mongod
systemctl start mongod
