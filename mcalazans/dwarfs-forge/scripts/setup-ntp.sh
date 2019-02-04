#!/bin/bash

set -eu
PATH="/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/bin"

echo "**** Setting up NTP"

echo "** Removing old NTP Services"
sudo yum erase 'ntp*'

echo "** Installing chrony"
sudo yum install chrony -y

echo "** Configuring NTP server preference"
sudo sed -i "/server.*/c\server 169.254.169.123 prefer iburst" /etc/chrony.conf

echo "** Starting chrony daemon"
sudo service chronyd start

echo "** Enabling boot initialization"
sudo chkconfig chronyd on
