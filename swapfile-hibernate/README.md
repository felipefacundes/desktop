# swapfile-hibernate

###### Hibernar com swapfile sem programas adicionais.

###### Hibernate with swapfile without programs. 

### Crie e monte o swapfile. Create and mount swapfile

```bash
sudo fallocate -l 3G /swapfile
ou
sudo dd if=/dev/zero of=/swapfile bs=3M count=1024 status=progress

sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### Descubra o dispositivo que foi criado.    -    UUID device of the swapfile

    sudo findmnt -no SOURCE,UUID -T /swapfile
  
### Recomenda-se ao usar resume=`UUID` no grub. Então pesquise o seu `UUID`.    -    UUID recommended

    sudo findmnt -no UUID -T /swapfile

### Descubra o offset do arquivo swap (swapfile).    -    Offset of the swapfile

#### É indicado o número no primeiro bloco (no ínicio)

    sudo filefrag -v /swapfile

### Ou para descubrir logo o offset, use:

    sudo filefrag -v /swapfile | grep "0:        0.."

##### Aparecerá algo como:

```diff
- 0:        0..    8191:  121849856.. 121858047:   8192:
```

##### O seu offset será: `121849856`
    
### Edite o arquivo `/etc/default/grub`

`sudo vim /etc/default/grub`

### Em `GRUB_CMDLINE_LINUX_DEFAULT=`

#### inlua `resume` e `resume_offset`.    -    Include resume_offset and resume

#### use o UUID (recomendado).    -    UUID recommended

    resume=UUID=seu_UUID resume_offset=seu_offset

###### Exemplo:

    resume=UUID=2c5008af-9ebc-4706-b903-741bda1222ab resume_offset=121849856
    
### Edite o arquivo `/etc/mkinitcpio.conf`

`sudo vim /etc/mkinitcpio.conf`

### Em `"HOOKS"` logo após `filesystems`, inclua `resume`.    -    Beffore filesystems. 

    .. filesystems resume ..

### Finalize rodando os comandos.    -    Run commands

```
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Em FSTAB

    sudo vim /etc/fstab
    
##### Inclua:

    /swapfile  none  swap  defaults  0 0

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
https://t.me/winehq_linux
