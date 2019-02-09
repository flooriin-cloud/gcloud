#! /bin/bash
mkdir /home/init/
cd /home/init
wget -O deploy.sh https://github.com/flooriin-cloud/gcloud/blob/master/bash/deploy.sh
chmod u+x deploy.sh
./deploy.sh
