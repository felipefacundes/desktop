# CPUPOWER        - Esfriar o PC e Notebook: método que realmente funciona

> by Felipe Facundes
###### Grupo Telegram: https://t.me/winehq_linux
###### Canal Telegram: https://t.me/comandos_linux
------------------------------------------------------------------

<br></br>

##### Edite o arquivo de configuração do initramfs (mkinitcpio)

    sudo nano /etc/mkinitcpio.conf

> Na Linha "**MODULES=**" inclua os seguintes parâmetros:

    MODULES="cpufreq_conservative cpufreq_powersave acpi-cpufreq ..."

Atualiza os módulos adicionados

    sudo mkinitcpio -p linux

<br></br>


------------------------------------------------------------------

  > Para processadores intel inclua "intel_pstate=disable" na linha:

  > "**GRUB_CMDLINE_LINUX_DEFAULT=**"
    
```
    sudo nano /etc/default/grub

    GRUB_CMDLINE_LINUX_DEFAULT="intel_pstate=disable"
```

##### Atualize o grub

    sudo grub-mkconfig -o /boot/grub/grub.cfg
------------------------------------------------------------------

<br></br>

### Edite o arquivo de configuração do cpupower

    sudo nano /etc/default/cpupower

> O arquivo vem escrito assim:

###### Define CPUs governor
###### valid governors: ondemand, performance, powersave, conservative, userspace.

> Se você quer esfriar

### O segredo está no: powersave

    governor='powersave'

###### Limit frequency range
###### Valid suffixes: Hz, kHz (default), MHz, GHz, THz

### Veja a frequência com: cpupower frequency-info

> Para realmente esfriar

### na mínima frequencia: realmente use a mínima frequência.

min_freq="x.xxGHz"
max_freq="x.xxGHz"

<br></br>


------------------------------------------------------------------

  > Um script, para ser chamado quando quiser:
  
  - Opção 1

  `sudo nano /bin/esfriar`

  `sudo chmod +x /bin/esfriar`

```
#!/bin/bash
sudo systemctl stop cpupower
sudo systemctl start cpupower
cpupower frequency-info | grep --color -i "asserted by"
```

  - Opção 2

```
#!/bin/bash
sudo cpupower frequency-set -d "frequência mínima"GHz                   # Exemplo: 2.2GHz
sudo cpupower frequency-set -f "Mesma frequêcia relatada acima"GHz      # Exemplo: 2.2GHz
cpupower frequency-info | grep --color -i "asserted by"
```

<br></br>


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

