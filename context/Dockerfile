ARG EE_BASE_IMAGE=quay.io/ansible/ansible-runner:stable-2.12-devel
ARG EE_BUILDER_IMAGE=quay.io/ansible/ansible-builder:latest

FROM $EE_BASE_IMAGE as galaxy
ARG ANSIBLE_GALAXY_CLI_COLLECTION_OPTS=
USER root

ADD _build /build
WORKDIR /build

RUN ansible-galaxy role install -r requirements.yml --roles-path "/usr/share/ansible/roles"
RUN ANSIBLE_GALAXY_DISABLE_GPG_VERIFY=1 ansible-galaxy collection install $ANSIBLE_GALAXY_CLI_COLLECTION_OPTS -r requirements.yml --collections-path "/usr/share/ansible/collections"

FROM $EE_BUILDER_IMAGE as builder

COPY --from=galaxy /usr/share/ansible /usr/share/ansible

ADD _build/requirements.txt requirements.txt
ADD _build/bindep.txt bindep.txt
RUN ansible-builder introspect --sanitize --user-pip=requirements.txt --user-bindep=bindep.txt --write-bindep=/tmp/src/bindep.txt --write-pip=/tmp/src/requirements.txt
RUN assemble

FROM $EE_BASE_IMAGE
USER root

COPY --from=galaxy /usr/share/ansible /usr/share/ansible

COPY --from=builder /output/ /output/
RUN /output/install-from-bindep && rm -rf /output/wheels
RUN alternatives --set python /usr/bin/python3
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN yum install unzip -y
COPY --from=quay.io/project-receptor/receptor:0.9.7 /usr/bin/receptor /usr/bin/receptor
COPY --chown=1000:1000 ./configs /home/runner
RUN cd /runner && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && /runner/aws/install -i /usr/local/aws-cli -b /usr/local/bin
RUN curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin && aws eks update-kubeconfig --name prd-cluster-002
RUN mkdir -p /var/run/receptor
ADD run.sh /run.sh
CMD /run.sh
USER 1000
RUN git lfs install
