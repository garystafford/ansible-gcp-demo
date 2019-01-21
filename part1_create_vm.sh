#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Create GCP VM instance for Ansible

# Constants - CHANGE ME!
readonly PROJECT='ansible-demo-project'
readonly ZONE='us-east1-b'
readonly INSTANCE='ansible-instance'
readonly SERVICE_ACCOUNT='437868209664-compute@developer.gserviceaccount.com'

gcloud compute instances create $INSTANCE \
  --project $PROJECT \
  --zone $ZONE \
  --machine-type n1-standard-1 \
  --subnet default \
  --network-tier PREMIUM \
  --maintenance-policy MIGRATE \
  --service-account $SERVICE_ACCOUNT \
  --scopes https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --tags http-server \
  --image centos-7-v20190116 \
  --image-project centos-cloud \
  --boot-disk-size 200GB \
  --boot-disk-type pd-standard \
  --boot-disk-device-name $INSTANCE

gcloud compute firewall-rules create default-allow-http \
  --project $PROJECT \
  --direction INGRESS \
  --priority 1000 \
  --network default \
  --action ALLOW \
  --rules tcp:80 \
  --source-ranges 0.0.0.0/0 \
  --target-tags http-server
