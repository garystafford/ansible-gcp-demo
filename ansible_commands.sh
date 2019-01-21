pip3 install ansible
vi ~/.ansible/ansible.cfg

ansible-config view --config=anisble.cfg

cat ~/.ssh/id_rsa.pub| pbcopy

# Constants - CHANGE ME!
readonly PROJECT='gke-confluent-atlas'
readonly ZONE='us-east1-b'

sudo mkdir /etc/ansible/

EXTERNAL_IP=$(gcloud compute instances list \
  --filter="name=ansible-instance" \
  --project $PROJECT \
  | awk 'NR==2 {print $5}')

sudo sh -c "sudo echo '[webservers]' > /etc/ansible/hosts"
sudo sh -c "sudo echo '${EXTERNAL_IP} ansible_user=garystafford ansible_ssh_private_key_file=~/.ssh/id_rsa' >> /etc/ansible/hosts"
cat /etc/ansible/hosts

ansible all -m ping
ansible webservers -m ping
ansible all -a "/bin/echo hello"
ansible webservers -a "systemctl status httpd"

# https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html
ansible-playbook ansible/webservers.yml --check
ansible-playbook playbooks/apache/apache.yml --limit 'webservers'
ansible webservers -a "systemctl status httpd"

ansible-galaxy init apache

34hbjVpUaXCyKE39Tj
