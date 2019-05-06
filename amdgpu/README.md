# Tutorial para HABILITAR à sua AMDGPU

#### Primeiro verifique se à sua placa é:

> Southern Islands (SI) ou Sea Islands (CIK)

https://www.x.org/wiki/RadeonFeature/

1. Execute:

`sudo nano /etc/default/grub`

```
Para Southern Islands (SI) o parâmetro é: radeon.si_support=0 amdgpu.si_support=1
Para Sea Islands (CIK) o parâmetro é: radeon.cik_support=0 amdgpu.cik_support=1
```

###### Exemplo:

###### Adicione em:

```
GRUB_CMDLINE_LINUX_DEFAULT="radeon.cik_support=0 amdgpu.cik_support=1"
```

#### Diferente das opções acima. Esta é uma opção UNIVERSAL. Você poderá incluir todos esses parâmetros abaixo, é até melhor, pois não precisará destinguir se à sua placa é SI ou CIK:

```
GRUB_CMDLINE_LINUX_DEFAULT="radeon.cik_support=0 radeon.si_support=0 amdgpu.cik_support=1 amdgpu.si_support=1 amdgpu.dpm=1 amdgpu.dc=1"
```

##### Para o caso de congelamentos, exemplo de congelamento: "[drm] IP block:gmc_v8_0 is hung!", inclua esse parâmetro adicional. TODAVIA, ATENÇÃO, ESSA É UMA OPÇÃO EM ÚLTIMO CASO, POIS O SEU SERVIDOR X PODERÁ NÃO INICIAR:

`amdgpu.vm_update_mode=3`

2. `sudo nano /etc/modprobe.d/amdgpu.conf`

###### E adicione:

```
options amdgpu si_support=1
options amdgpu cik_support=1
```

3. `sudo nano /etc/X11/xorg.conf.d/20-amdgpu.conf`

###### E adicione:

```
Section "Device"
    Identifier "AMD"
    Driver "amdgpu"
EndSection
```

4. `sudo nano /etc/mkinitcpio.conf`

###### E adicione em:

```
MODULES=(amdgpu radeon)
```

5. **ESSES DOIS ÚLTIMOS COMANDOS PARA FINALIZAR:**

```
sudo mkinitcpio -p linux
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

- Reinicie o computador ou notebook

  - Teste o vulkan:


  1. vulkaninfo
  
  2. vkcube
  
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


###### #tutorialvulkan
###### #radv
###### #vulkanradv
###### #vulkanamd
###### #amdgpu
