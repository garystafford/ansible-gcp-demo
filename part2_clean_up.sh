#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Delete GCP VM instance, IP address, and firewall rule

# Constants - CHANGE ME!
readonly PROJECT='ansible-gce-demo'
readonly ZONE='us-east1-b'
readonly INSTANCE='web-1'

time yes | gcloud compute instances delete $INSTANCE \
  --project $PROJECT --zone $ZONE

time yes | gcloud compute firewall-rules delete allow-http \
  --project $PROJECT

# Clean up for next workflow
sh -c "echo '' > ansible/inventories/hosts"
