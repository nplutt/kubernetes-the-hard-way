#!/usr/bin/env bash

set -e

echo "Installing ssm agent..."
sudo snap install amazon-ssm-agent --classic

echo "Validating ssm agent status:"
sudo snap list amazon-ssm-agent
sudo snap services amazon-ssm-agent