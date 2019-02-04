#!/bin/bash

# Sanitize
set -eu
PATH="/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/bin"

BUILD_USER="ec2-user"
DOCKER_COMPOSE_VERSION=1.22.0

echo "**** Install Docker"

echo "*** Installing Docker"
yum -q -y install docker

echo "** Setting up Docker configurations"
sed -i s/"^OPTIONS"/"#OPTIONS"/g /etc/sysconfig/docker
echo "OPTIONS='-H unix:///var/run/docker.sock -H tcp://127.0.0.1:2375'" >> /etc/sysconfig/docker

usermod -aG docker $BUILD_USER
touch /var/run/docker.sock
chown $BUILD_USER:$BUILD_USER /var/run/docker.sock
if [ $BUILD_USER = ec2-user ]; then
	#chkconfig docker on
	systemctl enable docker --quiet
fi

echo "** Starting docker..."
#/etc/init.d/docker start
systemctl start docker

echo "*** Installing Docker Compose"

sudo curl -s -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "** Docker ready"