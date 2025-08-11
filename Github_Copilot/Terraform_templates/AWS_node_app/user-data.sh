#!/bin/bash
yum update -y
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs git

# Clone your Node.js app repo
git clone https://github.com/YOUR_USERNAME/YOUR_NODE_APP.git /home/ec2-user/app
cd /home/ec2-user/app

npm install
nohup node index.js > app.log 2>&1 &
