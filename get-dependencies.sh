#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.orchestrator ] && ln -s ansible-orchestrator $rolesdir/juju4.orchestrator
[ ! -e $rolesdir/juju4.orchestrator ] && cp -R $rolesdir/ansible-orchestrator $rolesdir/juju4.orchestrator

## don't stop build on this script return code
true
