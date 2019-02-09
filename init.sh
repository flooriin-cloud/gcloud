#! /bin/bash
less /var/log/apt/history.log

gcloud compute --project=magnetic-math-210915 instance-templates create cass01 --machine-type=f1-micro --network=projects/magnetic-math-210915/global/networks/default --network-tier=PREMIUM --metadata=startup-script=\#\!\ /bin/bash$'\n'apt\ update$'\n'apt\ install\ curl\ -y$'\n'mkdir\ /home/init/$'\n'cd\ /home/init$'\n'curl\ -O\ -L\ https://raw.githubusercontent.com/flooriin-cloud/gcloud/master/bash/deploy.sh$'\n'chmod\ u\+x\ deploy.sh$'\n'./deploy.sh --no-restart-on-failure --maintenance-policy=MIGRATE --no-service-account --no-scopes --tags=https-server --image=ubuntu-minimal-1804-bionic-v20190204b --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=cass01

gcloud compute --project=magnetic-math-210915 instances create cass01-1 --zone=us-east1-b --machine-type=f1-micro --subnet=default --network-tier=PREMIUM --metadata=startup-script=\#\!\ /bin/bash$'\n'apt\ update$'\n'apt\ install\ curl\ -y$'\n'mkdir\ /home/init/$'\n'cd\ /home/init$'\n'curl\ -O\ -L\ https://raw.githubusercontent.com/flooriin-cloud/gcloud/master/bash/deploy.sh$'\n'chmod\ u\+x\ deploy.sh$'\n'./deploy.sh --no-restart-on-failure --maintenance-policy=MIGRATE --no-service-account --no-scopes --tags=https-server --image=ubuntu-minimal-1804-bionic-v20190204b --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=cass01-1
