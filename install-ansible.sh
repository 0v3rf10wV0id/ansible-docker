#!/bin/bash

# Check if running as root
if [ "$(id -u)" != "0" ]; then
    # Check if sudo is installed
    if ! command -v sudo &> /dev/null; then
        apt-get update
        apt-get install -y sudo
    fi
    # Re-run the script with sudo
    exec sudo "$0" "$@"
    exit
fi

# Install Ansible
apt-get update
apt-get install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible