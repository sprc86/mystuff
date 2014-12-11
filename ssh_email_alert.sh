#!/bin/bash


#Script to check for IP addresses connecting through SSH out of my admin range. If it's out, then send me an email alert

ADMIN_NETWORK=`echo 10.1.{0..255}.{0..255}`
echo $ADMIN_NETWORK | tr ' ' '\012' > /tmp/nettmp

SSH_IP=`echo $SSH_CLIENT | cut -d " " -f1`






SSH_VALIDATE=`grep -w $SSH_IP$ /tmp/nettmp`

if [ ! $(echo $?) = 0  ]; then

echo "User $LOGNAME logged using IP $SSH_IP"| mailx -s "$HOSTNAME User $LOGNAME connected by SSH" admin@myisp.net

fi
