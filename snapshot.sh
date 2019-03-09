#!/bin/bash

destination="/mnt"


if [ -d "$destination" ]; then
	cd $destination
	now=$(date +"%d_%m_%Y")
	echo "Creating weekly snapshots..."
	touch / && btrfs sub snapshot -r / $destination/snapshots/@_$(date +"%d_%m_%Y")
	touch /home && btrfs sub snapshot -r /home $destination/snapshots/@home_$(date +"%d_%m_%Y")
	touch /mnt/data && btrfs sub snapshot -r /mnt/data $destination/snapshots/@data_$(date +"%d_%m_%Y")
	touch /mnt/odyssey && btrfs sub snapshot -r /mnt/odyssey $destination/snapshots/@odyssey_$(date +"%d_%m_%Y")
	echo "Created weekly snapshots..."
	
	echo "Deleting older backups..."
	find $destination/snapshots/ -maxdepth 1 -mtime +365 -exec btrfs sub delete {} \;
#	cd $destination/@snapshots/ && find . -maxdepth 1 -exec btrfs sub delete {} \;
	echo "Deleted older backups..."

fi;

