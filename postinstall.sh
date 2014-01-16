#!/bin/bash
sed -i "s|deb https://enterprise.proxmox.com/debian wheezy pve-enterprise|#deb https://enterprise.proxmox.com/debian wheezy pve-enterprise|" "/etc/apt/sources.list.d/pve-enterprise.list"
apt-get update > /dev/null 2>&1
apt-get -y dist-upgrade > /dev/null 2>&1
# patch no licence thank tolaris.com
wget https://raw.github.com/andykimpe/postinstall-proxmox/master/patch -qO- | patch -p0
# patch réseau correctif définir virtio en tant que carte par défaut
wget https://raw.github.com/andykimpe/postinstall-proxmox/master/patch-virtio -qO- | patch -p0
echo "OK"
