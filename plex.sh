#!/bin/bash

echo "Create plex"
#docker stop plex && docker rm plex
docker run -d --restart unless-stopped --name=plex -p 32400:32400/tcp -p 32400:32400/udp -e VERSION=latest -e PUID=0 -e PGID=0 -v /tmp:/transcode -v /mnt/data/plex:/config -v /mnt/data/media:/data/media -h avalon linuxserver/plex
