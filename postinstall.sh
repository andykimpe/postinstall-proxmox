#!/bin/bash
# disable depot proxmox entrprise
sed -i "s|deb https://enterprise.proxmox.com/debian|#deb https://enterprise.proxmox.com/debian|" "/etc/apt/sources.list.d/pve-enterprise.list"
# no return message of apt
export DEBIAN_FRONTEND=noninteractive
# update repos list
apt-get update
# upgrade system
apt-get -y dist-upgrade
# install patch
apt-get -y install patch
# patch no licence thank andykimpe for update tested 4.4 working
wget https://raw.github.com/andykimpe/postinstall-proxmox/master/patch -qO- | patch -p0
# patch network défine virtio on default network card not updated
wget https://raw.github.com/andykimpe/postinstall-proxmox/master/patch-virtio -qO- | patch -p0
systemctl stop pveproxy
systemctl start pveproxy
echo "OK"
exit
