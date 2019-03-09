#!/bin/bash

echo "Create sonarr"
#docker stop sonarr && docker rm sonarr
docker run -d --restart unless-stopped --name sonarr --link=sabnzbd:sabnzbd -p 8989:8989 -e PUID=1000 -e PGID=1000 -v /dev/rtc:/dev/rtc:ro -v /mnt/data/config/sonarr:/config -v /mnt/data/media/TV/:/tv -v /mnt/data/downloads/complete:/complete-downloads linuxserver/sonarr
