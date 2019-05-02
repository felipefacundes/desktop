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
echo -e "LC_ALL="C"" >> /etc/locale.conf
echo -e "KEYMAP="br-abnt2"" >> /etc/locale.conf
 
cp -rf /etc/locale.conf /etc/vconsole.conf

loadkeys /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz

#  localidade em UTF-8 (padrão universal de caracteres). ISO-8859-1 não é mais utilizado.
echo -e "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen
export LANG=pt_BR.UTF-8
setfont
localectl set-x11-keymap br abnt2
#

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
# Preparar para jogos
pacman -Syy --asdeps egl-wayland eglexternalplatform libglvnd glfw-wayland clinfo opencl-headers opencl-mesa intel-opencl-clang libclc ocl-icd lib32-ocl-icd lib32-libglvnd lib32-glu glu libva-mesa-driver mesa mesa-demos mesa-vdpau lib32-mesa lib32-mesa-demos lib32-mesa-vdpau lib32-smpeg lib32-sdl_ttf lib32-sdl_mixer lib32-sdl_image lib32-sdl2_ttf lib32-sdl2_mixer lib32-sdl2_image lib32-sdl2 lib32-sdl sdl sdl2 sdl2_image sdl2_mixer sdl2_ttf sdl_image sdl_mixer sdl_ttf smpeg lib32-openal gambas3-gb-openal alure openal-examples openal freealut ffnvcodec-headers libxnvctrl xf86-video-nouveau nvidia-cg-toolkit steam-native-runtime lib32-gtk3 vulkan-devel attr lib32-attr fontconfig lib32-fontconfig lcms2 lib32-lcms2 libxml2 lib32-libxml2 libxcursor lib32-libxcursor libxrandr lib32-libxrandr libxdamage lib32-libxdamage libxi lib32-libxi gettext lib32-gettext freetype2 lib32-freetype2 glu lib32-glu libsm lib32-libsm gcc-libs lib32-gcc-libs libpcap lib32-libpcap desktop-file-utils giflib lib32-giflib libpng lib32-libpng gnutls lib32-gnutls libxinerama lib32-libxinerama libxcomposite lib32-libxcomposite libxmu lib32-libxmu libxxf86vm lib32-libxxf86vm libldap lib32-libldap mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils alsa-lib lib32-alsa-lib libxcomposite lib32-libxcomposite mesa lib32-mesa mesa-libgl lib32-mesa-libgl opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libpulse lib32-libpulse libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 gsm ffmpeg samba xf86-video-ati xf86-video-amdgpu xf86-video-intel xf86-video-nouveau libva-intel-driver libva-utils libva-vdpau-driver libva1 libva1-intel-driver vulkan-icd-loader vulkan-intel vulkan-radeon lib32-vulkan-icd-loader lib32-vulkan-intel lib32-vulkan-radeon lib32-vulkan-validation-layers python-olefile python-pyqt5 wine-staging lutris xorg-server xorg-server-devel

# Para Nvidia
pacman -Syy nvidia nvidia-settings lib32-libvdpau libvdpau nvidia-utils opencl-nvidia xsettingsd xsettings-client ffnvcodec-headers libxnvctrl xf86-video-nouveau lib32-nvidia-utils lib32-opencl-nvidia nccl nvidia-cg-toolkit

# Para intel
sudo pacman -S lib32-vulkan-intel lib32-mesa lib32-libva1-intel-driver lib32-libva-intel-driver libva1-intel-driver libva-utils intel-opencl-clang intel-media-driver intel-graphics-compiler intel-gpu-tools intel-gmmlib intel-compute-runtime i810-dri xf86-video-intel vulkan-intel mesa libva-intel-driver iucode-tool intel-ucode intel-tbb

# Para codecs
pacman -S lib32-libcanberra-gstreamer lib32-gstreamer lib32-gst-plugins-good lib32-gst-plugins-base-libs lib32-gst-plugins-base aribb24 gpac gst-libav lame libdvbpsi libiec61883 libmad libmp4v2 libmpeg2 mjpegtools mpg123 twolame xvidcore libquicktime sox libopusenc opus opus-tools opusfile schroedinger aom celt flac libde265 opencore-amr openjpeg2 speex libfishsound gst-plugins-base gst-plugins-base-libs gst-plugins-good gstreamer libcanberra-gstreamer fmt atomicparsley

# Para Plasma kde
pacman -S lightdm-gtk-greeter lightdm kf5-aids kate nomacs gimp krita packagekit packagekit-qt5 discover okular kf5 plasma plasma-wayland-session plasma-mediacenter qtav mpv youtube-dl vlc
systemctl enable lightdm

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
