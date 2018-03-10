#!/bin/bash

KEY=~/.ec2/splunk-test.pem
USER=ubuntu
for S in `cat ~/ssh_servers/servers.txt` ; do
       ssh -i $KEY $USER@$S "sudo chef-client"
done

######## OR ###########

IP="35.172.231.241 54.159.16.189"
KEY=~/.ec2/splunk-test.pem
USER=ubuntu
for S in $IP ; do
        ssh -i $KEY $USER@$S "ls -l"
done
