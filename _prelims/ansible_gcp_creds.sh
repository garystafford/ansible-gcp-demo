#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Source Ansible/GCP credentials
# usage: source ./ansible_gcp_creds.sh

# Constants - CHANGE ME!
export GCP_AUTH_KIND='serviceaccount'
export GCP_SERVICE_ACCOUNT_EMAIL='ansible@ansible-gce-demo.iam.gserviceaccount.com'
export GCP_SERVICE_ACCOUNT_FILE='~/Documents/Personal/gcp_creds/ansible-gce-demo-a0dbb4ac2ff7.json'
export GCP_SCOPES='https://www.googleapis.com/auth/compute'
