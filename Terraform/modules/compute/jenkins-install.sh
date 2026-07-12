#!/bin/bash
set -euxo pipefail

# Update the system
sudo dnf update -y || yum update -y

# Install required packages
sudo dnf install -y java-21-amazon-corretto git docker wget || \
sudo yum install -y java-21-amazon-corretto git docker wget

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo dnf install -y jenkins

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Add ec2-user and jenkins to the docker group
usermod -aG docker ec2-user
usermod -aG docker jenkins

# Enable and start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Wait for Jenkins initialization
sleep 30

# Save the initial admin password
cp /var/lib/jenkins/secrets/initialAdminPassword /home/ec2-user/jenkins-password.txt
chown ec2-user:ec2-user /home/ec2-user/jenkins-password.txt

# Log installed versions
java -version
git --version
docker --version
systemctl status jenkins --no-pager