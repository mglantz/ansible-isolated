# Isolated use of ansible-sign
* Crontab runs script
* Script validates gpg signature of project
* Script applies automation

# Installing demo
```
dnf install python3-pip git
pip install ansible ansible-sign
git clone https://github.com/mglantz/ansible-isolated
cd ansible-isolated
gpg --import secure-org_pubkey.asc
```

## How ansible-sign works with Ansible Automation Platform
Read more here: https://docs.ansible.com/automation-controller/latest/html/userguide/project-sign.html 
![How ansible-sign works](ansible-sign.png)
