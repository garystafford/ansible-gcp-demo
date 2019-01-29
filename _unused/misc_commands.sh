pip3 install ansible
pip3 install requests google-auth

gcloud compute images list

ansible-config view --config=ansible.cfg

ssh-keygen -t rsa -b 4096 -C "ansible"
cat ~/.ssh/ansible.pub | pbcopy

ansible all -m ping
ansible webservers -m ping

ansible-playbook ansible/webservers.yml --check
ansible-playbook ansible/sites.yml --limit 'webservers' --check

ansible-galaxy init httpd
ansible-galaxy init gcpweb

ansible webservers -i inventories/webserver_gcp.yml -m setup

# time ansible-playbook \
#   --inventory "104.196.184.165," \
#   playbooks/20_webserver_config.yml --check

ab -kc 100 -n 100000 http://104.196.184.165/server-status/
