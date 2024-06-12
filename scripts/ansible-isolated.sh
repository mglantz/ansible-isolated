#!/bin/bash
# Magnus Glantz, sudo@redhat.com, 2024

ANSIBLE_DIR=/root/ansible-isolated

ansible-sign project gpg-verify $ANSIBLE_DIR
if [ "$?" -eq 0 ]; then
	logger -t "ansible-isolated" "OK: validated playbook and inventory"
	ansible-playbook -i /root/ansible-isolated/inventory /root/ansible-isolated/playbooks/ping.yml
	if [ "$?" -eq 0 ]; then
		logger -t "ansible-isolated" "OK: successfully ran playbook"
	else
		logger -t "ansible-isolated" "WARNING: failed to run playbook"
	fi
	
else
	logger -t "ansible-isolated" "CRITICAL: failed to validate content."
	echo "Error: Cannot validate inventory / playbook."
	exit 1
fi
