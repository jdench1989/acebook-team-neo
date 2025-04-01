#!bin/bash

# Install node
yum install nvm
nvm install 23.10.0

# Install dependencies
npm install

# Install MongoDB
echo "[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc" > /etc/yum.repos.d/mongodb-org-8.0.repo

yum install -y mongodb-org
systemctl start mongod
