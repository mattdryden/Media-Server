#!/bin/sh

REPOSITORY=/mnt/odyssey/borg

#Bail if borg is already running, maybe previous run didn't finish
if pidof -x borg >/dev/null; then
    echo "Backup already running"
    exit
fi


# Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE='discovery'
# or this to ask an external program to supply the passphrase:
export BORG_PASSCOMMAND='pass show backup'

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

# Backup all of /home and /var/www except a few
# excluded directories
borg create -v --stats $REPOSITORY::'{hostname}-home-{now:%Y-%m-%d}' /home/matt
borg create -v --stats $REPOSITORY::'{hostname}-config-{now:%Y-%m-%d}' /mnt/data/config

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}-home-' --keep-daily=7 --keep-weekly=4 --keep-monthly=6
borg prune -v --list $REPOSITORY --prefix '{hostname}-config-' --keep-daily=7 --keep-weekly=4 --keep-monthly=6

# Reset perms

chown -R borg:borg /mnt/odyssey/borg
