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
sudo pacstrap -i /mnt base base-devel btrfs-progs
sudo genfstab -U -p /mnt >> /mnt/etc/fstab

echo -e "execute arch_linux_install_chroot.sh"
sudo cp arch_linux_install_chroot.sh /mnt/
sudo cp -rf arch_linux_install_scripts /mnt/
#
sudo arch-chroot /mnt


###### Agora é dentro do sistema

#!/bin/bash
cd /arch_linux_install_scripts/
cp -rf pacman.conf /etc/
mkdir -p /etc/pacman.d/
cp -rf antergos-mirrorlist /etc/pacman.d/
cp -rf mirrorlist /etc/pacman.d/

cd /

echo -e "LANG=pt_BR.UTF-8" > /etc/locale.conf
echo -e "LOCALE=pt_BR.UTF-8" >> /etc/locale.conf
echo -e "LC_CTYPE="pt_BR.UTF-8"" >> /etc/locale.conf
echo -e "LC_NUMERIC="pt_BR.UTF-8"" >> /etc/locale.conf 
echo -e "LC_TIME="pt_BR.UTF-8"" >> /etc/locale.conf
echo -e "LC_COLLATE="C"" >> /etc/locale.conf 
echo -e "LC_MONETARY="pt_BR.UTF-8"" >> /etc/locale.conf
echo -e "LC_MESSAGES="pt_BR.UTF-8"" >> /etc/locale.conf 
echo -e "LC_PAPER="pt_BR.UTF-8"" >> /etc/locale.conf
echo -e "LC_NAME="pt_BR.UTF-8"" >> /etc/locale.conf
echo -e "LC_ADDRESS="pt_BR.UTF-8"" >> /etc/locale.conf 
echo -e "LC_TELEPHONE="pt_BR.UTF-8"" >> /etc/locale.conf
echo -e "LC_MEASUREMENT="pt_BR.UTF-8"" >> /etc/locale.conf 
echo -e "LC_IDENTIFICATION="pt_BR.UTF-8"" >> /etc/locale.conf
echo -e "LC_ALL=pt_BR" >> /etc/locale.conf
echo -e "CONSOLEFONT="lat1-16"" >> /etc/locale.conf
echo -e "KEYMAP="br-abnt2"" >> /etc/locale.conf
echo -e "UNICODE="1"" >> /etc/locale.conf
echo -e "FONT="lat1-16"" >> /etc/locale.conf
 
cp -rf /etc/locale.conf /etc/vconsole.conf

loadkeys /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz
setfont

Opções alternativas:
LEGACY_CHARSET="iso-8859-1"
FONT="ter-128n"

echo -e "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
echo -e "pt_BR ISO-8859-1" >> /etc/locale.gen

locale-gen

export LANG=pt_BR.UTF-8
sleep 1
#
localectl set-x11-keymap br abnt2

ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc

sleep 15
echo -e "Se possui dual boot com Windows, use"
echo -e "hwclock --systohc --localtime"
echo -e "echo -e "HARDWARECLOCK="localtime"" >> /etc/locale.conf"
echo -e "echo -e "UTC=no" >> /etc/locale.conf"

echo  "HIBERNAÇÃO" HIBERNAR #Hibernação
echo  resume=UUID="swap UUID" em "GRUB_CMDLINE_LINUX_DEFAULT"
echo  "HOOKS" /etc/mkinitcpio.conf inclua "resume" depois de "filesystems"

echo ArchLinux > /etc/hostname 

sleep 2

