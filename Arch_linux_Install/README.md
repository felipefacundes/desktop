# Uma forma intuitiva de instalar o ArchLinux, por Felipe Facundes

> Grupo do telegram: https://t.me/winehq_linux
###### Canal do telegram: https://t.me/comandos_linux
###### Site: https://brasiltts.wordpress.com/

#### Primeiro conecte com a internet:

##### Verifique sua interface de rede Wifi:
`iwconfig`
###### Digite:  "wifi-menu e à sua interface de rede"
###### Exemplo:  wifi-menu wlp6s0"

#### "Primeiro de Tudo Particione o HD"
##### "Crie sda1 500MB para boot" - Se for UEFI a partição de BOOT tem que estar em FAT32.
##### "Crie sda2 para raiz /" - Faça uma partição para a raíz do sistema (root)
##### "Crie sda3 512MB ou 3GB para swap / 3GB se quiser o modo hibernar" - pode ser uma tamanho maior, até o mesmo número de sua quantidade de RAM

#### Para particionar use esses comandos:
###### Para checar as partições existentes:
```
sudo blkid
sudo fdisk -l
```
###### Para zerar rapidamente o HD e criar uma nova tabela de partição:
`sudo cfdisk -z /dev/sda`
###### Para apenas criar partições dentro de uma tabela de partição existente:
`sudo cfdisk /dev/sda`
###### Para outro particionador em modo texto, muito eficiente por sinal, na minha opinião o melhor: o `parted`
`sudo parted /dev/sda`
###### Para particionador gráfico caso esteja disponível:
`sudo gparted`
###### Para formatar corretamente cada partição linux. Formate em ext4 64Bits. Exemplo: "sudo mke2fs -text4 -O 64bit /dev/sdXnº"
###### EXT4 é mais compatível com programas DESKTOP: jogos, e etc. Sem dizer que ext4 é um sistema maduro. Que suporta desligamento inadequado.
`sudo mke2fs -text4 -O 64bit /dev/sda1`

##### Para UEFI
###### A partição /boot já tem que estar em FAT32"
`mkfs.fat -F32 -n BOOT /dev/sda1`

#### Para apenas carregar o layout do teclado para abnt2:
```
loadkeys br-abnt2
export LANG=pt_BR.UTF-8
```

## "INSTALAÇÃO: SISTEMA BASE E FERRAMENTAS"

```
sudo mount /dev/sda2 /mnt"
sudo mount /dev/sda1 /mnt/boot"
sudo mkswap /dev/sda3 && sudo swapon /dev/sda3
sudo pacman -Syy archlinux-keyring antergos-keyring arch-install-scripts btrfs-progs
```
#### Para uma reinstalação do sistema sem formatar:
###### Se for reinstalar os pacotes, antes de formatar, faça um backup:

###### O BACKUP PODE SER, PARA UMA LISTA. Para uma reinstalação, baixando os pacotes novamente:
```
sudo pacman -Qnq > lista
sudo pacman -S $(cat lista)
```
##### OU VOCÊ PODE REAPROVEITAR OS PACOTES EXISTENTES DO SEU HD COM ESSE MÉTODO:
```
cd /mnt
sudo rm -rf bin dev etc lib lib64 mnt opt proc root run sbin srv sys tmp usr
```
###### Analise se existe subvolume interferindo:
```
sudo btrfs subvol list -a /mnt/
sudo btrfs subvol delete /mnt/var/lib/machines
```
###### Faça o backup dos pacotes existentes no cache:
```
cd /mnt/var/cache/pacman/
sudo mkdir -p pkg
sudo mv *.pkg.* pkg/
sudo mv pkg /mnt/
cd /mnt
sudo rm -rf var
sudo mkdir -p /mnt/var/cache/pacman/
sudo mkdir -p /mnt/var/lib/machines/
sudo mkdir -p /mnt/proc/bus/usb/
sudo mv pkg /mnt/var/cache/pacman/
cd /mnt/boot/
sudo rm -rf *
```
# FINALMENTE, VAMOS PARA A INSTALAÇÃO:
```
sudo pacstrap -i /mnt grub base wget base-devel btrfs-progs
sudo genfstab -U -p /mnt >> /mnt/etc/fstab
```

### Agora é dentro do sistema (chroot):
`sudo arch-chroot /mnt`

