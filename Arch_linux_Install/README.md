# Uma forma intuitiva de instalar o ArchLinux

> by Felipe Facundes

##### Grupo Telegram: [https://t.me/winehq_linux](https://t.me/winehq_linux)
##### Canal Telegram: [https://t.me/s/PlayOnGit](https://t.me/s/PlayOnGit)
##### Site: [https://linuxgamers.github.io/](https://linuxgamers.github.io/)

<br></br>

---
## Etapa 01 - Conectar-se a Internet.
---
<br>

#### Verifique sua interface de rede Wifi:
`iwconfig`

#### Entre na interface do IWD:
`iwctl`

#### Dentro da interface digite os seguintes comandos:

 - `device list`

#### Para iniciar a busca da rede supondo que seu dispositivo seja `wlan0`

 - `station wlan0 scan`

#### Para listar as redes (SSID) disponíveis

 - `station wlan0 get-networks`

#### Finalmente, conectando-se à Internet

 - `station wlan0 connect SSID`

<br>

---
## Etapa Opcional - Backup - Para uma reinstalação do sistema sem formatar
---
<br>

#### O BACKUP PODE SER, PARA UMA LISTA.
<br>

 - Para uma reinstalação, baixando os pacotes novamente:

##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

 1. - `pacman -Qnq | tee lista &>/dev/null`
 2. - `pacman -S $(cat lista)`

<br>

#### OU VOCÊ PODE REAPROVEITAR OS PACOTES EXISTENTES DO SEU HD COM ESSE MÉTODO:
<br>

##### Leia. Na linha abaixo, contém `3` linhas de comando, obedeça cada comando:
#### Primeiro monte a partição root `(raíz)` `(/)`
 
 1. - `mount /dev/sdX /mnt`
 2. - `cd /mnt`
 3. - `rm -rf bin dev lib lib64 mnt opt proc root run sbin srv sys tmp usr`

#### Analise se existe subvolume interferindo:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

 1. - `btrfs subvol list -a /mnt/`
 2. - `btrfs subvol delete /mnt/var/lib/machines`

#### Faça o backup dos pacotes existentes no cache:
##### Leia. Na linha abaixo, contém `13` linhas de comando, obedeça cada comando:

 1. - `cd /mnt/var/cache/pacman/pkg/`
 2. - `mkdir pkg_bkp`
 3. - `mv *.pkg.* pkg_bkp/`
 4. - `mv pkg_bkp /mnt/`
 5. - `cd /mnt`
 6. - `rm -rf var`
 7. - `mkdir -p /mnt/var/cache/pacman/`
 8. - `mkdir -p /mnt/var/lib/machines/`
 9. - `mkdir -p /mnt/proc/bus/usb/`
 10. - `mv pkg_bkp pkg`
 11. - `mv pkg /mnt/var/cache/pacman/`
 12. - `cd /mnt/boot/`
 13. - `rm -rf *`

<br>

---
## Etapa 02 - Particionamento e Formatação:
---
<br>

### Particione o HD
<br>

#### Crie `"sda1"` 250MB para boot - Se for `UEFI` a partição de `BOOT` tem que estar em `FAT`.
#### Crie `"sda2"` uma partição para a raiz `(/)` do sistema `(root)` de no mínimo 30GB.
#### Crie `"sda3"` 512MB ou 3GB para swap / `3GB se quiser o modo hibernar` - pode ser um tamanho maior, até ao mesmo número de sua RAM

<br>

#### Para particionar use esses comandos:
#### Para checar as partições existentes:

 1. - `blkid`
 2. - `fdisk -l`

#### Para zerar rapidamente o HD e criar uma nova tabela de partição:
`cfdisk -z /dev/sda`

#### Para apenas criar partições dentro de uma tabela de partição existente:
`cfdisk /dev/sda`

#### Para outro particionador em modo texto, muito eficiente por sinal, na minha opinião o melhor: `parted`
`parted /dev/sda`

#### Para formatar corretamente cada partição linux. Formate em ext4 64Bits ou XFS. 
#### Exemplo:  
 1. - `mke2fs -text4 -O 64bit /dev/sdX`