pacman -S wireless_tools wpa_supplicant wifi-menu dialog
pacman -Syy transmission-cli transmission-gtk net-tools aspell-pt zip ark ufw ufw-extras xfce4-terminal grml-zsh-config zsh zsh-completions zsh-lovers zsh-syntax-highlighting zshdb arandr potrace gimp-dbp gimp-help-pt_br gimp gimp-refocus gimp-plugin-wavelet-denoise gimp-plugin-wavelet-decompose gimp-plugin-mathmap gimp-plugin-lqr gimp-plugin-gmic gimp-plugin-fblur btrfs-progs grub gnome-keyring leafpad pcsx2 elementary-icon-theme arc-gtk-theme gnome-icon-theme-extras icon-naming-utils faenza-icon-theme faience-icon-theme flattr-icon-theme human-icon-theme lxde-icon-theme openstreetmap-map-icons-svn png2ico tangerine-icon-theme arc-icon-theme wireless_tools wpa_supplicant wpa_actiond dialog acpi acpid os-prober xorg-xinit xorg-utils xorg-server glu libtxc_dxtn libva-mesa-driver mesa mesa-demos mesa-libgl mesa-vdpau opencl-mesa lib32-glu lib32-libtxc_dxtn lib32-mesa lib32-mesa-demos lib32-mesa-libgl lib32-mesa-vdpau vulkan-intel vulkan-radeon lib32-vulkan-intel lib32-vulkan-radeon spirv-tools vulkan-extra-layers vulkan-headers vulkan-html-docs vulkan-icd-loader vulkan-trace vulkan-validation-layers lib32-vulkan-icd-loader lib32-vulkan-intel lib32-vulkan-radeon lib32-vulkan-validation-layers pyopencl-headers python-pyopencl python2-pyopencl opencl-headers lib32-ocl-icd ocl-icd libclc xf86-video-nouveau xf86-video-ati xf86-video-amdgpu xf86-video-intel jwm slim archlinux-themes-slim slim-themes networkmanager unrar unzip p7zip lib32-alsa-plugins lib32-alsa-lib zita-alsa-pcmi pulseaudio-alsa alsa-plugins alsa-lib alsa-firmware pavucontrol lib32-libpulse lib32-libcanberra-pulse pulseaudio-lirc pulseaudio-jack pulseaudio-gconf pulseaudio-equalizer pulseaudio-alsa pulseaudio libpulse libcanberra-pulse lib32-gstreamer gstreamer lib32-gst-plugins-good gst-plugins-ugly lib32-gst-plugins-base-libs lib32-gst-plugins-base gstreamermm gst-transcoder gst-editing-services libcanberra-gstreamer gstreamer-vaapi gstreamer gst-python2 gst-python gst-plugins-ugly gst-plugins-good gst-plugins-base-libs gst-plugins-base gst-plugins-bad gst-libav clutter-gst xf86-input-libinput xf86-input-mouse xf86-input-keyboard mpv evince libreoffice-fresh-pt-BR libreoffice-fresh libcdr unoconv testdisk foremost shake python2-lxml uniconvertor trash-cli lib32-smpeg2 lib32-smpeg lib32-sdl_ttf lib32-sdl_mixer lib32-sdl_image lib32-sdl2_ttf lib32-sdl2_mixer lib32-sdl2_image lib32-sdl2 lib32-sdl lua-sdl2 smpeg2 smpeg sdl_ttf sdl_sound sdl_pango sdl_net sdl_mixer sdl_image sdl_gfx sdl2_ttf sdl2_net sdl2_mixer sdl2_image sdl2_gfx sdl2 sdl perl-sdl perl-alien-sdl lib32-openal alure openal-examples openal freealut

# echo # For Catalyst
#
# pacman-key -r 653C3094
# pacman-key --lsign-key 653C3094
# echo # uninstall the open drivers:
# pacman -Rcc lib32-ati-dri ati-dri xf86-video-ati
#
# pacman -S catalyst-hook catalyst-libgl catalyst-utils acpid qt4
# install extra components (optional but needed for gaming):
# pacman -S opencl-catalyst lib32-catalyst-utils lib32-catalyst-libgl lib32-opencl-catalyst

sleep 1
mkinitcpio -p linux
sleep 1
echo
echo -e "Senha do root"
echo
passwd root

echo "Para UEFI"
echo "A partição /BOOT já tem que estar em FAT32" 
echo mkfs.fat -F32 -n BOOT /dev/sda1
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub

echo "Para i386"
grub-install --target=i386-pc --recheck /dev/sda

