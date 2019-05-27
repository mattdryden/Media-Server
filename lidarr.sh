#!/bin/bash

echo "Create radarr"
#docker stop radarr && docker rm radarr
docker run -d --restart unless-stopped --name lidarr --link=sabnzbd:sabnzbd -p 8686:8686 -e PUID=1000 -e PGID=1000 -v /dev/rtc:/dev/rtc:ro -v /mnt/config/lidarr:/config -v /mnt/data/media/music/:/music -v /mnt/data/downloads/complete/:/complete-downloads linuxserver/lidarr