### Para que o sistema inicie corretamente, instalar o GRUB:
```
sudo pacman -S grub bash-completion libusbx sdl bash xz gettext device-mapper freetype2 fuse2 dosfstools efibootmgr libisoburn mtools
mkinitcpio -p linux
```
### Para HDs encryptados, ou seja, somente, se você, deliberadamente, encryptou o seu HD, para tanto, siga esse meu tutorial:

https://github.com/felipefacundes/desktop/tree/master/GRUB

##### "Senha do root"
    passwd root

##### Para sistemas UEFI
###### "A partição /boot já tem que estar em FAT32". Lá em cima foi dito, para formatar a partição boot: sudo mkfs.fat -F32 -n BOOT /dev/sda1
###### Agora prepare o GRUB para o UEFI:
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```
##### Para BIOS (i386-pc)
```
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```
#### Se você possui dual boot com Rwindows, instale o seguinte o "os-prober", depois repita o comando acima, ou o faça antes de executar:

    pacman -S os-prober

##### Crie o seu usuário: Não esqueça de mudar o nome: UsuárioDaSuaPreferência  <-- Para o nome do seu usuário de sua preferência. Sem acentos. Exemplo: joao

```
useradd -m -g users -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input -s /bin/bash UsuárioDaSuaPreferência

