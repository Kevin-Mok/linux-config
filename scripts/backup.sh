#!/bin/bash

mount_dir="/run/media/kevin"
# Backup destination
case $1 in
	nzxt )
		backup_dest="$mount_dir/backup-hd/nzxt"
		# backup_dest="$mount_dir/backup-usb/nzxt"
		;;
	x1 )
		backup_dest="$mount_dir/laptop-backup"
		;;
esac
exclude_dirs_list="/home/kevin/linux-config/txt/exclude-dirs-backup.txt"
exclude_dirs_list_full="/home/kevin/linux-config/txt/exclude-dirs-backup-full.txt"

case $2 in
	tar )
		# Labels for backup name
		distro="arch"
		datetime=$(date "+%m.%d-%H.%M")
		backup_file="$backup_dest/tar/$datetime-$distro.tar.gz"

		sudo tar -czpvf "$backup_file" --exclude-from="$exclude_dirs_list" /
		;;
	full )
		sudo rsync -PraAX --exclude-from="$exclude_dirs_list_full" / "$backup_dest/full"
		sudo rsync -PraAX /home "$backup_dest/full/home"
		# echo rsync -PraAX --exclude-from="$exclude_dirs_list_full" / "$backup_dest/full"
		# echo rsync -PraAX /home "$backup_dest/full/home"
esac
