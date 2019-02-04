#!/bin/bash
set -eu
PATH="/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/bin"

CLOUDWATCH_MONITORING_SCRIPTS="CloudWatchMonitoringScripts-1.2.2.zip"

echo "**** Installing Monitoring Helpers"

# AWS specific configuration
echo "** Installing CloudWatch helper scripts"
echo "WARNING: This script will NOT add to crontab. You must add it using USERDATA."
[[ -d /opt/aws-scripts-mon ]] || {
	# Install required tools for Amazon Linux
	yum install -q -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https perl-Digest-SHA.x86_64

	# Download and Install script
	cd /opt
	wget -q "http://aws-cloudwatch.s3.amazonaws.com/downloads/${CLOUDWATCH_MONITORING_SCRIPTS}"
	unzip -q "${CLOUDWATCH_MONITORING_SCRIPTS}"
	rm "${CLOUDWATCH_MONITORING_SCRIPTS}"
}
echo "** Downloading amazon ssm agent"
cd /tmp
curl -s https://amazon-ssm-us-east-1.s3.amazonaws.com/latest/linux_amd64/amazon-ssm-agent.rpm -o amazon-ssm-agent.rpm
yum remove -y -q amazon-ssm-agent
yum install -y -q amazon-ssm-agent.rpm

echo "** Installing CloudWatch Logs agent"
yum install -y -q awslogs