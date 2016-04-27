#!/usr/bin/bash -x

# Qemu guest agent and virtio setup as per
# https://wiki.archlinux.org/index.php/QEMU#Preparing_an_.28Arch.29_Linux_guest

pacman -S --noconfirm rsync

/usr/bin/pacman -S --noconfirm qemu-guest-agent
/usr/bin/systemctl enable qemu-ga.service

/usr/bin/sed -i 's/MODULES=\"\"/MODULES=\"virtio virtio_blk virtio_pci virtio_net\"/' /etc/mkinitcpio.conf
/usr/bin/mkinitcpio -p linux
