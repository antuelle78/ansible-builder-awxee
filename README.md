# 🚀 AWX Execution Environment Builder

[![Ansible](https://img.shields.io/badge/Ansible-2.19.4-EE0000?style=flat&logo=ansible)](https://ansible.com)
[![Python](https://img.shields.io/badge/Python-3.11-3776AB?style=flat&logo=python)](https://python.org)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

> **Modern, containerized Ansible execution environment** for AWX with the latest stable components and optimized performance.

This repository provides a streamlined way to build custom execution environments for AWX (Ansible Tower), featuring the latest versions of Ansible Core, Ansible Runner, and essential collections.

## 📋 Table of Contents

- [✨ Features](#-features)
- [🏗️ Quick Start](#️-quick-start)
- [📦 Components](#-components)
- [⚙️ Configuration](#️-configuration)
- [🔧 Usage](#-usage)
- [📝 Notes](#-notes)
- [🤝 Contributing](#-contributing)

## ✨ Features

- **🔄 Latest Stable Versions**: Ansible Core 2.19.4, Ansible Runner 2.4.2
- **🐳 Modern Containerization**: UBI9 base image with Python 3.11
- **📚 Rich Collections**: Essential Ansible collections pre-installed
- **⚡ Optimized Performance**: EPEL-enabled with git-lfs support
- **🔒 Security**: Receptor integration for secure communication
- **🛠️ Developer Friendly**: Easy setup with virtual environment

## 🏗️ Quick Start

### Prerequisites
- Python 3.11+
- Podman or Docker
- Git

### Installation & Build

```bash
# 1. Clone and setup virtual environment
git clone <repository-url>
cd ansible-builder-awxee
python3 -m venv builder
source builder/bin/activate

# 2. Install ansible-builder
pip install ansible-builder

# 3. Build execution environment
ansible-builder build --tag awx-ee --context ./context --container-runtime podman

# 4. Run the environment
podman run --rm -it awx-ee
```

## 📦 Components

| Component | Version | Description |
|-----------|---------|-------------|
| **Ansible Core** | 2.19.4 | Latest stable Ansible engine |
| **Ansible Runner** | 2.4.2 | Execution environment runner |
| **Python** | 3.11 | Runtime environment |
| **Base Image** | UBI9 | Red Hat Universal Base Image |
| **Receptor** | Latest | Secure communication layer |

### 📚 Included Collections
- `community.general` - General purpose modules
- `community.rabbitmq` - RabbitMQ management
- `amazon.aws` - AWS cloud integration
- `community.windows` - Windows automation
- `community.crypto` - Cryptographic operations
- `community.docker` - Docker container management

## ⚙️ Configuration

### Core Files
- **`execution-environment.yml`** - Main build configuration (ansible-builder v3)
- **`requirements.yml`** - Ansible collections specification
- **`requirements.txt`** - Python package dependencies
- **`bindep.txt`** - System package requirements
- **`ansible.cfg`** - Ansible runtime configuration
- **`run.sh`** - Container entrypoint script

### Build Configuration
```yaml
version: 3
images:
  base_image:
    name: registry.access.redhat.com/ubi9/python-311:latest
dependencies:
  ansible_core:
    package_pip: ansible-core>=2.16.1
  ansible_runner:
    package_pip: ansible-runner>=2.4.0
```

## 🔧 Usage

### Building Custom Images
```bash
# Build with custom tag
ansible-builder build --tag my-custom-ee:v1.0 --context ./context

# Build with Docker instead of Podman
ansible-builder build --tag awx-ee --container-runtime docker
```

### Running Playbooks
```bash
# Run ansible-runner worker
podman run --rm -it awx-ee

# Mount volumes for persistent data
podman run --rm -it -v $(pwd):/runner/project awx-ee ansible-runner run /runner/project
```

### Development Workflow
```bash
# Activate environment
source builder/bin/activate

# Modify collections in requirements.yml
# Update Python packages in requirements.txt
# Rebuild environment
ansible-builder build --tag awx-ee --context ./context
```

## 📝 Notes

### ⚠️ Collection Limitations
The following collections are commented out due to missing dependencies:
- `kubernetes.core` - Requires `openshift-clients` RPM
- `awx.awx` - Depends on kubernetes.core

**To enable**: Uncomment in `requirements.yml` if you have OCP repository access.

### 🔧 Build Features
- **EPEL Integration**: Extended package repository enabled
- **Git LFS Support**: Large file storage capabilities
- **Receptor Ready**: Pre-configured for secure AWX communication
- **User Management**: Proper runner user setup

### 🐛 Troubleshooting
- Ensure Podman/Docker is running
- Check network connectivity for package downloads
- Verify sufficient disk space for image builds

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the build process
5. Submit a pull request

---

**Built with ❤️ for the Ansible community** | [Ansible Documentation](https://docs.ansible.com) | [AWX Documentation](https://docs.ansible.com/ansible-tower/)