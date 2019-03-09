#!/bin/bash

echo "Create pihole"
#docker stop pihole && docker rm pihole

docker run -d --restart unless-stopped    --name pihole     -p 53:53/tcp -p 53:53/udp     -p 80:80     -p 443:443     -e TZ="Europe/London"     -v "/mnt/data/config/pihole/pihole/:/etc/pihole/"     -v "/mnt/data/config/pihole/dnsmasq.d/:/etc/dnsmasq.d/"     --dns=127.0.0.1 --dns=1.1.1.1     --restart=unless-stopped     pihole/pihole:latest
