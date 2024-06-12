#!/bin/bash
# Magnus Glantz, sudo@redhat.com, 2024

ANSIBLE_DIR=/root/ansible-isolated

ansible-sign project gpg-verify $ANSIBLE_DIR
if [ "$?" -eq 0 ]; then
	logger -t "$0 validated playbook and inventory"
	ansible-playbook -i /root/ansible-isolated/inventory /root/ansible-isolated/playbooks/ping.yml
	logger -t "$0 successfully ran playbook"
	
else
	logger -t "$0 WARNING: failed to validate content."
	echo "Error: Cannot validate inventory / playbook."
	exit 1
fi

