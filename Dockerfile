## $ docker build -t orchestrator:0.1 .
## $ docker run -it orchestrator:0.1
## $ docker run -it --read-only --tmpfs /run --tmpfs /tmp --tmpfs /home/ansibleuser/.ansible -v ~/ansible:/home/ansibleuser/ansible:ro -v ~/ansibleroles:/etc/ansible/roles:rw orchestrator:0.1
## $ docker run -it --tmpfs /run --tmpfs /tmp --tmpfs /home/ansibleuser/.ansible -v ~/ansible:/home/ansibleuser/ansible:ro -v ~/.ssh/keys:/home/ansibleuser/.ssh/keys:ro orchestrator:0.1
##      > ansible-playbook -i ~/ansible/hosts -e TARGETIP=localhost -e ROLE=juju4.orchestrator -e orchestrator_rolesonly=true -c local ~/ansible/run_role.yml
## alternative: https://hub.docker.com/r/ansible/ansible/~/dockerfile/ (opensuse base)
FROM ubuntu:16.04
RUN apt-get update

# Install Ansible
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common git
#RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible python sudo python-pip
RUN pip install --upgrade pip
#RUN pip install ansible
RUN pip install git+git://github.com/ansible/ansible.git@devel

# Install Ansible inventory file
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

RUN git clone https://github.com/juju4/ansible-orchestrator.git /etc/ansible/roles/juju4.orchestrator
# Use group/host_vars volume to have specific configuration
# Note: No volume on build https://github.com/docker/docker/issues/14080
RUN cd /etc/ansible/roles/juju4.orchestrator && \
    sh -x get-dependencies.sh && \
    ansible-playbook -i localhost, --connection=local --sudo test/integration/default/default.yml
#    rm -R /etc/ansible/roles/*

RUN useradd -m ansibleuser
RUN chown -R ansibleuser /home/ansibleuser /etc/ansible
USER ansibleuser
WORKDIR /home/ansibleuser

VOLUME /etc/ansible/roles
VOLUME /home/ansibleuser/ansible

ENTRYPOINT ["/bin/bash"]
