# Docker & Docker Compose Setup for Debian using Ansible

This project provides automated installation of Docker and Docker Compose on Debian systems using Ansible. The setup includes all necessary dependencies, security configurations, and user permissions.

## Prerequisites

- Debian-based system
- Sudo privileges
- Basic terminal knowledge

## Components

The project consists of two main files:

1. `install-ansible.sh` - Script to install Ansible
2. `install-docker.yml` - Ansible playbook for Docker and Docker Compose installation

## Installation Steps

### 1. Install Ansible

First, run the installation script to set up Ansible:

```bash
chmod +x install-ansible.sh
./install-ansible.sh
```

This script will:
- Update apt package cache
- Install Ansible via apt package manager

### 2. Install Docker and Docker Compose

After Ansible is installed, run the playbook:

```bash
ansible-playbook -i localhost, install-docker.yml --connection=local --ask-become-pass
```

The playbook performs the following tasks:
- Updates system package cache
- Installs required system dependencies
- Adds Docker's official GPG key
- Configures Docker repository
- Installs Docker CE and CLI
- Installs latest version of Docker Compose
- Creates docker group and configures user permissions
- Starts and enables Docker service
- Verifies installations by checking versions

## What Gets Installed

- Docker CE (Community Edition)
- Docker CLI
- Docker Compose
- Required dependencies:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg
  - lsb-release
  - software-properties-common

## Post-Installation

After installation, the following will be configured:
- Docker service will be running and enabled to start on boot
- Current user will be added to the docker group
- Docker and Docker Compose versions will be displayed for verification

**Note:** You'll need to log out and log back in for the docker group membership to take effect.

## Verification

The playbook automatically verifies the installation by:
- Checking Docker version
- Checking Docker Compose version
- Displaying version information in the console

## Notes

- The playbook requires sudo privileges (handled by `become: true`)
- The Docker group is created to allow non-root users to run Docker commands
- The installation uses official Docker repositories for stable releases

## Troubleshooting

If you encounter any issues:
1. Ensure your system is up to date
2. Verify you have sudo privileges
3. Check system logs for any error messages
4. Ensure all prerequisites are installed

## Security Considerations

- Only official Docker repositories are used
- GPG keys are verified during installation
- User permissions are properly configured through group membership