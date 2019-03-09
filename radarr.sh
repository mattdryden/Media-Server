#!/bin/bash

echo "Create radarr"
#docker stop radarr && docker rm radarr
docker run -d --restart unless-stopped --name radarr --link=sabnzbd:sabnzbd -p 7878:7878 -e PUID=1000 -e PGID=1000 -v /dev/rtc:/dev/rtc:ro -v /mnt/data/config/radarr:/config -v /mnt/data/media/Movies/:/movies -v /mnt/data/downloads/complete:/complete-downloads linuxserver/radarr
