pip3 install ansible
pip3 install requests google-auth

# https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html
export GCP_AUTH_KIND="serviceaccount"
export GCP_SERVICE_ACCOUNT_EMAIL="437868209664-compute@developer.gserviceaccount.com"
export GCP_SERVICE_ACCOUNT_FILE="~/Documents/Personal/ansible-demo-project-f4cf59b1413b.json"
export GCP_SCOPES="www.googleapis.com/auth/compute"

gcloud compute images list

vi ~/.ansible/ansible.cfg

ansible-config view --config=ansible.cfg

cat ~/.ssh/id_rsa.pub| pbcopy

ansible all -m ping
ansible webservers -m ping
ansible all -a "/bin/echo hello"

ansible-inventory --list
ansible-inventory --list --inventory-file ansible/inventories/gcp.yml

# https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html
ansible-playbook ansible/webservers.yml --check
ansible-playbook ansible/sites.yml --limit 'webservers'
ansible-playbook ansible/sites.yml --limit 'webservers' --check

ansible-playbook ansible/gcp_instance.yml
ansible-playbook ansible/gcp_instance_delete.yml

ansible-galaxy init apache
ansible-galaxy init gcpweb

http://34.73.22.69/server-status

ansible webservers -a "ab -kc 10 -t 10 http://localhost/" # 50000 requests
ansible webservers -a "ab -kc 25 -n 100000 http://localhost/"
ansible webservers -a "ab -kc 100 -n 500000 http://localhost/"
ansible webservers -a "systemctl status httpd"
ansible webservers -a "ls -al /var/www/html"
