#!/usr/bin/env bash

cd "$(dirname "$0")"

packer build \
    -var "region=$REGION" \
    -var "name=$NAME" \
    -var "namespace=$NAMESPACE" \
    -var "ami_description=$AMI_DESCRIPTION" \
    -var "instance_type=$INSTANCE_TYPE" \
    -var "source_ami_id=$SOURCE_AMI_ID" \
    -var "ssh_username=$SSH_USERNAME" \
    -var "vpc_id=$VPC_ID" \
    -var "subnet_id=$SUBNET_ID" \
    ./base.json
