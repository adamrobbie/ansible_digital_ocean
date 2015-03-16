## What is this?

This small project was my attempt to write a zero-to-deploy ansible script for any Rails project to a brand new Digital Ocean droplet.


### Ansible Setup

- Run `scripts/bootstrap.sh`
- Run `ANSIBLE_INSTALL_PATH=/path/to/ansible source scripts/ansible-setup.sh`
- You can now run `ansible` playbooks in the current shell

