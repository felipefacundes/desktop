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

###### Você poderá incluir todos esses parâmetros abaixo, mas poderá ocorrer problemas:

```
GRUB_CMDLINE_LINUX_DEFAULT="radeon.cik_support=0 radeon.si_support=0 amdgpu.cik_support=1 amdgpu.si_support=1 amdgpu.dpm=1 amdgpu.dc=1"
```

###### Para o caso de congelamentos, exemplo de congelamento: "[drm] IP block:gmc_v8_0 is hung!", inclua esse parâmetro adicional:

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

`sudo mkinitcpio -p linux`
`sudo grub-mkconfig -o /boot/grub/grub.cfg`

- Reinicie o computador ou notebook

  - Teste o vulkan:


  1. vulkaninfo
  
  2. vkcube
  
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


###### #tutorialvulkan
###### #radv
###### #vulkanradv
###### #vulkanamd
###### #amdgpu
