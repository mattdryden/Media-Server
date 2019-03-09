#!/bin/bash

echo "Create sabnzbd"
<<<<<<< HEAD
docker stop sabnzbd && docker rm sabznbd
docker run -d --restart always --name=sabnzbd -v /etc/localtime:/etc/localtime:ro -v ~/config/sabnzbd:/config -v ~/downloads/complete:/complete-downloads -v ~/downloads/incomplete:/incomplete-downloads -e PGID=1000 -e PUID=1000 -p 8080:8080 -p 9090:9090 linuxserver/sabnzbd

echo "Create sonarr"
docker stop sonarr && docker rm sonarr
docker run -d --restart always --name sonarr --link=sabnzbd:sabnzbd -p 8989:8989 -e PUID=1000 -e PGID=1000 -v /dev/rtc:/dev/rtc:ro -v ~/config/sonarr:/config -v /media/plex/TV\ Shows:/tv -v ~/downloads/complete:/complete-downloads linuxserver/sonarr

echo "Create couchpotato"
docker stop couchpotato && docker rm couchpotato
docker run -d --restart always --name=couchpotato --link=sabnzbd:sabnzbd -v /etc/localtime:/etc/localtime:ro -v ~/config/couchpotato:/config -v ~/downloads:/downloads -v /media/plex2/Films:/movies -e PGID=0 -e PUID=0 -p 5050:5050 linuxserver/couchpotato

echo "Create plex"
docker stop plex && docker rm plex
#docker run -d --restart always --name=plex --net=host -e VERSION=plexpass -e PUID=0 -e PGID=0 -v ~/tmp:/transcode -v ~/config/plex:/config -v /media/plex/TV\ Shows:/data/tvshows -v /media/plex2/Films:/data/movies linuxserver/plex
docker run -d --restart always --name=plex --net=host -e VERSION=latest -e PUID=0 -e PGID=0 -v ~/tmp:/transcode -v ~/config/plex:/config -v /media/plex/TV\ Shows:/data/tvshows -v /media/plex2/Films:/data/movies linuxserver/plex
=======
docker stop sabnzbd && docker rmi -f sabnzbd
docker run -d --restart always --name=sabnzbd -v /etc/localtime:/etc/localtime:ro -v ~/config/sabnzbd:/config -v ~/downloads/complete:/complete-downloads -v ~/downloads/incomplete:/incomplete-downloads -e PGID=1000 -e PUID=1000 -p 8080:8080 -p 9090:9090 linuxserver/sabnzbd

echo "Create sonarr"
docker stop sonarr && docker rmi -f sonarr
docker run -d --restart always --name sonarr --link=sabnzbd:sabnzbd -p 8989:8989 -e PUID=1000 -e PGID=1000 -v /dev/rtc:/dev/rtc:ro -v ~/config/sonarr:/config -v /media/plex/TV\ Shows:/tv -v ~/downloads/complete:/complete-downloads linuxserver/sonarr

echo "Create couchpotato"
docker stop couchpotato && docker rmi -f couchpotato
docker run -d --restart always --name=couchpotato --link=sabnzbd:sabnzbd -v /etc/localtime:/etc/localtime:ro -v ~/config/couchpotato:/config -v ~/downloads:/downloads -v /media/plex2/Films:/movies -e PGID=0 -e PUID=0 -p 5050:5050 linuxserver/couchpotato

echo "Create plex"
docker stop plex && docker rmi -f plex
#docker run -d --restart always --name=plex --net=host -e VERSION=plexpass -e PUID=0 -e PGID=0 -v ~/tmp:/transcode -v ~/config/plex:/config -v /media/plex/TV\ Shows:/data/tvshows -v /media/plex2/Films:/data/movies linuxserver/plex
docker run -d --restart always --name=plex --net=host -e VERSION=latest -e PUID=0 -e PGID=0 -v ~/tmp:/transcode -v ~/config/plex:/config -v /media/plex/TV\ Shows:/data/tvshows -v /media/plex2/Films:/data/movies linuxserver/plex

echo "Create docker registry"
docker stop registry && docker rmi -f registry
docker run -d -p 5000:5000 --restart=always --name registry -v ~/config/docker:/var/lib/registry registry:2
>>>>>>> 7122da291917a9d8ae34d024c66013f7629db56a

