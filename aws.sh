#!/usr/bin/env bash
instance=`aws ec2 run-instances --image-id ami-66506c1c --count 1 --instance-type t2.micro --key-name "aws practice"|grep InstanceId|awk -F: '{print $2}'|awk -F, '{print $1}'|tr -d '"'|tr -s ""`
sleep 100
ip=`aws ec2 describe-instances --instance-ids $instance|grep PublicIpAddress|awk -F: '{print $2}'|awk -F, '{print $1}'|tr -d '"'|awk '{print $1}'`

ssh -i /root/awspractice.pem ec2-user@$ip -o StrictHostKeyChecking=no
