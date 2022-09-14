# ansible-builder-awxee

This repository can be used to build a custom execution environment for use with AWX.

To use it, activate the virtual environment by running:

```
source builder/bin/activate
```

**Collection:**

Edit the "requirements.yml" file to ensure that the collections required by your roles are included.

**Python modules:**

Edit the "requirements.txt" file to add/remove python modules

**Build image:**

Use the command below as a guideline for building you image replacing "username/repo:tag" with your details.

```
ansible-builder build --tag username/repo:tag --context ./context --container-runtime docker
```