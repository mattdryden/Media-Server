#!/bin/bash

echo "Create sabnzbd"
#docker stop sabnzbd && docker rm sabznbd
docker run -d --restart unless-stopped --name=sabnzbd -v /etc/localtime:/etc/localtime:ro -v /mnt/data/config/sabnzbd:/config -v /mnt/data/downloads/complete:/complete-downloads -v /mnt/data/downloads/incomplete:/incomplete-downloads -e PGID=1000 -e PUID=1000 -p 8080:8080 -p 9090:9090 linuxserver/sabnzbd