###### Ou
 2. - `mkfs.xfs /dev/sdX`

<br>

#### `EXT4` é mais `compatível` com programas DESKTOP: jogos, e etc. Sem dizer que ext4 é um sistema maduro. Que suporta desligamento inadequado.
#### Por outro lado `XFS` é o sistema de arquivos mais rápido com suporte adequado para SSDs. Igualmente, é um sistema maduro com Journaling.

 1. - `mke2fs -text4 -O 64bit -L ROOT /dev/sdX`

###### Ou

 2. - `mkfs.xfs -L ROOT /dev/sdX`

<br>

### Para `UEFI`:

<br>

#### A partição `/boot` ou `/boot/EFI` já tem que estar em `FAT-12/16/32`
#### Vale ressaltar que uma partição `FAT12` tem que ter no mínimo `1M`. Já a `FAT16` com no mínimo `9M` e `FAT32` com no mínimo `33M`
#### Se for usar como `/boot` tem que ter no mínimo `250M` como `/boot/EFI` é o minimo indicado acima correspondente ao tipo da partição FAT escolhida.

<br>

#### Use `-F12` para FAT12. Exemplo:
 - Use: `-s2` para reduzir o tamanho do cluster e tornar a partição legível pelo UEFI.
 - `mkfs.fat -F16 -s2 -n EFI /dev/sdX`

<br>

#### Exemplo de FORMATAÇÃO

#### A opção `-L` atribui rótulos às partições, o que ajuda a consultá-las mais tarde através de `/dev/disk/by-label` sem ter que se lembrar de seus números. Agora, monte suas partições:

```
mkfs.fat -F16 -s2 -n EFI /dev/sd1           # <‐ EFI partição, Obrigatória para sistemas EFI
mke2fs -text4 -O 64bit -L BOOT /dev/sda2    # <‐ BOOT partição, é Opicional, porém é uma boa prática usar partição BOOT separada em caso de erros
mkfs.xfs -L ROOT /dev/sda3                  # <‐ ROOT partição
mkfs.xfs -L HOME /dev/sda4                  # <‐ HOME partição, Opicional.
mkswap -L SWAP /dev/sda5                    # <‐ SWAP partição, Opcional.
```

#### EXEMPLO DE MONTAGEM DA TABELA DE PARTIÇÃO, CONFORME FORMATAÇÃO ACIMA:
##### Leia. Na linha abaixo, contém `7` linhas de comando, obedeça cada comando:

 1. - `swapon /dev/sda5`                    # <- Ativar SWAP
 2. - `mount /dev/sda3 /mnt`                # <- Montagem da Partição ROOT
 3. - `mkdir -p /mnt/home`                  # <- Criar pasta home
 4. - `mount /dev/sda4 /mnt/home`           # <- Montar Partição HOME
 5. - `mkdir -p /mnt/boot/EFI`              # <- Criar pasta boot e EFI
 6. - `mount /dev/sda2 /mnt/boot`           # <- Montar a Partição BOOT
 7. - `mount /dev/sda1 /mnt/boot/EFI`       # <- Montar a Partição EFI

<br>

---
## Etapa 03 - FINALMENTE, VAMOS PARA A INSTALAÇÃO:
---
<br>

### Para apenas carregar o layout do teclado para abnt2:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

 1. - `loadkeys br-abnt2`
 2. - `export LANG=pt_BR.UTF-8`
 
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

 1. - `pacstrap -i /mnt grub base wget base-devel linux mkinitcpio nano`
 2. - `genfstab -U -p /mnt >> /mnt/etc/fstab`

<br>

### Agora é dentro do sistema (chroot):
`arch-chroot /mnt`

### Para HDs encryptados, ou seja, somente, se você, deliberadamente, encryptou o seu HD, para tanto, siga esse LINK do meu tutorial:

