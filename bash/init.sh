#! /bin/bash
apt update
apt install curl -y
mkdir /home/init/
cd /home/init
curl -O -L https://raw.githubusercontent.com/flooriin-cloud/gcloud/master/bash/deploy.sh
chmod u+x deploy.sh
./deploy.sh &>> output.txt
