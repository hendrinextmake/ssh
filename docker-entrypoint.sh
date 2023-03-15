#!/bin/bash
cat /home/sshuser/.ssh/id_ed25519.pub > /home/sshuser/.ssh/authorized_keys
sudo chmod 0700 /home/sshuser
sudo chmod 0700 /home/sshuser/.ssh
sudo chmod 0600 /home/sshuser/.ssh/authorized_keys
chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys
rm -f /home/sshuser/.ssh/id_ed25519.pub
