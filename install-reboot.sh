#!/bin/bash
if [ -f /var/run/reboot-required ]; then
  sudo reboot -r "Rebooting to install latest updates"
fi

