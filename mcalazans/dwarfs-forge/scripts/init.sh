#!/bin/bash

# Sanitize
set -eu
PATH="/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/bin"

echo "**** Initialization"

echo "** Upgrading base system"
yum -q -y upgrade

echo "** Updating accepted SSH ciphers and MACs"
echo "" >> /etc/ssh/sshd_config
echo "Ciphers chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com" >> /etc/ssh/sshd_config
echo "MACs umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1" >> /etc/ssh/sshd_config
echo "" >> /etc/ssh/sshd_config

echo "** Configuring session timeouts to 15 minutes"
echo "" >> /etc/bashrc
echo "# Session timeout - 15 minutes" >> /etc/bashrc
echo "TMOUT=900" >> /etc/bashrc
echo "" >> /etc/bashrc

echo "** Setting up banner - motd (Message Of The Day)"
mv /tmp/motd/banner /etc/update-motd.d/30-banner
chmod +x /etc/update-motd.d/30-banner
chown root:root /etc/update-motd.d/30-banner 
