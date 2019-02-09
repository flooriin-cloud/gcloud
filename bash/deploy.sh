#! /bin/bash
apt update && apt upgrade -y
apt install openjdk-8-jdk -y
apt install python -y
wget http://apache.claz.org/cassandra/3.11.3/apache-cassandra-3.11.3-bin.tar.gz
tar -xzvf apache-cassandra-3.11.2-bin.tar.gz
mv apache-cassandra-3.11.2 /usr/local/cassandra
