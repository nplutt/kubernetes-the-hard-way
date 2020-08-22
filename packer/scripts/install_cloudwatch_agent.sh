#!/usr/bin/env bash

set -e

echo "Creating agent config..."
cat <<EOT > /tmp/awslogs.config
[general]
state_file = /var/awslogs/state/agent-state

[/var/log/syslog]
datetime_format = %b %d %H:%M:%S
file = /var/log/syslog
buffer_duration = 5000
log_stream_name = {instance_id}
initial_position = start_of_file
log_group_name = $LOG_GROUP_PREFIX/var-log-syslog

[/var/log/messages]
datetime_format = %b %d %H:%M:%S
file = /var/log/messages
buffer_duration = 5000
log_stream_name = {instance_id}
initial_position = start_of_file
log_group_name = $LOG_GROUP_PREFIX/var-log-messages

[/var/log/user.log]
datetime_format = %b %d %H:%M:%S
file = /var/log/user.log
buffer_duration = 5000
log_stream_name = {instance_id}
initial_position = start_of_file
log_group_name = $LOG_GROUP_PREFIX/var-log-user
EOT

echo "Installing cloudwatch agent..."
wget -O /tmp/awslogs-agent-setup.py https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py
sudo python /tmp/awslogs-agent-setup.py -n -r $REGION -c /tmp/awslogs.config

echo "Checking agent status..."
sudo service awslogs status