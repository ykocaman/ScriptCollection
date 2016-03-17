#!/bin/bash

#yedek alınacak yer harici disk ise mount edilmeli
#udisks --mount /dev/sdb1

#backup dosyalarının tutulacagi dizin
backupdir=`/media/content/local_backup/`

#3 günden büyük olan dosyaları temizle
find $backupdir* -type d -mtime +3 -exec rm -rf {} \;

# Yil-Ay-Gun formatında klasor olustur
date=`date +"%Y-%m-%d"`
mkdir $backupdir$date

#home ve etc dizini sadece yedekleniyor
tar -cvpzf  $backupdir$date/home.tar.gz --one-file-system /home/user/
tar -cvpzf  $backupdir$date/etc.tar.gz --one-file-system /etc/

#cron islemi root olarak calistirildigi icin yeni dosyalarin sahipligi tekrar kullaniciya aktariyor
chown user:user $backupdir$date -R
