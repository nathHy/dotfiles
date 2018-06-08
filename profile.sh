#! /bin/bash

# For any functions/scripts to run on startup of a terminal

function mount_sshfs() {
  mkdir -p $2
  if ! grep -qs $2 /proc/mounts; then 
    echo "Mounting $2" && 
    sshfs -o follow_symlinks -o cache=no,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 $1 $2
  fi
}

mount_sshfs ubuntu@nh.coates.io:/home/ubuntu/dev/ ~/mount/cloud
mount_sshfs ubuntu@nh.coates.io:/home/ubuntu/dev/sb-toolkit ~/mount/sb-toolkit
mount_sshfs ubuntu@nh.coates.io:/home/ubuntu/non-dev/ ~/mount/non-dev
