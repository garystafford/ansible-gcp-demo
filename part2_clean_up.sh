#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Delete GCP VM instance, IP address, and firewall rule

# Constants - CHANGE ME!
readonly PROJECT='ansible-gce-demo'
readonly ZONE='us-east1-b'

time yes | gcloud compute instances delete web-1 \
  --project $PROJECT --zone $ZONE

time yes | gcloud compute firewall-rules delete default-allow-http \
  --project $PROJECT
