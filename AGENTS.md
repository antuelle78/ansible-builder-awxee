# Agent Instructions

## Build and Test Commands
- **Environment**: Source the virtual env: `source builder/bin/activate`
- **Build**: `ansible-builder build --tag awx-ee --context ./context --container-runtime podman`
- **Run**: `podman run --rm -it awx-ee` (defaults to `/run.sh`).
- **Single test**: `ansible-runner run . -p test-playbook.yml` (runs specific playbook test)
- **Lint**: `yamllint *.yml *.yaml` (YAML validation)
- **Dependencies**:
  - `requirements.yml`: Ansible Collections. Note: `kubernetes.core` and `awx.awx` are commented out due to missing `openshift-clients` RPM in UBI9/EPEL. Uncomment only if you have access to OCP repos.
  - `requirements.txt`: Python packages (updated to modern versions).
  - `bindep.txt`: System packages (EPEL enabled in build).
  - `ansible-core` >= 2.16.1 (via pip).
  - `ansible-runner` >= 2.4.0 (via pip).

## Code Style Guidelines
- **Formatting**: YAML 2 spaces, consistent indentation.
- **Naming**: Use snake_case for variables/tasks, descriptive names for playbooks/roles.
- **Imports**: No imports in YAML; use Ansible includes for modularity.
- **Types**: Use proper YAML types; quote strings when needed.
- **Error handling**: Use `failed_when`, `ignore_errors`, `rescue` blocks appropriately.
- **Version**: `ansible-builder` v3 (schema version 3).
- **Base Image**: `registry.access.redhat.com/ubi9/python-311:latest` (Python 3.11).
- **Configuration**: `execution-environment.yml` handles build steps.
