#!/bin/bash

#Create the Swap File
fallocate -l 4g /mnt/4GiB.swap
chmod 600 /mnt/4GiB.swap
mkswap /mnt/4GiB.swap
#Enable use of Swap File
swapon /mnt/4GiB.swap
cat /proc/swaps 
#Enable Swap File at Bootup
echo '/mnt4GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab
