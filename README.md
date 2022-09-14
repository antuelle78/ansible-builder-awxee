# ansible-builder-awxee

This repository can be used to build a custom execution environment for use with AWX.

To use it, activate the virtual environment by running:

```
source builder/bin/activate
```

**Ansible version:**

The version of ansible used is set in the "execution-environment.yml" file i.e:

```
build_arg_defaults:

EE_BASE_IMAGE: 'quay.io/ansible/ansible-runner:stable-2.12-devel'
```

Ensures that the base image has the latest release of ansible-core 2.12

```
build_arg_defaults:

EE_BASE_IMAGE: 'quay.io/ansible/ansible-runner:latest'
```
Ensures that the base image has the current release of ansible-core

**Collection:**

Edit the "requirements.yml" file to ensure that the collections required by your roles are included.

**Python modules:**

Edit the "requirements.txt" file to add/remove python modules

**Python interpretor:**

When running tasks delegated to localhost set the python interpreter to:

```
ansible_python_interpreter: /usr/bin/python
```

**Build image:**

Use the command below as a guideline for building you image replacing "username/repo:tag" with your details.

```
ansible-builder build --tag username/repo:tag --context ./context --container-runtime docker
```
