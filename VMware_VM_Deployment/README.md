# This Github contains Ansible plays to Create VMs for template on vCenter for ECP deployment

Follow the steps to create the VMs

## Usage
#The Role "deploy_vm" has tasks to deploy VMs and attach additional disks for the worker nodes
Clone this repository and cd into the directory


cd ecp-vm

#Edit the Ansible Vault to enter the credentials for the vCenter

ansible-vault edit secret.yml

#Default Vault Password is 'Changeme'

#Edit the variable file using an editor and enter the details of the VM and environment

vi roles/deploy_vm/vars/main.yml

To run the play

ansible-playbook playbooks/deployVM.yml --ask-vault-pass -e@secret.yml
