#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Create /etc/ansible/hosts file with GCP VM

# Constants - CHANGE ME!
readonly PROJECT='ansible-demo-project'
readonly ZONE='us-east1-b'
readonly USER='garystafford'
readonly SSH_KEY='~/.ssh/id_rsa'
readonly EXTERNAL_IP=$(gcloud compute instances list \
    --filter="name=compute-instance" \
    --project $PROJECT \
  | awk 'NR==2 {print $5}')

sh -c "echo '[webservers]' > ansible/inventories/hosts"
sh -c "echo '${EXTERNAL_IP} ansible_user=${USER} ansible_ssh_private_key_file=${SSH_KEY}' >> ansible/inventories/hosts"
cat ansible/hosts
ansible webservers -m ping
