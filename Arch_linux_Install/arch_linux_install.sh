#!/bin/bash
iwconfig
echo -e "Digite  wifi-menu e sua rede"
echo -e "Exemplo  wifi-menu wlp6s0"
sleep 45
echo -e "Primeiro de Tudo Particione o HD"
echo -e "Crie sda1 500MB para boot"
echo -e "Crie sda2 para raiz /"
echo -e "Crie sda3 512MB ou 3GB para swap / 3GB se quiser o modo hibernar"
sudo fdisk -l
sudo gparted
loadkeys br-abnt2
# nano /etc/locale.gen
# locale-gen && export LANG=pt_BR.UTF-8

#
echo -e "INSTALAÇÃO: SISTEMA BASE E FERRAMENTAS"

echo -e "mount /dev/sda2 /mnt"
echo -e "mount /dev/sda1 /mnt/boot"
echo -e "mkswap /dev/sda3 && swapon /dev/sda3"

sleep 45
sudo mount /dev/sda2 /mnt
cd /mnt
sudo rm -rf boot
cd -
echo "Para UEFI"
echo "A partição /BOOT já tem que estar em FAT32" 
echo mkfs.fat -F32 -n BOOT /dev/sda1

echo "Para formatação em ext4 64Bits"
echo "sudo mke2fs -text4 -O 64bit /dev/sdXnº"

sudo mkdir -p /mnt/boot
sudo mount /dev/sda1 /mnt/boot
sudo mkswap /dev/sda3
sudo swapon /dev/sda3

yes y | sudo pacman -Syy archlinux-keyring antergos-keyring arch-install-scripts btrfs-progs
cd /mnt
sudo rm -rf bin dev etc lib lib64 mnt opt proc root run sbin srv sys tmp usr


echo -e "analise se existe subvolume interferindo"
sudo btrfs subvol list -a /mnt/
sudo btrfs subvol delete /mnt/var/lib/machines
echo

echo
cd -
cd /mnt/var/cache/pacman
sudo mv pkg /mnt/
cd -
cd /mnt
sudo rm -rf var
sudo mkdir -p /mnt/var/cache/pacman/
sudo mkdir -p /mnt/var/lib/machines/
sudo mkdir -p /mnt/proc/bus/usb/
sudo mv pkg /mnt/var/cache/pacman/
cd -
echo

echo
cd /mnt/boot/
sudo rm -rf *
cd -
sudo pacstrap -i /mnt base base-devel wget btrfs-progs
sudo genfstab -U -p /mnt >> /mnt/etc/fstab

echo -e "execute arch_linux_install_chroot.sh"
sudo cp arch_linux_install_chroot.sh /mnt/
sudo cp -rf arch_linux_install_scripts /mnt/
#
sudo arch-chroot /mnt
