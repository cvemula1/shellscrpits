#!/bin/bash

#Create the Swap File
sudo fallocate -l 2g /mnt/2GiB.swap
sudo chmod 600 /mnt/2GiB.swap
sudo mkswap /mnt/2GiB.swap
#Enable use of Swap File
sudo swapon /mnt/2GiB.swap
cat /proc/swaps 
#Enable Swap File at Bootup
echo '/mnt2GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab

