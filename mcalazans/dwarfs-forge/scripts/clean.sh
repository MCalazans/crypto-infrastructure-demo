#!/bin/bash

# Sanitize
set -eu
PATH="/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/bin"

echo "**** Cleanup (Common)"

echo "** Cleaning /tmp"
rm -fr /tmp/*

echo "** Cleaning yum files"
yum -q -y autoremove
yum -q -y clean all

sync