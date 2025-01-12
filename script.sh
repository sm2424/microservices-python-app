#!/bin/bash
sudo apt-get update

# Install Terraform
sudo apt install wget -y
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

echo "*******************************************"
terraform -version
echo "*******************************************"


# Install kubectl
sudo apt update
sudo apt install curl -y
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "*******************************************"
kubectl version --client
echo "*******************************************"


# Install AWS CLI 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install
echo "*******************************************"
aws --version
echo "*******************************************"

#install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

echo "*******************************************"
helm version --short
echo "*******************************************"

#install python
sudo apt update
sudo apt install python3 -y

echo "*******************************************"
python3 --version
echo "*******************************************"

#install postgresql

# Update the package list and install PostgreSQL
sudo apt update
sudo apt install -y postgresql postgresql-contrib
# Start the PostgreSQL service and enable it on boot
sudo systemctl enable postgresql
sudo systemctl restart postgresql

echo "*******************************************"
psql --version
echo "*******************************************"

#mongoDB
sudo apt update
sudo apt install wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release -y
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install mongodb-org -y
sudo systemctl enable --now mongod
sudo systemctl restart mongod
echo "*******************************************"
mongod --version
echo "*******************************************"

#install docker
sudo apt-get install docker.io -y
sudo usermod -aG docker ubuntu  
newgrp docker
sudo chmod 777 /var/run/docker.sock

sudo systemctl enable docker
sudo systemctl restart docker
echo "*******************************************"
docker version
echo "****************************
