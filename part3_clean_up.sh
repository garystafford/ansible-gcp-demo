#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Delet GCP VM instance and firewall rule

# Constants - CHANGE ME!
readonly PROJECT='ansible-demo-project'
readonly ZONE='us-east1-b'
readonly INSTANCE='ansible-instance'

# Delete instance
yes | gcloud compute instances delete $INSTANCE \
  --project $PROJECT --zone $ZONE

yes | gcloud compute firewall-rules delete default-allow-http \
  --project $PROJECT
