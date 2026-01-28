#! /bin/bash

yum update -y
yum install -y jq telnet tcpdump htop
# Optional: SSM Agent install if AMI lacks it
# amazon-linux-extras install -y epel
# yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent || true
systemctl start amazon-ssm-agent || true

sudo yum install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
