# Ansible GCP Demo

# Project Structure

```text
> tree -L 3
.
├── LICENSE
├── README.md
├── _unused
│   ├── httpd_playbook.yml
│   └── misc_commands.sh
├── ansible
│   ├── ansible.cfg
│   ├── group_vars
│   │   └── webservers.yml
│   ├── inventories
│   │   ├── hosts
│   │   └── webservers_gcp.yml
│   ├── playbooks
│   │   ├── 10_webserver_infra.yml
│   │   └── 20_webserver_config.yml
│   ├── roles
│   │   ├── gcpweb
│   │   └── httpd
│   └── site.yml
├── part0_source_creds.sh
├── part1_create_vm.sh
└── part2_clean_up.sh
```
# References
- <https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html>
- <http://matthieure.me/2018/12/31/ansible_inventory_plugin.html>
- <https://leucos.github.io/ansible-files-layout>
- <https://www.redhat.com/en/blog/creating-load-balanced-web-service-cloud-ansible?source=tag&term=22621>
- <https://adminswerk.de/multi-line-string-yaml-ansible-II/>
