#!/usr/bin/env bash

set -e

sudo add-apt-repository universe
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y python-minimal
sudo apt-get -y autoremove