sleep 5
grub-mkconfig -o /boot/grub/grub.cfg
# pacman -S os-prober

# Nao esqueca de mudar o nome do usuario

echo
echo -e "Nao esqueca de mudar o >> NOME << do usuario"
echo
sleep 7
useradd -m -g users -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input -s /bin/bash maria

echo
echo -e "Nao esqueca de mudar o nome do usuario"
echo
usermod -a -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input maria

echo "senha do usuario"

passwd maria

echo -e "Para notebook"
echo -e "pacman -S xf86-input-synaptics acpi acpid"

# pacman -S xorg-xinit xorg-utils xorg-server

# pacman -S networkmanager
systemctl enable NetworkManager.service
systemctl start NetworkManager.service

echo
#systemctl enable slim.service

echo para tty autologin
mkdir -p /etc/systemd/system/getty@tty1.service.d/
echo -e "[Service]" > /etc/systemd/system/getty@tty1.service.d/override.conf
echo -e "ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/override.conf

echo Nao esqueca de mudar o nome do usuario
echo -e "ExecStart=-/usr/bin/agetty --autologin rfacundes --noclear %I $TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf

mkdir -p /etc/systemd/system/serial-getty@ttyS0.service.d/
echo -e "[Service]" > /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf
echo -e "ExecStart=" >> /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf

echo Nao esqueca de mudar o nome do usuario
echo -e "ExecStart=-/usr/bin/agetty --autologin rfacundes -s %I 115200,38400,9600 vt102" >> /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf

pacman -Syyuu 
#pacman -S $(pacman -Ssq ttf)

echo
sleep 1
echo "Caso queira instalar o plasma5 diga sim"
sleep 20
pacman -U /arch_linux_install_scripts/fakekwin-1.0-1-any.pkg.tar.xz
sleep 1
pacman -S $(cat /arch_linux_install_scripts/plasma.txt)


sleep 1
pacman -U /arch_linux_install_scripts/wine-99.0-1-any.pkg.tar.xz
pacman -U /arch_linux_install_scripts/fakexterm-1.0-1-any.pkg.tar.xz
pacman -U /arch_linux_install_scripts/youtube-dl-gui-1.0-1-any.pkg.tar.xz
pacman -U /arch_linux_install_scripts/hunspell-pt-br-3.2-4-any.pkg.tar.xz

cp naodesligamonitor.conf /etc/X11/xorg.conf.d/

echo -e "edit /etc/sudoers"
sleep 5
nano /etc/sudoers


echo
echo "para intalar cinnamon"
echo "pacman -S cinnamon"
sleep 7


echo
echo para VirtualBox
sleep 20
echo pacman -S virtualbox-host-modules-arch virtualbox-guest-iso virtualbox


echo
echo para fontes, execute: sudo pacman -S $(pacman -Ssq ttf)
echo e depois de intalar, execute: fc-cache
echo para mais fonts instale
sleep 20
echo pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei terminus-font tamsyn-font dina-font adobe-source-han-sans-otc-fonts noto-fonts-emoji noto-fonts-cjk gnu-free-fonts font-bitstream-speedo bdf-unifont adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts
fc-cache


echo
echo
echo para impressoras
sleep 20
pacman -S cups cups-filters cups-pdf cups-pk-helper libcups python-pycups python2-pycups system-config-printer lib32-libcups splix foomatic-db foomatic-db-engine foomatic-db-gutenprint-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds foomatic-db-ppds hplip



systemctl enable cups-browsed.service
systemctl enable org.cups.cupsd.service

echo
echo caso exista Backup, se voce leu em Leia-me.txt para proceder.
sleep 20
echo "pacman -S $(cat /pkgs-backup.txt)"
pacman -S $(cat /pkgs-backup.txt)

cd /
sleep 1
rm -rf /arch_linux_install_scripts
rm arch_linux_install_chroot.sh
echo -e "inslacao finalizada, agora pode sair do chroot (Ctrl + d)"
echo
echo -e "antes de sair da instalacao execute chsh para mudar o shell"
sleep 1
exit

