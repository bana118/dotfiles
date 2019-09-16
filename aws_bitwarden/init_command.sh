#!/bin/sh
sudo yum update
sudo amazon-linux-extras install epel
sudo yum install -y docker gcc openssl-devel certbot
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose #see https://docs.docker.com/compose/install/
sudo chmod +x /usr/local/bin/docker-compose
curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh && chmod +x bitwarden.sh
