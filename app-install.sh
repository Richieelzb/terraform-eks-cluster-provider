#! /bin/bash

yum update -y
yum install -y jq telnet tcpdump htop
# Optional: SSM Agent install if AMI lacks it
# amazon-linux-extras install -y epel
# yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent || true
systemctl start amazon-ssm-agent || true

sudo curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

sudo yum install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
