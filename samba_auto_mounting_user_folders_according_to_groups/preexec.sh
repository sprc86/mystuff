#!/bin/bash
grupos=`groups $1 | cut -d: -f2`
 
if [ ! -d "/srv/files/users/$1" ]; then
 mkdir /srv/files/users/$1;
fi
 
umount /srv/files/users/$1/* >/dev/null
 
chown -R $1:$2 /srv/files/users/$1
 
for i in $grupos;
do
 if [ ! -d "/srv/files/users/$1/$i" ]; then
 mkdir /srv/files/users/$1/$i;
 fi
 
chgrp -R $i /srv/files/users/$1/$i;
 mount -o bind /srv/files/groups/$i /srv/files/users/$1/$i;
done
 
chmod -R 0770 /srv/files/users/$1/
 
exit 0
