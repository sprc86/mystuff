#!/bin/bash
################# BACKUP SCRIPT #####################
chkmnt() {
 
cat /etc/mtab | grep /mnt/usb >/dev/null
 if [ "$?" -eq "0" ]; then
 echo mounted &&
 start_backup
 else
 date >> /home/backup/backup_hist.txt && echo "cannot be mounted, exiting..." >> /home/backup/backup_hist.txt
 exit
 fi
}
 
######################################
 
mount_backup() {
 
echo Mounting disk...
 
mount /mnt/usb
}
 
######################################
 
start_backup() {
 
echo Starting backup... &&
 
echo "::Starting backup::" >> /home/backup/backup_hist.txt && date >> /home/backup/backup_hist.txt
 
find /mnt/usb/ -mtime +60 -type f -exec rm -rf {} \; && tar -cvjf /mnt/usb/`date +%d-%m-%Y.tar.bz2` /files &&
umount /mnt/usb &&
 
echo "::End of backup::" >> /home/backup/backup_hist.txt
date >> /home/backup/backup_hist.txt
echo "-----------------------" >> /home/backup/backup_hist.txt &&
 
echo Backup concluded.
 
}
 
#####################################
 
mount_backup
 
chkmnt
