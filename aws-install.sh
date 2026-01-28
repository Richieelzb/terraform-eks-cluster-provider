#!/bin/bash

set -e
# Update system
sudo yum update -y
# Install required dependencies (curl + unzip)
sudo yum install -y curl unzip
# Download the latest AWS CLI v2 package
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# Unzip the installer
unzip awscliv2.zip
# Install or update AWS CLI v2
sudo ./aws/install --update
