#!/bin/bash

# Sanitize
set -eu
PATH="/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/bin"

echo "**** Setting up Worker"

echo "** Creating worker user"
groupadd worker
useradd -d /home/worker -g worker -m -s /bin/bash worker

echo "*** Setting up \"services\" files"
mkdir -p /var/mcalazans/services
mv /tmp/dockerfiles/* /var/mcalazans/services

echo "*** Setting up DOJO"
mkdir -p /var/mcalazans/dojo/bin/
mv /tmp/scripts/start-service /var/mcalazans/dojo/bin/start-service
chmod 0755 /var/mcalazans/dojo/bin/*

echo 'PATH=$PATH:/var/mcalazans/dojo/bin' > /etc/profile.d/dojo.sh