#!/bin/bash

# Exit on error
set -e

# Install Node.js properly (using nodesource)
curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash -
yum install -y nodejs

# Change to the correct deployment directory
mkdir -p /home/ec2-user/acebook
cd /home/ec2-user/acebook

# Install dependencies
if [ -f package-lock.json ]; then
    npm ci
else
    npm install
fi

# Install MongoDB
echo "[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc" | tee /etc/yum.repos.d/mongodb-org-8.0.repo

yum install -y mongodb-org

# Ensure MongoDB service is correctly set up
systemctl daemon-reload
systemctl enable mongod
systemctl start mongod