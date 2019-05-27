#!/bin/bash

echo "Create plaxt"
#docker stop radarr && docker rm radarr
docker run -d --restart unless-stopped --name lidarr --link=sabnzbd:sabnzbd -p 8686:8686 -e PUID=1000 -e PGID=1000 -v /dev/rtc:/dev/rtc:ro -v /mnt/config/lidarr:/config -v /mnt/data/media/music/:/music -v /mnt/data/downloads/complete/:/complete-downloads linuxserver/lidarr

docker run -d  --name=plaxt  --restart unless-stopped  -v /mnt/config/plaxt/:/app/keystore  -e TRAKT_ID=dbe0c8a36c428943ca2d8b19d4d1850a50c1dc09028b91ad823e594c8d4b95f2  -e TRAKT_SECRET=c3896415a356f9cf7368231dcc4de22df9b7b85de0f9e6aee552c66de309a742  -e ALLOWED_HOSTNAME=avalon  -p 8000:8000  xanderstrike/goplaxt:latest