pip3 install ansible
pip3 install requests google-auth

# https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html
export GCP_AUTH_KIND="serviceaccount"
export GCP_SERVICE_ACCOUNT_EMAIL="ansible@ansible-gce-demo.iam.gserviceaccount.com"
export GCP_SERVICE_ACCOUNT_FILE="~/Documents/Personal/gcp_creds/ansible-gce-demo-a0dbb4ac2ff7.json"
export GCP_SCOPES="www.googleapis.com/auth/compute"

gcloud compute images list

vi ~/.ansible/ansible.cfg

ansible-config view --config=ansible.cfg

ssh-keygen -t rsa -b 4096 -C "ansible"
cat ~/.ssh/ansible.pub | pbcopy

ansible all -m ping
ansible webservers -m ping
ansible all -a "/bin/echo hello"

ansible-inventory --list
ansible-inventory --list --inventory-file ansible/inventories/gcp.yml
ansible-inventory --graph -i ansible/inventories/gcp.yml

# https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html

ansible-playbook ansible/webservers.yml --check
ansible-playbook ansible/sites.yml --limit 'webservers' --check

time ansible-playbook ansible/playbooks/gcpweb/gcpweb_create.yml
time ansible-playbook ansible/playbooks/gcpweb/gcpweb_delete.yml

ansible-galaxy init httpd
ansible-galaxy init gcpweb

http://34.73.22.69/server-status

ansible webservers -a "ab -kc 10 -t 10 http://localhost/" # 50000 requests
ansible webservers -a "ab -kc 100 -n 100000 http://104.196.184.165/server-status/"
ansible webservers -a "ab -kc 100 -n 500000 http://localhost/"
ansible webservers -a "systemctl status httpd"
ansible webservers -a "ls -al /var/www/html"

---

time ansible-playbook -t create playbooks/10_webserver_infra.yml

ansible webservers -i inventories/webserver_gcp.yml -m setup

ansible-inventory --graph -i inventories/webservers_gcp.yml

time ansible-playbook \
  -i inventories/webservers_gcp.yml \
  playbooks/20_webserver_config.yml --check

time ansible-playbook -t delete playbooks/10_webserver_infra.yml --check
