#! /bin/bash
function package_exists() {
    return dpkg -l "$1" &> /dev/null
}

apt update
#apt upgrade -y
if ! package_exists openjdk-8-jdk ; then
    apt install openjdk-8-jdk -y
fi
apt install python less nano -y

#Download Cassandra
mkdir /home/init/
cd /home/init
wget http://apache.claz.org/cassandra/3.11.3/apache-cassandra-3.11.3-bin.tar.gz
tar -xzf apache-cassandra-3.11.3-bin.tar.gz
mv -v apache-cassandra-3.11.3 cassandra
mv -vf cassandra /usr/local/cassandra
#Creating a Cassandra User
useradd cassandra
groupadd cassandra
usermod -aG cassandra cassandra
chown root:cassandra -R /usr/local/cassandra/
chmod g+w -R /usr/local/cassandra/
#Testing Permissions
#su - cassandra
#/usr/local/cassandra/bin/cassandra -f

cat <<EOF > /etc/systemd/system/cassandra.service
[Unit]
Description=Cassandra Database Service
After=network-online.target
Requires=network-online.target
[Service]
User=cassandra
Group=cassandra
ExecStart=/usr/local/cassandra/bin/cassandra -f
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload && systemctl start cassandra.service && systemctl enable cassandra.service
