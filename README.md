[![Build Status](https://travis-ci.org/juju4/ansible-orchestrator.svg?branch=master)](https://travis-ci.org/juju4/ansible-orchestrator)
# Orchestrator ansible role

A simple ansible role to setup a dedicated host as an ansible/vagrant orchestrator.
As it is inside a "guest", it's more fit to manage remote/cloud instance (digitalocean, aws, vsphere...) than a local one (virtualbox, libvirt...)

It will install vagrant, ansible and some vagrant plugins

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - orchestrator
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/orchestrator
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/orchestrator/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues


## License

BSD 2-clause