[https://github.com/felipefacundes/desktop/tree/master/GRUB](https://github.com/felipefacundes/desktop/tree/master/GRUB)

<br>

### Para que o sistema inicie corretamente, instalar o GRUB:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

 1. - `pacman -S grub ntfs-3g fuse2 dosfstools efibootmgr exfat-utils mtools gpart lzop udftools fuseiso libisoburn sdl xz gettext device-mapper bash-completion bash freetype2 xfsprogs polkit`

 2. - `mkinitcpio -P`

<br>

### Para sistemas `UEFI`

<br>

#### A partição `/boot` ou `/boot/EFI` já tem que estar em `FAT-12/16/32`. Como já mencionado. 
`mkfs.fat -F16 -s2 -n EFI /dev/sdX`

<br>

#### Agora prepare o GRUB para UEFI:
 - #### Se a partição EFI for separada e montada na pasta `/boot/EFI`:
`grub-install --verbose --recheck --target=x86_64-efi --force --efi-directory=/boot/EFI --bootloader-id=ARCH --removable`

 - #### Ou se toda a partição BOOT estiver em FAT e montada em `/boot`:
`grub-install --verbose --recheck --target=x86_64-efi --force --efi-directory=/boot --bootloader-id=ARCH --removable`

<br>

### Para BIOS (i386-pc):
 - Use `--force` se a tabela de partição for GPT
 - `grub-install --verbose --recheck --target=i386-pc --force /dev/sda`

<br>

### Finalize com:
`grub-mkconfig -o /boot/grub/grub.cfg`

<br>

### Se você possui dual boot com Rwindows, instale o seguinte o "os-prober", depois repita o comando acima, ou o faça antes de executar:
`pacman -S os-prober`

<br>

### "Senha do root"
`passwd root`

<br>

### Crie o seu usuário: Não esqueça de mudar o nome: UsuárioDaSuaPreferência  <-- Para o nome do seu Usuário de sua preferência. Sem acentos. Exemplo: joao
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

1. - `useradd -m -g users -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input -s /bin/bash UsuarioDaSuaPreferencia`

2. - `usermod -a -G daemon,disk,wheel,rfkill,dbus,network,video,audio,storage,power,users,input UsuarioDaSuaPreferencia`

<br>

### Criando uma senha, para o seu usuário:
`passwd UsuarioDaSuaPreferencia`

<br>

### Editando o SUDOers para ter acesso de administrador:
`nano /etc/sudoers`

<br>

#### Procure pela linha: `"root ALL=(ALL) ALL"`
#### E logo abaixo inclua o seu usuário assim: `UsuárioDaSuaPreferência ALL=(ALL) ALL`
```
root ALL=(ALL) ALL
UsuarioDaSuaPreferencia ALL=(ALL) ALL
```

<br>

### Para o XORG - Ou seja, sem ele você não terá interface gráfica, é extremamente importante:
`pacman -S xorg-xinit xorg-server xorg-server-devel`

<br>

### Colocando o seu sistema para PORTUGUÊS de forma automática:
##### Leia. Na linha abaixo, contém `12` linhas de comando, obedeça cada comando:

1. - `cd /etc`
2. - `wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/locale.conf`
3. - `cd /etc/X11/xorg.conf.d/`
4. - `wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/arch_linux_install_scripts/00-keyboard.conf`
5. - `cp -r /etc/locale.conf /etc/vconsole.conf`
6. - `echo -e "pt_BR.UTF-8 UTF-8" > /etc/locale.gen`
7. - `locale-gen`
8. - `export LANG=pt_BR.UTF-8`
9. - `localectl set-x11-keymap br abnt2`
10. - `wget https://github.com/felipefacundes/desktop/blob/master/Arch_linux_Install/arch_linux_install_scripts/hunspell-pt-br-3.2-5-any.pkg.tar.xz?raw=true -O hunspell-pt-br-3.2-5-any.pkg.tar.xz`
11. - `pacman -U hunspell-pt-br-3.2-5-any.pkg.tar.xz`
12. - `rm hunspell-pt-br-3.2-5-any.pkg.tar.xz`<br>

<br>

#### Localidade em UTF-8 (padrão universal de caracteres). ISO-8859-1 não é mais utilizado.
##### Leia. Na linha abaixo, contém `3` linhas de comando, obedeça cada comando:

 1. - `rm -f /etc/localtime`
 2. - `ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime`
 3. - `hwclock --systohc --utc`

#### O Padrão abaixo "Sao_Paulo" é o padrão de Brasília. Mude para o fuso horário da sua respectiva cidade, Veja antes às zonas disponíveis com o comando: 
 `ls -h /usr/share/zoneinfo/America/`

<br>

### Se possui dual boot com Rwindows, use:
##### Leia. Na linha abaixo, contém `3` linhas de comando, obedeça cada comando:

1. - `hwclock --systohc --localtime`
2. - `echo -e "HARDWARECLOCK="localtime" >> /etc/locale.conf"`
3. - `echo -e "echo -e "UTC=no" >> /etc/locale.conf"`

<br>

### Para o seu hostname
`echo ArchLinux > /etc/hostname`

<br>

### Para ter internet:
##### Leia. Na linha abaixo, contém `3` linhas de comando, obedeça cada comando:

1. - `pacman -S wireless_tools wpa_supplicant network-manager-applet networkmanager`
2. - `systemctl enable NetworkManager.service`
3. - `systemctl start NetworkManager.service`

<br>

---
## Etapa 04 - Drivers
---
<br>

### Para driver Nvidia:

#### Habilite o Multilib em /etc/pacman.conf
#### Retire a hashtag antes das duas linhas: [multilib] e Include = /etc/pacman.d/mirrorlist
```
pacman -Syy nvidia-dkms linux-headers dkms nvidia-settings lib32-libvdpau lib32-libglvnd libglvnd libvdpau nvidia-utils opencl-nvidia xsettingsd xsettings-client ffnvcodec-headers libxnvctrl xf86-video-nouveau lib32-nvidia-utils lib32-opencl-nvidia nccl nvidia-cg-toolkit
```

<br>

### Para driver intel:
#### Habilite o Multilib em /etc/pacman.conf
#### Retire a hashtag antes das duas linhas: [multilib] e Include = /etc/pacman.d/mirrorlist
```
pacman -Syy lib32-vulkan-intel lib32-mesa lib32-libva1-intel-driver lib32-libva-intel-driver libva1-intel-driver libva-utils intel-opencl-clang intel-media-driver intel-graphics-compiler lib32-libglvnd libglvnd linux-headers dkms intel-gpu-tools intel-gmmlib intel-compute-runtime i810-dri xf86-video-intel vulkan-intel mesa libva-intel-driver iucode-tool intel-ucode intel-tbb
```

<br>

### Para driver AMD:

#### Habilite o Multilib em /etc/pacman.conf
#### Retire a hashtag antes das duas linhas: [multilib] e Include = /etc/pacman.d/mirrorlist
```
pacman -Syy opencl-mesa xf86-video-amdgpu xf86-video-ati linux-headers dkms vulkan-devel lib32-libglvnd libglvnd vulkan-radeon lib32-vulkan-icd-loader vulkan-icd-loader lib32-vulkan-validation-layers vulkan-validation-layers
```

<br>

### Para o driver de Áudio:

#### Habilite o Multilib em /etc/pacman.conf
#### Retire a hashtag antes das duas linhas: [multilib] e Include = /etc/pacman.d/mirrorlist

    pacman -Syy alsa-plugins alsa-utils lib32-alsa-plugins lib32-alsa-lib lib32-libpulse lib32-libcanberra-pulse pulseaudio-equalizer-ladspa ponymix pulseaudio-qt pulseaudio-lirc pulseaudio-jack pulseaudio-equalizer pulseaudio-bluetooth pulseaudio-alsa pulseaudio pavucontrol libpulse libcanberra-pulse libao lib32-libpulse qjackctl jack2 lib32-jack2 libffado --noconfirm

<br>

### Você poderá habilitar o Radv, para à sua AMDGPU RADEON, para tanto siga esse meu tutorial, super fácil:

https://amdgpu.github.io/

<br>

---
## Etapa 05 - Desktop
---
<br>

### Áreas de trabalho, escolha ou uma, ou outra. Dentre elas são: KDE, Cinnamon, GNOME, DEEPIN, XFCE, MATE

<br>

### Para Plasma kde
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

1. - `pacman -S kf5-aids kate nomacs gimp krita packagekit packagekit-qt5 discover okular kf5 plasma plasma-wayland-session plasma-mediacenter qtav mpv youtube-dl vlc sddm firefox-i18n-pt-br firefox plasma-pa xdg-user-dirs`

2. - `systemctl enable sddm`


<br>

### Para instalar o Cinnamon:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:
1. - `pacman -S cinnamon lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br xdg-user-dirs`
2. - `systemctl enable lightdm`

<br>

### Para instalar o GNOME:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

1. - `pacman -S gnome gnome-extra gnome-shell gdm gimp viewnior firefox firefox-i18n-pt-br xdg-user-dirs`
2. - `systemctl enable gdm`

<br>

### Para instalar o DEEPIN:
##### Leia. Na linha abaixo, contém `3` linhas de comando, e uma alternativa de comando. Obedeça cada comando, e leia a alternativa:
1. - `pacman -S deepin-control-center deepin-daemon deepin-api deepin-desktop-base deepin-desktop-schemas deepin-dock deepin-gtk-theme deepin-launcher deepin-menu deepin-network-utils deepin-polkit-agent-ext-gnomekeyring deepin-qt5dxcb-plugin deepin-qt5integration deepin-session-ui deepin-shortcut-viewer deepin-sound-theme deepin-system-monitor deepin-wallpapers startdde lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br xdg-user-dirs`

2. - `systemctl enable lightdm`

3. - `pacman -Rdd deepin-anything deepin-anything-dkms`
#### Ou, se você não tiver o deepin-anything-dkms:
3. - `pacman -Rdd deepin-anything`

<br>

### Para instalar o XFCE:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

1. - `sudo pacman -S xfce4 xfce4-goodies lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br xdg-user-dirs`
2. - `systemctl enable lightdm`

<br>

### Para instalar o MATE:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:
1. - `sudo pacman -S mate mate-extra lightdm-gtk-greeter lightdm gimp viewnior firefox firefox-i18n-pt-br xdg-user-dirs`
2. - `systemctl enable lightdm`

<br>

### O KDE usa 800MB de RAM, o  Cinnamon e o GNOME usam 750MB de RAM, o DEEPIN usa 700MB de RAM, o XFCE e o MATE usam 650MB de RAM
##### Para instalar o XMATECE, uma interface tão bonita e completa quanto o MATE, mas que usa menos de 300MB de RAM, siga esse tutorial:

[https://github.com/felipefacundes/xmatece](https://github.com/felipefacundes/xmatece)

<br>

---
## Etapa 06 - Para aqueles que querem usar o `startx` ao invés de `SDDM/GDM/LightDM` e etc
---
<br>

### Para TTY Autologin - GETTY - aqui é para autologin, SEM PRECISAR de DM (Desktop Manager), como: lightdm, GDM, SDDM e etc:
###### Leia. Na linha abaixo, contém 3 linhas de comando, obedeça cada comando:
1. - `mkdir -p /etc/systemd/system/getty@tty1.service.d/`
2. - `echo -e "[Service]" > /etc/systemd/system/getty@tty1.service.d/override.conf`
3. - `echo -e "ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/override.conf`

<br>

### Não esqueça de mudar o nome do UsuárioDaSuaPreferência  <-- Para o nome do seu usuário de sua preferência. Sem acentos. Exemplo: joao
##### Leia. Na linha abaixo, contém `4` linhas de comando, obedeça cada comando:
1. - `echo -e "ExecStart=-/usr/bin/agetty --autologin UsuarioDaSuaPreferencia --noclear %I $TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf`
2. - `mkdir -p /etc/systemd/system/serial-getty@ttyS0.service.d/`
3. - `echo -e "[Service]" > /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf`
4. - `echo -e "ExecStart=" >> /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf`

<br>

### Não esqueça de mudar o nome do UsuárioDaSuaPreferência  <-- Para o nome do seu usuário de sua preferência. Sem acentos. Exemplo: joao
`echo -e "ExecStart=-/usr/bin/agetty --autologin UsuarioDaSuaPreferencia -s %I 115200,38400,9600 vt102" >> /etc/systemd/system/serial-getty@ttyS0.service.d/autologin.conf`

<br>

---
## Etapa 07 - Ajustes para: PERFORMANCE / JOGOS / SEGURANÇA
---
<br>

### Preparar para jogos. Todas às dependências necessárias, inclusive, para aumentar, consideravelmente, a performance em jogos:
#### Habilite o Multilib em /etc/pacman.conf
#### Retire a hashtag antes das duas linhas: [multilib] e Include = /etc/pacman.d/mirrorlist
```
pacman -Syy --noconfirm egl-wayland eglexternalplatform libglvnd glfw-x11 clinfo opencl-headers opencl-mesa intel-opencl-clang libclc ocl-icd lib32-ocl-icd lib32-libglvnd lib32-glu glu libva-mesa-driver mesa mesa-demos mesa-vdpau lib32-mesa lib32-mesa-demos lib32-mesa-vdpau lib32-smpeg lib32-sdl_ttf lib32-sdl_mixer lib32-sdl_image lib32-sdl2_ttf lib32-sdl2_mixer lib32-sdl2_image lib32-sdl2 lib32-sdl sdl sdl2 sdl2_image sdl2_mixer sdl2_ttf sdl_image sdl_mixer sdl_ttf smpeg lib32-openal gambas3-gb-openal alure openal-examples openal freealut ffnvcodec-headers xf86-video-nouveau nvidia-cg-toolkit steam-native-runtime lib32-gtk3 vulkan-devel attr lib32-attr fontconfig lib32-fontconfig lcms2 lib32-lcms2 libxml2 lib32-libxml2 libxcursor lib32-libxcursor libxrandr lib32-libxrandr libxdamage lib32-libxdamage libxi lib32-libxi gettext lib32-gettext freetype2 lib32-freetype2 linux-headers dkms libsm lib32-libsm gcc-libs lib32-gcc-libs libpcap lib32-libpcap desktop-file-utils giflib lib32-giflib libpng lib32-libpng gnutls lib32-gnutls libxinerama lib32-libxinerama libxcomposite lib32-libxcomposite libxmu lib32-libxmu libxxf86vm lib32-libxxf86vm libldap lib32-libldap mpg123 lib32-mpg123 openal alsa-lib lib32-alsa-lib libxcomposite lib32-libxcomposite mesa-libgl lib32-mesa-libgl opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libpulse lib32-libpulse libva lib32-libva gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2 vkd3d lib32-vkd3d gsm ffmpeg xf86-video-ati xf86-video-amdgpu xf86-video-intel xf86-video-nouveau libva-intel-driver libva-utils libva-vdpau-driver vulkan-intel libgphoto2 ncurses lib32-ncurses libjpeg-turbo lib32-libjpeg-turbo lib32-alsa-plugins vulkan-radeon lib32-vulkan-intel lib32-vulkan-radeon lib32-vulkan-validation-layers wine-staging
```

<br>

### Para codecs (codecs, são extremamente importante no sistema, para uma melhor harmonia multimídia: som e vídeo):

#### Habilite o Multilib em /etc/pacman.conf
#### Retire a hashtag antes das duas linhas: [multilib] e Include = /etc/pacman.d/mirrorlist
```
pacman -S lib32-libcanberra-gstreamer lib32-gstreamer lib32-gst-plugins-good lib32-gst-plugins-base-libs lib32-gst-plugins-base aribb24 gpac gst-libav lame libdvbpsi libiec61883 libmad libmp4v2 libmpeg2 mjpegtools mpg123 twolame xvidcore libquicktime sox libopusenc opus opus-tools opusfile schroedinger aom celt flac libde265 opencore-amr openjpeg2 speex libfishsound gst-plugins-base gst-plugins-base-libs gst-plugins-good gstreamer libcanberra-gstreamer fmt atomicparsley
```

<br>

### Para deixar o seu computador muito mais rápido, eficiente, mais seguro. Aumente a performance e o FPS em JOGOS:
#### Leia. Na linha abaixo, contém `13` linhas de comando, obedeça cada comando:
1. - `echo -e "vm.swappiness=10" > /etc/sysctl.conf`
2. - `echo -e "net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf`
3. - `echo -e "net.ipv4.tcp_syncookies=1" >> /etc/sysctl.conf`
4. - `echo -e "net.ipv4.ip_forward=1" >> /etc/sysctl.conf`
5. - `echo -e "net.ipv4.tcp_dsack=0" > /etc/sysctl.conf`
6. - `echo -e "net.ipv4.tcp_sack=0" > /etc/sysctl.conf`
7. - `echo -e "fs.file-max=100000" > /etc/sysctl.conf`
8. - `echo -e "kernel.sched_migration_cost_ns=5000000" > /etc/sysctl.conf`
9. - `echo -e "kernel.sched_autogroup_enabled=0" > /etc/sysctl.conf`
10. - `echo -e "vm.dirty_background_bytes=16777216" > /etc/sysctl.conf`
11. - `echo -e "vm.dirty_bytes=50331648" > /etc/sysctl.conf`
12. - `echo -e "kernel.pid_max=4194304" > /etc/sysctl.conf`
13. - `echo -e "vm.oom_kill_allocating_task=1" > /etc/sysctl.conf`

<br>

### Em `/etc/security/limits.conf`   Observação:   o comando abaixo aumentará o desempenho e o FPS em jogos.
##### Leia. Na linha abaixo, contém `11` linhas de comando, obedeça cada comando:
1. - `echo -e "hard stack unlimited" >> /etc/security/limits.conf`
2. - `echo -e "nproc unlimited" >> /etc/security/limits.conf`
3. - `echo -e "nofile 1048576" >> /etc/security/limits.conf`
4. - `echo -e "memlock unlimited" >> /etc/security/limits.conf`
5. - `echo -e "as unlimited" >> /etc/security/limits.conf`
6. - `echo -e "cpu unlimited" >> /etc/security/limits.conf`
7. - `echo -e "fsize unlimited" >> /etc/security/limits.conf`
8. - `echo -e "memlock unlimited" >> /etc/security/limits.conf`
9. - `echo -e "msgqueue unlimited" >> /etc/security/limits.conf`
10. - `echo -e "locks unlimited" >> /etc/security/limits.conf`
11. - `echo -e "* hard nofile 1048576" >> /etc/security/limits.conf`

<br>

### Inclua em `/etc/systemd/`
##### Leia. Na linha abaixo, contém `3` linhas de comando, obedeça cada comando:
1. - `cd /etc/systemd/`
2. - `wget https://raw.githubusercontent.com/felipefacundes/desktop/master/etc-systemd/system.conf`
3. - `wget https://raw.githubusercontent.com/felipefacundes/desktop/master/etc-systemd/user.conf`

<br>

### Para notebooks:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

1. - `pacman -S xf86-input-synaptics acpi libinput`
2. - `echo -e "vm.laptop_mode=1" >> /etc/sysctl.conf`

<br>

### Se você não curte o seu monitor, desligando, ou esmaecendo a tela (tela preta), faça o seguinte:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:
1. - `cd /etc/X11/xorg.conf.d/`
2. - `wget https://raw.githubusercontent.com/felipefacundes/desktop/master/Arch_linux_Install/arch_linux_install_scripts/naodesligamonitor.conf`

<br>

---
## Etapa 08 - Ativar Hibernação
---
<br>

#### Para HIBERNAÇÃO do sistema. Exemplo:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:
1. - `blkid`
2. - `nano /etc/default/grub`

<br>

#### Em resume=UUID  altere conforme o exemplo abaixo e coloque conforme, o resultado do comando blkid, somente a parte do UUID
`resume=UUID="swap UUID" em "GRUB_CMDLINE_LINUX_DEFAULT="`

<br>

#### Em /etc/mkinitcpio.conf inclua em "HOOKS=" "resume" logo depois de "filesystems"
#### Depois de tudo alterado, rode os comandos para que o sistema passe a hibernar:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:
1. - `grub-mkconfig -o /boot/grub/grub.cfg`
2. - `mkinitcpio -P`

<br>

#### Se você usa arquivo de troca de paginação - arquivo para memória virtual (swapfile) e quer que o sistema hiberne, siga o tutorial abaixo:

[https://github.com/felipefacundes/desktop/tree/master/swapfile-hibernate](https://github.com/felipefacundes/desktop/tree/master/swapfile-hibernate)

<br>

---
## Etapa 08 - Apps, Drivers e Configs adicionais:
---
<br>

### Para instalar às impressoras:
##### Leia. Na linha abaixo, contém `3` linhas de comando, obedeça cada comando:
1. - `pacman -S cups cups-filters cups-pdf cups-pk-helper libcups python-pycups python2-pycups system-config-printer lib32-libcups splix foomatic-db foomatic-db-engine foomatic-db-gutenprint-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds foomatic-db-ppds hplip`
2. - `systemctl enable cups-browsed.service`
3. - `systemctl enable org.cups.cupsd.service`

<br>

### Totalmente opcional, para virtualbox execute:
`pacman -S virtualbox-host-modules-arch virtualbox-guest-iso virtualbox`

<br>

### Para instalar o LibreOffice:
`pacman -S libreoffice-fresh libreoffice-fresh-pt-br`

<br>

### Opcional. Para instalar fontes TrueType para aumentar o número de fontes no sistema, pesquise e instale às que preferir:
`pacman -Ss ttf`

<br>

#### Se preferir instalar todas as fontes disponíveis no repositório, tudo de uma vez, sem ao menos pesquisar:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:
1. - `pacman -S $(pacman -Ssq ttf)`
2. - `fc-cache`

<br>

#### Ou também você poderá instalar essas fontes:
##### Leia. Na linha abaixo, contém `2` linhas de comando, obedeça cada comando:

1. - `pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei terminus-font tamsyn-font dina-font adobe-source-han-sans-otc-fonts noto-fonts-emoji noto-fonts-cjk gnu-free-fonts font-bitstream-speedo bdf-unifont adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts`
2. - `fc-cache`

<br>

##### Para ter um excelente suporte de acessibilidade, como TTS, siga o tutorial do meu site:

[https://brasiltts.wordpress.com/](https://brasiltts.wordpress.com/)

<br>

##### Para você mudar o nome da sua distribuição, caso queira:
1. - `pacman -S lsb-release`
2. - `nano /etc/lsb-release`

<br>

### Para que você use o famoso repositório do AUR, quando não tiver o programa desejado no repositório oficial, instale o yay, para usar o repositório do AUR:

##### Leia. Na linha abaixo, contém `3` linhas de comando, obedeça cada comando:
1. - `git clone https://aur.archlinux.org/yay.git`
2. - `cd yay`
3. - `makepkg -si`

<br>

### Para você que veio do UBUNTU ou DEBIAN, e está acostumado com o comando apt-get, use:
`bash <(curl -s https://raw.githubusercontent.com/felipefacundes/apt-get-pacman/master/iniciorapido.sh)`

<br>

### Se você quiser instalar Jogos do Windows no Linux, com facilidade. Veja o projeto PlayOnGit
- [https://www.github.com/felipefacundes/PlayOnGit/](https://www.github.com/felipefacundes/PlayOnGit/)
- [https://jogoslinux.github.io/](https://jogoslinux.github.io/)

#

#### Para o driver obsoleto e incompatível com os kernels atuais: Catalyst

#### NÃO use, é obsoleto, está aqui para fins de história do Linux.

##### pacman-key -r 653C3094
##### pacman-key --lsign-key 653C3094
##### echo # uninstall the open drivers:
##### pacman -Rcc lib32-ati-dri ati-dri xf86-video-ati
##### pacman -S catalyst-hook catalyst-libgl catalyst-utils acpid qt4
##### install extra components (optional but needed for gaming):
##### pacman -S opencl-catalyst lib32-catalyst-utils lib32-catalyst-libgl lib32-opencl-catalyst

#

<br/>
<br/>
<br/>
<br/>
<br/>

```bash
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
