#!/bin/bash

mkdir /var/run/sshd

# create a centos user
PASS=centos
mkdir -p /home/centos
useradd -G wheel centos
echo "centos:$PASS" | chpasswd
chown -R centos.centos /home/centos
# workaround for dbus
dbus-uuidgen > /var/lib/dbus/machine-id
# start services
/usr/bin/supervisord -c /supervisord.conf
# open a shell
/bin/bash
