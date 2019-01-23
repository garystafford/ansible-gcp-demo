#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Create a local hosts file with GCE VM

# Constants - CHANGE ME!
readonly PROJECT='ansible-gce-demo'
readonly ZONE='us-east1-b'
readonly USER='ansible'
readonly SSH_KEY='~/.ssh/ansible'
readonly EXTERNAL_IP=$(gcloud compute instances list \
    --filter="name=compute-instance" \
    --project $PROJECT \
  | awk 'NR==2 {print $5}')

# Populate hosts file with new GCE VM IP and access info
sh -c "echo '[webservers]' > ansible/inventories/hosts"
sh -c "echo '${EXTERNAL_IP} ansible_user=${USER} ansible_ssh_private_key_file=${SSH_KEY}' >> ansible/inventories/hosts"
cat ansible/inventories/hosts

# Should ask to continue with new host first time we connect
yes | ansible webservers -m ping
