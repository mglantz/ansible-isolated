# Isolated use of ansible-sign
* Crontab runs script
* Script runs ansible-sign to validate these instructions (README.md), public key, inventory, playbook and script
* Script runs playbook if it checks out
* Script logs to /var/log/messages

# Installation
```
dnf install python3-pip git

# Use either installation methods, depending on if you use upstream or AAP
# pip install ansible ansible-sign
# dnf install ansible ansible-sign

git clone https://github.com/mglantz/ansible-isolated
cd ansible-isolated
gpg --import secure-org_pubkey.asc
```

# Running demo
```
sh ansible-isolated/scripts/ansible-isolated.sh 
[OK   ] GPG signature verification succeeded.
[OK   ] Checksum validation succeeded.

PLAY [Check extremely senstive things] **********************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************
ok: [localhost]

TASK [Log into the server and check that the ping modules returns output] ***********************************************************************************************************
ok: [localhost]

PLAY RECAP **************************************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

# Running script on a schedule using cron
```
echo "0 * * * * sh /root/ansible-isolated/scripts/ansible-isolated.sh" >>/var/spool/cron/root
```

## How ansible-sign works with Ansible Automation Platform
Read more here: https://docs.ansible.com/automation-controller/latest/html/userguide/project-sign.html 
![How ansible-sign works](ansible-sign.png)
