#!/bin/bash
# disable depot proxmox entrprise
sed -i "s|deb https://enterprise.proxmox.com/debian wheezy pve-enterprise|#deb https://enterprise.proxmox.com/debian wheezy pve-enterprise|" "/etc/apt/sources.list.d/pve-enterprise.list"
# update repos list
apt-get update
# upgrade system
apt-get -y dist-upgrade
# install patch
apt-get -y install patch
# patch no licence thank tolaris.com
wget https://raw.github.com/andykimpe/postinstall-proxmox/master/patch -qO- | patch -p0
# patch réseau correctif définir virtio en tant que carte par défaut
wget https://raw.github.com/andykimpe/postinstall-proxmox/master/patch-virtio -qO- | patch -p0
echo "OK"
echo add openvz template
# install axel downloading accerator
apt-get -y install axel
cd /var/lib/vz/template/cache
axel http://download.openvz.org/template/precreated/centos-6-x86_64.tar.gz
# after please wait
