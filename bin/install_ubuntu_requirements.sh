#!/usr/bin/env bash

TERRAFORM_VERSION=0.13.0
PACKER_VERSION=1.6.1
KUBECTL_VERSION=1.18.6
CFSSL_VERSION=1.4.1

echo "Installing terraform ${TERRAFORM_VERSION}..."
wget --https-only --show-progress -O /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /tmp/
chmod +x /tmp/terraform
sudo mv /tmp/terraform /usr/local/bin/
terraform --version

echo "Installing packer ${PACKER_VERSION}..."
wget --https-only --show-progress -O /tmp/packer_${PACKER_VERSION}_linux_amd64.zip \
    https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
unzip /tmp/packer_${PACKER_VERSION}_linux_amd64.zip -d /tmp/
sudo mv /tmp/packer /usr/local/bin/
packer --version

echo "Installing kubectl ${KUBECTL_VERSION}..."
wget --https-only --show-progress -O /tmp/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
chmod +x /tmp/kubectl
sudo mv /tmp/kubectl /usr/local/bin/kubectl
kubectl version --client

echo "Installing cfssl ${CFSSL_VERSION}..."
wget --show-progress --https-only -P /tmp/ \
  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssl \
  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssljson
chmod +x /tmp/cfssl /tmp/cfssljson
sudo mv /tmp/cfssl /tmp/cfssljson /usr/local/bin/
cfssl version
