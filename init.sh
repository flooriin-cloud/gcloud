#! /bin/bash
gcloud compute --project=magnetic-math-210915 instance-templates create cass01 --machine-type=f1-micro --network=projects/magnetic-math-210915/global/networks/default --network-tier=PREMIUM --metadata=startup-script=\#\!\ /bin/bash$'\n'apt\ update\ \&\&\ apt\ upgrade\ -y$'\n'apt\ install\ openjdk-8-jdk\ -y$'\n'apt\ install\ python\ -y$'\n'wget\ http://apache.claz.org/cassandra/3.11.3/apache-cassandra-3.11.3-bin.tar.gz$'\n'tar\ -xzvf\ apache-cassandra-3.11.2-bin.tar.gz$'\n'mv\ apache-cassandra-3.11.2\ /usr/local/cassandra --maintenance-policy=MIGRATE --no-service-account --no-scopes --tags=https-server --image=ubuntu-minimal-1804-bionic-v20190204b --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=cass01