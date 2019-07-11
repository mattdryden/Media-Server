#!/bin/bash

echo "Create plex"
#docker stop plex && docker rm plex
docker run -d --restart unless-stopped --name=plex --net=host -e VERSION=latest -e PUID=0 -e PGID=0 -v /tmp:/transcode -v /mnt/config/plex:/config -v /mnt/data/media:/data/media linuxserver/plex
