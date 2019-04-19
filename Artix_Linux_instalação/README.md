# Instalação do Artix Linux

```
mkfs.ext4 -L ROOT /dev/sda2 <‐ root partition
mkfs.ext4 -L HOME /dev/sda3 <‐ home partition, optional
mkfs.ext4 -L BOOT /dev/sda4 <‐ boot partition, optional
mkswap -L SWAP /dev/sda1 <‐ swap partition
```


##### A opção -L atribui rótulos às partições, o que ajuda a consultá-las mais tarde através de /dev/disk/by-label sem ter que se lembrar de seus números. Agora, monte suas partições:


```
swapon /dev/sda1
mount /dev/sda2 /mnt
mount /dev/sda3 /mnt/home (if created)
mount /dev/sda4 /mnt/boot (if created)
```

#### Instalar a base do sistema

##### Uma conexão de internet em funcionamento é necessária e assumida. Uma conexão com fio é configurada automaticamente, se encontrada. Os sem fio devem ser configurados pelo usuário. Verifique sua conexão e atualize os repositórios:

```
ping artixlinux.org
pacman -Syy
```
##### Use basestrap para instalar a base e, opcionalmente, os grupos de pacotes base-devel e seu init preferido (atualmente disponível: openrc e runit):

```
basestrap /mnt base base-devel openrc
or
basestrap /mnt base base-devel runit
```

##### Use fstabgen para gerar /etc/fstab, use -U para UUIDs e -L para rótulos de partições:

```
fstabgen -L /mnt >>/mnt/etc/fstab
```

##### Verifique o fstab resultante para erros antes de reinicializar. Agora, você pode entrar em seu novo sistema Artix com:

    artools-chroot /mnt

##### Configure o sistema base. Primeiro, instale o grub e o os-prober (para detectar outros sistemas operacionais instalados):

```
pacman -S grub os‐prober
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

##### Create a user and password:

```
useradd -m user
passwd user
```

Configure sua senha de ROOT:

    passwd

Instalar networkmanager:

```
pacman -S networkmanager networkmanager-openrc network-manager-applet
rc‐update add NetworkManager default
```

Gerar local:

    nano /etc/locale.gen

<‐ descomente sua localidade em **UTF-8** (padrão universal de caracteres). ISO-8859-1 não é mais utilizado.

##### OU

```
echo -e "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen
```

    
###### Sistema em português e teclado em ABNT2

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
echo -e "LC_ALL=pt_BR" >> /etc/locale.conf
echo -e "KEYMAP="br-abnt2"" >> /etc/locale.conf
 
cp -rf /etc/locale.conf /etc/vconsole.conf

loadkeys /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz

echo -e "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen
export LANG=pt_BR.UTF-8
loadkeys /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz
setfont

nano /etc/conf.d/keymaps
e substitua **us** por **br-abnt2** ficará assim:
keymap="br-abnt2"

rc-update add keymaps default
```

###### Para definir a localidade em todo o sistema, edite /etc/locale.conf (que é originado por /etc/profile) ou /etc/bash/bashrc.d/artix.bashrc ou /etc/bash/bashrc.d/local.bashrc; alterações específicas do usuário podem ser feitas em seus respectivos ~/.bashrc, por exemplo:

```
export LANG="pt_BR.UTF‐8"
export LC_COLLATE="C"
```

##### Configuração pós-instalação

Agora, você pode reiniciar e entrar em sua nova instalação:

    exit

<‐ sair do ambiente chroot

```
umount -R /mnt
reboot
```

Quando o desligamento estiver concluído, remova a mídia de instalação. Se tudo correu bem, você deve iniciar o seu novo sistema. Faça o login como sua raiz para completar a configuração de instalação. Para obter um ambiente gráfico, você precisa instalar o grupo xorg:

    pacman -S xorg xorg-server xorg-server-devel

Escolha seus pacotes ou instale todos eles. Para os drivers nvidia de código fechado, você pode usar o pacote nvidia-lts, já que nosso kernel padrão é linux-lts:

    pacman -S nvidia-lts

Os cartões nvidia mais antigos funcionam com as séries legacy, nvidia-340xx-lts e nvidia-304xx-lts. Se você quer rodar um kernel customizado, você pode instalar o nvidia pacote dkms que garante que todos os kernels instalados recebam seus módulos nvidia. As placas AMD e Intel desfrutam de excelente suporte (ou quase excelente) 3D com código aberto drivers. Leia o wiki do Arch para obter informações sobre como o Xorg escolhe o melhor driver de vídeo disponível e qual é o ideal para o seu hardware. Instale um ambiente de área de trabalho, por exemplo MATE, LXQt or XFCE4:

    pacman -S mate mate‐extra xfce4 xfce4‐goodies lxqt

E, opcionalmente, um gerenciador de exibição, como lightdm ou SDDM:

```
pacman -S lightdm displaymanager-openrc
rc-update add xdm default
nano /etc/conf.d/xdm
```

<‐ editar e definir DISPLAYMANAGER="lightdm"

Ou você pode usar o .xinitrc para iniciar seu DE manualmente; edite (ou crie) ~/.xinitrc e adicione exec mate-session. Aviso: mate-session e alguns outros pacotes dos repositórios do Arch são compilados contra o systemd mesmo que eles não o utilizem, pelo menos não como PID1; para satisfazer o link da biblioteca você pode instalar elogind e seus arquivos de serviços elogind-openrc or elogind-runit.

    pacman ‐S elogind

#### Ou, se você preferir: você não precisa de DE para logar ou gerenciar o servidor X, você poderá conceder autologin ao sistema e incluir "startx" ou "sx" no seu .bash_profile:

```
sudo rc-update delete xdm
sudo nano /etc/conf.d/agetty.tty1     (ou agetty.tty2, 3, onde você preferir que logue automaticamente)
```
###### E inclua em agetty.tty1 (ou 2...): "-a seu_usuário" exemplo: maria ou joão ... tem que usar aspas "" como descrito abaixo:

    agetty_options="-a maria"

##### Para impressora você terá que instalar o CUPS e iniciar o CUPS e o Avahi no BOOT:

```
PARA IMPRESSORAS: HP inclua hplip: sudo pacman -S hplip

sudo pacman -S cups cups-filters cups-openrc avahi-openrc system-config-printer
sudo rc-update add avahi-dnsconfd default
sudo rc-update add cupsd default

AGORA INICIE OS SERVIÇOS:

sudo rc-service avahi-dnsconfd start
sudo rc-service cupsd start
```

INSTALE A IMPRESSORA

sudo system-config-printer

OBS: Caso à sua impressora não seja reconhecida, terá de instalar hplip para HP, splix para SAMSUNG e os drivers foomatic

OPCIONAL:

    sudo pacman -S foomatic-db-engine foomatic-db foomatic-db-gutenprint-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds foomatic-db-ppds

##### Para desligar o sistema sem precisar de senha

```
sudo chmod +x /usr/bin/openrc-shutdown
sudo chmod +s /usr/bin/openrc-shutdown
```

###### Para desligar, passe a usar:

openrc-shutdow --reboot now

###### Ou reiniciar
openrc-shutdow --poweroff now

