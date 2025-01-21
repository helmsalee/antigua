#!/bin/sh

apt update 
# apt install -y openssh-server ufw
# ufw allow ssh

cp /opt/var/akeyless/pubkey/ca.pub /etc/ssh/ca.pub

printf '\n\nPasswordAuthentication no\n\n\nTrustedUserCAKeys /etc/ssh/ca.pub\n\n' >> /etc/ssh/sshd_config

ssh-keygen -A -N ""

service ssh start

adduser --disabled-password --gecos "" ubuntu

/sbin/my_init
