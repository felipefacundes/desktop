# Desvendando os mistérios do GRUB com crypt LVM

Para montar e bootar um sistema LVM encriptado, é necessário alterar o arquivo **/etc/default/grub**
    
<br></br>

- **Atenção:** usa-se o **UUID** para o GRUB e FSTAB achar o diretório root, caso você use diretamente a partição, exemplo: "/dev/sda2" o Linux poderá não bootar. Geralmente quando se tem mais de um HD, de vez em quando, o sistema pode embaralhar a letra da partição, para /dev/sdb2. Essa mudança acarreta na não inicialização do sistema. Por isso, é tão importante usar o **UUID**, para uma identificação precisa da partição, a outros métodos eficazes, como LABEL, ou PARTUUID.

<br></br>

> Será necessário achar o **Root** no lvm: através do comando **lvdisplay**, muitos tutoriais, dizem ser o VgGroup, e não é. É, justamente, a partição virtual do LVM, formatada em Ext4, usada para root, reconhecida através do comando já descrito: **lvdisplay**

#### Comandos para achar o UUID do root

`lsblk -o +uuid,name`
`lsblk -f`
`blkid`

#### Para saber logo, qual é o root
`sudo lvdisplay | grep -i "lv name"`

#### Resultado:

- Você deverá incluir o **UUID** da partição encriptada, exemplo: **/dev/sda2** na opção "**cryptdevice=**"
- Na nossa explicação: o UUID de "/dev/sda2" é "v7a16d7b-dd4b-42fd-a410-f4c7e3488a51"
- Logo após inclua-se **":"** e o resultado do **lvdisplay**, exemplo: **ArchLinuxRoot**

> Na linha **GRUB_CMDLINE_LINUX_DEFAULT=**

##### Ficará assim:

````
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=v7a16d7b-dd4b-42fd-a410-f4c7e3488a51:ArchLinuxRoot quiet nosplash"
````

<br></br>

#
#### Uma definição de opção para cripto:

    crypto=<hash>:<cipher>:<keysize>:<offset>:<skip>

#### Exemplo: `crypto=sha512:aes-xts-plain64:512:0`

> Na linha: **GRUB_CMDLINE_LINUX=** inclua crypto="**e a opção acima descrita**"

    GRUB_CMDLINE_LINUX="intel_pstate=disable root=/dev/mapper/ArchLinuxVG-ArchLinuxRoot crypto=sha512:aes-xts-plain64:512:0"

<br></br>

#
`# Preload both GPT and MBR modules so that they are not missed`

#### Para carregar os modulos necessários do GRUB:

> Na linha **GRUB_PRELOAD_MODULES=**

    GRUB_PRELOAD_MODULES="part_gpt part_msdos cryptodisk lvm"

<br></br>


`# Uncomment to enable booting from LUKS encrypted devices`

#### Para que o GRUB reconheça a encriptação do disco:

> Na linha **GRUB_ENABLE_CRYPTODISK=** inclua "y", para habilitar:

    GRUB_ENABLE_CRYPTODISK=y

<br></br>

#
> **Se, você quiser**:

#### Forneça rede, adicionando o parâmetro do kernel ip à configuração do GRUB: /etc/default/grub:

    GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda3:lv name:allow-discards ip=:::::eth0:dhcp"

<br></br>

#
`# Uncomment and set to the desired menu colors.  Used by normal and wallpaper`
`# modes only.  Entries specifiedasforeground/background.`

> Mudar as cores do menu do GRUB

#### GRUB, ao estilo de cores da bandeira do **Brasil:**

````
GRUB_COLOR_NORMAL="blue/light-green"
GRUB_COLOR_HIGHLIGHT="cyan/yellow"
````

<br></br>

#
### Atenção:

`# Uncomment one of them for the gfx desired, a image background or a gfxtheme`

 > Para o seu HD encriptado, não use o papel de parede dentro de pasta, que está contida na partição encriptada, como: /usr/share/grub/
 
 Caso você coloque o papel de parede do GRUB em: "/usr/share/grub" ou, outra qualquer dentro da partição encriptada, o GRUB pedirá senha, só para mostrar o menu. E depois, terá que digitar a senha novamente, para iniciar o sistema.
 
 #### Para que isso não ocorra:
 
 > Coloque o papel de parede em /boot

    GRUB_BACKGROUND="/boot/background/brasiltts-8bits-grub.tga"

#### Faça essa mesma lógica para temas:

    GRUB_THEME="/boot/grub/themes/archlinux/theme.txt"


<br></br>

#
> Após você **salvar** o arquivo: **/etc/default/grub**


#### Instale o GRUB na MBR

    sudo grub-install --target=i386-pc /dev/sda --recheck 

#### Ou no modo efi:

    sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --boot-directory=/boot --bootloader-id=grub --recheck

<br></br>

> Lembrado, que no sistema efi, a partição do /boot tem que estar no sistema de arquivos **fat32**

#### Se não estiver, formate:

    sudo mkfs.fat -F32 -n BOOT /dev/sda1


#### Atualize o GRUB:

    sudo grub-mkconfig -o /boot/grub/grub.cfg
 
#

## Configure o arquivo /etc/mkinitcpio.conf

 > Inclua na linha **MODULES=**

- **Para o kernel iniciar os modulos de criptografia**
  - dm_mod dm_crypt ext4 aes_x86_64 sha256 sha512

- **Se você usa o cpupower para gerenciar a frequência da cpu**
  - cpufreq_conservative cpufreq_powersave acpi-cpufreq

> Na linha **HOOKS=** inclua  encrypt e lvm2


#### Ficará assim:

````
MODULES="dm_mod dm_crypt ext4 aes_x86_64 sha256 sha512 cpufreq_conservative cpufreq_powersave acpi-cpufreq"

HOOKS="base udev autodetect modconf block encrypt keyboard keymap lvm2 filesystems"
````
#### Agora, execute o comando: 

`sudo mkinitcpio -p linux`

<br></br>

Pronto, tudo certo: HD encriptado, passará a bootar o sistema ;)
#

<br></br>

```
┏┓
┃┃╱╲ nesta
┃╱╱╲╲ casa
╱╱╭╮╲╲ todos
▔▏┗┛▕▔ usam
╱▔▔▔▔▔▔▔▔▔▔╲
LINUX
╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔
```

###### - Fatality
###### - Linux Wins







