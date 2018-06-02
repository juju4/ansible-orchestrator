[![Build Status - Master](https://travis-ci.org/juju4/ansible-orchestrator.svg?branch=master)](https://travis-ci.org/juju4/ansible-orchestrator)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-orchestrator.svg?branch=devel)](https://travis-ci.org/juju4/ansible-orchestrator/branches)
# Orchestrator ansible role

A simple ansible role to setup a dedicated host as an ansible/vagrant orchestrator.
As it is inside a "guest", it's more fit to manage remote/cloud instance (digitalocean, aws, vsphere...) than a local one (virtualbox, libvirt...)

It will install vagrant, ansible and some vagrant plugins

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested on Ubuntu 14.04, 16.04, 18.04 and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.orchestrator
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.orchestrator
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/juju4.orchestrator/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* ```The conditional check 'not orchestrator_rolesonly' failed. The error was: cannot import name AnsibleVaultEncryptedUnicode```
Seems to appear on Centos (travis/docker centos6, kitchen/lxd centos7).
Python lib issue?

## License

BSD 2-clause

