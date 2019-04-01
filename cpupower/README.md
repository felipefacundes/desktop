# CPUPOWER        - Esfriar o PC e Notebook: método que realmente funciona


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
