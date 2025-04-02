#!/bin/bash

# Exit on error
sudo set -e

# Install Node.js properly (using nodesource)
sudo curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash -
sudo yum install -y nodejs

# Install dependencies
sudo npm install

# Install MongoDB
sudo echo "[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc" > /etc/yum.repos.d/mongodb-org-8.0.repo

sudo yum install -y mongodb-org
sudo systemctl start mongod