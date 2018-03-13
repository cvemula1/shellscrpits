#!/bin/bash

# Read ip.txt and names.txt into arrays 'ips' and 'names'. This assumes that
# the files have the same number of lines, and that both files are in the
# correct order (i.e. line N of ip.txt corresponds to line N of name.txt),
# so that the indices for both arrays match.
mapfile -t ips < ip.txt
mapfile -t names < name.txt

# Don't use all-caps variable names in your own scripts, they're probably already
# used by other programs.  $USER certainly is.  Use lowercase variable names.
user="ubuntu"
key="~/.ec2/splunk-test.pem"

#(note the ! before ips) so that it iterates over the array indexes rather than the array values
for i in "${!ips[@]}"; do
  knife bootstrap  "${ips[$i]}" -ssh-port 22 \
    --ssh-user "$user" --sudo  --i "$key" \
    --no-host-key-verify -N "${names[$i]}" --run-list "role[webserver]"
done