usermod -a -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input UsuárioDaSuaPreferência
```
##### Criando uma senha de sua preferência, para o seu usuário:
`passwd UsuárioDaSuaPreferência`

##### Para o XORG - Ou seja, sem ele você não terá interface gráfica, é extremamente importante:
`pacman -S xorg-xinit xorg-utils xorg-server xorg-server-devel`

### Colocando o seu sistema para PORTUGUÊS de forma automática:
```
cd /etc
wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/locale.conf
cd /etc/X11/xorg.conf.d/
wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/arch_linux_install_scripts/00-keyboard.conf
cp -r /etc/locale.conf /etc/vconsole.conf
loadkeys /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz
echo -e "pt_BR.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
export LANG=pt_BR.UTF-8
localectl set-x11-keymap br abnt2
wget https://github.com/felipefacundes/desktop/blob/master/Arch_linux_Install/arch_linux_install_scripts/hunspell-pt-br-3.2-5-any.pkg.tar.xz?raw=true -O hunspell-pt-br-3.2-5-any.pkg.tar.xz
pacman -U hunspell-pt-br-3.2-5-any.pkg.tar.xz
rm hunspell-pt-br-3.2-5-any.pkg.tar.xz
setfont
```
###### Localidade em UTF-8 (padrão universal de caracteres). ISO-8859-1 não é mais utilizado.
###### Caso de erro na opção abaixo: ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
###### Execute antes: rm /etc/localtime
```
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc
```

### Melhor é a opção automática acima descrita. Caso queira, coloque o seu sistema para português MANUALMENTE:
```
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
```
###### Localidade em UTF-8 (padrão universal de caracteres). ISO-8859-1 não é mais utilizado.
###### Caso de erro na opção abaixo: ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
###### Execute antes: rm /etc/localtime
```
echo -e "pt_BR.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
export LANG=pt_BR.UTF-8
localectl set-x11-keymap br abnt2
setfont
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc
```

#### Se possui dual boot com Rwindows, use:
```
hwclock --systohc --localtime
echo -e "HARDWARECLOCK="localtime"" >> /etc/locale.conf"
echo -e "echo -e "UTC=no" >> /etc/locale.conf"
```

#### Para o seu hostname
```
echo ArchLinux > /etc/hostname
```

#### Para ter internet:

```
pacman -S wireless_tools wpa_supplicant dialog network-manager-applet networkmanager
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
```
### Preparar para jogos. Todas às dependências necessárias, inclusive, para aumentar, consideravelmente, a performance em jogos:
```
pacman -Syy --asdeps egl-wayland winetricks wine_gecko wine-nine wine-mono eglexternalplatform libglvnd glfw-wayland clinfo opencl-headers opencl-mesa intel-opencl-clang libclc ocl-icd lib32-ocl-icd lib32-libglvnd lib32-glu glu libva-mesa-driver mesa mesa-demos mesa-vdpau lib32-mesa lib32-mesa-demos lib32-mesa-vdpau lib32-smpeg lib32-sdl_ttf lib32-sdl_mixer lib32-sdl_image lib32-sdl2_ttf lib32-sdl2_mixer lib32-sdl2_image lib32-sdl2 lib32-sdl sdl sdl2 sdl2_image sdl2_mixer sdl2_ttf sdl_image sdl_mixer sdl_ttf smpeg lib32-openal gambas3-gb-openal alure openal-examples openal freealut ffnvcodec-headers libxnvctrl xf86-video-nouveau nvidia-cg-toolkit steam-native-runtime lib32-gtk3 vulkan-devel attr lib32-attr fontconfig lib32-fontconfig lcms2 lib32-lcms2 libxml2 lib32-libxml2 libxcursor lib32-libxcursor libxrandr lib32-libxrandr libxdamage lib32-libxdamage libxi lib32-libxi gettext lib32-gettext freetype2 lib32-freetype2 glu lib32-glu libsm lib32-libsm gcc-libs lib32-gcc-libs libpcap lib32-libpcap desktop-file-utils giflib lib32-giflib libpng lib32-libpng gnutls lib32-gnutls libxinerama lib32-libxinerama libxcomposite lib32-libxcomposite libxmu lib32-libxmu libxxf86vm lib32-libxxf86vm libldap lib32-libldap mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils alsa-lib lib32-alsa-lib libxcomposite lib32-libxcomposite mesa lib32-mesa mesa-libgl lib32-mesa-libgl opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libpulse lib32-libpulse libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 gsm ffmpeg samba xf86-video-ati xf86-video-amdgpu xf86-video-intel xf86-video-nouveau libva-intel-driver libva-utils libva-vdpau-driver libva1 libva1-intel-driver vulkan-icd-loader vulkan-intel vulkan-radeon lib32-vulkan-icd-loader lib32-vulkan-intel lib32-vulkan-radeon lib32-vulkan-validation-layers python-olefile python-pyqt5 wine-staging lutris xorg-server xorg-server-devel
```
### Para driver Nvidia:
```
pacman -Syy nvidia nvidia-settings lib32-libvdpau libvdpau nvidia-utils opencl-nvidia xsettingsd xsettings-client ffnvcodec-headers libxnvctrl xf86-video-nouveau lib32-nvidia-utils lib32-opencl-nvidia nccl nvidia-cg-toolkit
```
### Para driver intel:
```
sudo pacman -Syy lib32-vulkan-intel lib32-mesa lib32-libva1-intel-driver lib32-libva-intel-driver libva1-intel-driver libva-utils intel-opencl-clang intel-media-driver intel-graphics-compiler intel-gpu-tools intel-gmmlib intel-compute-runtime i810-dri xf86-video-intel vulkan-intel mesa libva-intel-driver iucode-tool intel-ucode intel-tbb
```
### Para driver AMD:
```
sudo pacman -S opencl-mesa xf86-video-amdgpu xf86-video-ati vulkan-devel vulkan-radeon lib32-vulkan-icd-loader vulkan-icd-loader lib32-vulkan-validation-layers vulkan-validation-layers
```
### Você poderá habilitar o Radv, para à sua AMDGPU RADEON, para tanto siga esse meu tutorial, super fácil:

https://github.com/felipefacundes/desktop/tree/master/amdgpu

### Para codecs (codecs, são extremamente importante no sistema, para uma melhor harmonia multimia: som e vídeo):
```
pacman -S lib32-libcanberra-gstreamer lib32-gstreamer lib32-gst-plugins-good lib32-gst-plugins-base-libs lib32-gst-plugins-base aribb24 gpac gst-libav lame libdvbpsi libiec61883 libmad libmp4v2 libmpeg2 mjpegtools mpg123 twolame xvidcore libquicktime sox libopusenc opus opus-tools opusfile schroedinger aom celt flac libde265 opencore-amr openjpeg2 speex libfishsound gst-plugins-base gst-plugins-base-libs gst-plugins-good gstreamer libcanberra-gstreamer fmt atomicparsley
```
##### Para notebooks:
```
pacman -S xf86-input-synaptics acpi libinput
echo -e "vm.laptop_mode=1" > /etc/sysctl.conf
```
##### Para deixar o seu computador muito mais rápido, eficiente e mais seguro:
```
echo -e "vm.swappiness=0" > /etc/sysctl.conf
echo -e "net.ipv4.tcp_syncookies=1" > /etc/sysctl.conf
echo -e "net.ipv4.ip_forward=1" > /etc/sysctl.conf
```
### Áreas de trabalho, escolha ou uma, ou outra. Dentre elas são: KDE, Cinnamon, GNOME, DEEPIN, XFCE, MATE
###### Para Plasma kde
```
pacman -S kf5-aids kate nomacs gimp krita packagekit packagekit-qt5 discover okular kf5 plasma plasma-wayland-session plasma-mediacenter qtav mpv youtube-dl vlc sddm
systemctl enable sddm
```

###### Para instalar o Cinnamon:
```
pacman -S cinnamon lightdm-gtk-greeter lightdm gimp viewnior
systemctl enable lightdm
```

###### Para instalar o GNOME:
```
sudo pacman -S gnome gnome-extra gnome-shell gdm gimp viewnior
systemctl enable gdm
```
###### Para instalar o DEEPIN:
```
pacman -S deepin deepin-extra lightdm-gtk-greeter lightdm gimp viewnior
systemctl enable lightdm
```
###### Para instalar o XFCE:
```
sudo pacman -S xfce4 xfce4-goodies lightdm-gtk-greeter lightdm gimp viewnior
systemctl enable lightdm
```
###### Para instalar o MATE:
```
sudo pacman -S mate mate-extra lightdm-gtk-greeter lightdm gimp viewnior
systemctl enable lightdm
```
###### O KDE usa 800MB de RAM, o  Cinnamon e o GNOME usam 750MB de RAM, o DEEPIN usa 700MB de RAM, o XFCE e o MATE usam 650MB de RAM
###### Para instalar o XMATECE, uma interface tão bonita e completa quanto o MATE, mas que usa menos de 300MB de RAM, siga esse tutorial:

https://github.com/felipefacundes/xmatece

### Para tty autologin - aqui é para autologin, sem precisar de DE (Desktop Manager), como: lightdm, GDM, SDDM e etc:
```
mkdir -p /etc/systemd/system/getty@tty1.service.d/
echo -e "[Service]" > /etc/systemd/system/getty@tty1.service.d/override.conf
echo -e "ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/override.conf
```
###### Não esqueça de mudar o nome do UsuárioDaSuaPreferência  <-- Para o nome do seu usuário de sua preferência. Sem acentos. Exemplo: joao

```
echo -e "ExecStart=-/usr/bin/agetty --autologin UsuárioDaSuaPreferência --noclear %I $TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf
mkdir -p /etc/systemd/system/serial-getty@ttyS0.service.d/
echo -e "[Service]" > /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf
echo -e "ExecStart=" >> /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf
```
###### Não esqueça de mudar o nome do UsuárioDaSuaPreferência  <-- Para o nome do seu usuário de sua preferência. Sem acentos. Exemplo: joao
```
echo -e "ExecStart=-/usr/bin/agetty --autologin UsuárioDaSuaPreferência -s %I 115200,38400,9600 vt102" >> /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf
```
### Para instalar o LibreOffice:
    pacman -S libreoffice-fresh libreoffice-fresh-pt-br

### Se você não curte o seu monitor, desligando, ou esmaecendo a tela (tela preta), faça o seguinte:
```
cd /etc/X11/xorg.conf.d/
wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/arch_linux_install_scripts/naodesligamonitor.conf
```
### Opcional. Para instalar fontes TrueType para aumentar o número de fontes no sistema, pesquise e instale às que preferir:

    pacman -Ss ttf

###### Se preferir instalar todas as fontes disponíveis no repositório, tudo de uma vez, sem ao menos pesquisar:
```
pacman -S $(pacman -Ssq ttf)
fc-cache
```

###### Ou também você poderá instalar essas fontes:

```
pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei terminus-font tamsyn-font dina-font adobe-source-han-sans-otc-fonts noto-fonts-emoji noto-fonts-cjk gnu-free-fonts font-bitstream-speedo bdf-unifont adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts
fc-cache
```
###### Totalmente opcional, para virtualbox execute:

`pacman -S virtualbox-host-modules-arch virtualbox-guest-iso virtualbox`

### Para instalar às impressoras:

```
pacman -S cups cups-filters cups-pdf cups-pk-helper libcups python-pycups python2-pycups system-config-printer lib32-libcups splix foomatic-db foomatic-db-engine foomatic-db-gutenprint-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds foomatic-db-ppds hplip
systemctl enable cups-browsed.service
systemctl enable org.cups.cupsd.service
```

##### Para HIBERNAÇÃO do sistema. Exemplo:
```
blkid
nano /etc/default/grub
```
###### Em resume=UUID  altere conforme o exemplo abaixo e coloque conforme, o resultado do comando blkid, somente a parte do UUID
```
resume=UUID="swap UUID" em "GRUB_CMDLINE_LINUX_DEFAULT="
```
###### Em /etc/mkinitcpio.conf inclua em "HOOKS=" "resume" logo depois de "filesystems"
###### Depois de tudo alterado, rode os comandos para que o sistema passe a hibernar:
```
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -p linux
```
##### Se você usa arquivo de troca de paginação - arquivo para memória virtual (swapfile) e quer que o sistema hiberne, siga o tutorial abaixo:
https://github.com/felipefacundes/desktop/tree/master/swapfile-hibernate

##### Para ter um excelente suporte de acessibilidade, como TTS, siga o tutorial do meu site:

https://brasiltts.wordpress.com/

##### Para você mudar o nome da sua distribuição, caso queira:

`nano /etc/lsb-release`

### Para que você use o famoso repositório do AUR, quando não tiver o programa desejado no repositório oficial, instale o yay, para usar o repositório do AUR:
```
wget https://github.com/felipefacundes/desktop/blob/master/Arch_linux_Install/arch_linux_install_scripts/yay-9.2.0-1-x86_64.pkg.tar.xz?raw=true -O yay-9.2.0-1-x86_64.pkg.tar.xz
pacman -U yay-9.2.0-1-x86_64.pkg.tar.xz
rm yay-9.2.0-1-x86_64.pkg.tar.xz
```
### Para você que veio do UBUNTU ou DEBIAN, e está acostumado com o comando apt-get, use:
`bash <(curl -s https://raw.githubusercontent.com/felipefacundes/apt-get-pacman/master/iniciorapido.sh)`
#
###### Para o driver obsoleto e incompatível com os kernels atuais: Catalyst

###### pacman-key -r 653C3094
###### pacman-key --lsign-key 653C3094
###### echo # uninstall the open drivers:
###### pacman -Rcc lib32-ati-dri ati-dri xf86-video-ati
###### pacman -S catalyst-hook catalyst-libgl catalyst-utils acpid qt4
###### install extra components (optional but needed for gaming):
###### pacman -S opencl-catalyst lib32-catalyst-utils lib32-catalyst-libgl lib32-opencl-catalyst
#

```
                    ,cldxOxoc:;,
               ,;:okKNXKK0kO0Okxddol:;,
        ,;codxkkOKXKko:'......,;clx0KXXOxol:,
   :lodxxdololc:,'..................,cdk00kxkOkxoc,
  ;XOxdl:,..  .......................... ..,;lx0XNx
  lX0c      ..;dddddooooollll,............     .0XO'
  oKK;    ....0NNXXKKK00OOOkx'.............     x0x,
  lXX;   ....,WWNNNKdddoooooc.'..............   okk,
  cXW:  .....xWWWWWl''''''''''''''............  dd0,
  :OWo ......NMMMMWOkkkkxxxc''''''''.......... .kxK'
  ,dKk .....lWWWWMMMWWWNNNX:,''''''''...........KOx'
  ,lk0......ONNNWWddddddddo,,,,,''''''.........lNOc'
  'cdk;....;KXXXNO''',,,,,,,ddddoooolllccc:....0WO,'
  ',ddd....o0KKKXl'',,,,,,,lWWNNNXXKKK00OOc...,0Xx'
   'llo;...kO00K0,'',,,,,,,0MWWWN0OOOkkkxx'...oxK;'
   ',xcl..,lloool''',,,,,,:WWMMMX''''''......cxko'
    ':x:c......''''''',,,,xNWWWM0dddddool...:00O,'
     'ld::.......'''''',,,KNNNWWWMMMWWWWx..;XXK;'
      'dd::.......'''''''lKXXNN0kkOOOkkk;.;0KK;'
       'ox::........'''''x0KKKX;'''......lK0k;'
        'cx:c,........'.,OO00KO........'kN0o,'
         ',dllc'........lkkOO0c.......:KNk:'
           ':lldc.......oodddd'.....,d0Oc,'
            ',:ldxl'..............'lxxo;,'
              ',;lx0x;..........,cldo:'
               '',cxXXd,....,cdxkd:'
                   ',;o0N0odkkkk,'
                     ',;lxdl:,'

 Tutorial by:
 ___    _             ___                     _
| __|__| (_)_ __  ___| __|_ _ __ _  _ _ _  __| |___ ___
| _/ -_) | | '_ \/ -_) _/ _` / _| || | ' \/ _` / -_|_-<
|_|\___|_|_| .__/\___|_|\__,_\__|\_,_|_||_\__,_\___/__/
           |_|

┏┓
┃┃╱╲ nesta
┃╱╱╲╲ casa
╱╱╭╮╲╲ todos
▔▏┗┛▕▔ usam
╱▔▔▔▔▔▔▔▔▔▔╲
LINUX
╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔
--------------------------
```
