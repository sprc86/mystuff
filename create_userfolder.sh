#!/bin/bash

#Script to automate the user creation in the samba server for my actual workplace.

echo -n "Please enter the new employee username: "
read username

echo "setting up its ownership and 700 permissions..."



if [ ! -d "/mnt/storage/personal/$username" ]; then

mkdir /mnt/storage/personal/$username &&

chown $username:"domain users" /mnt/storage/personal/$username &&

mkdir /mnt/storage/personal/$username &&

echo "sucessfully created user personal folder and it's permissions!"

else

echo "user folder already exist!"

fi
