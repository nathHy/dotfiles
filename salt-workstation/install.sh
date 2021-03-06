#!/bin/bash

# Shell out for the entire install
(
  # Installing base salt system
  curl -L https://bootstrap.saltstack.com -o install_salt.sh
  sh install_salt.sh
)

# Be sure to run local
echo -e "master: localhost\nfile_client: local" > /etc/salt/minion
