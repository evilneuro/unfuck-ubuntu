#!/usr/bin/env bash

if [ -s /etc/default/motd-news ]; then sed -i 's/ENABLED=1/ENABLED=0/' /etc/default/motd-news; fi
if [ "$(dpkg -l ubuntu-advantage-tools | grep ^ii)" != "" ]; then sudo pro config set apt_news=false; fi
for SYSTEMD_UNIT in apt-news esm-cache
do
    if [ "$(systemctl list-unit-files | grep -w ^${SYSTEMD_UNIT})" != "" ]; then sudo systemctl mask ${SYSTEMD_UNIT}.service; fi
done