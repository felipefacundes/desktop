# Artix sem senha para desligar

##### Conceda permissões

    sudo chmod +s /sbin/openrc-shutdow


### sudo nano /etc/sudoers
##### Grupo

    %wheel ALL=(ALL) NOPASSWD: /sbin/openrc-shutdow

##### Usuário
exemplo:

    user ALL=(ALL) NOPASSWD: /sbin/openrc-shutdown



##### execute sem senha:
```
/sbin/openrc-shutdow --reboot now
/sbin/openrc-shutdow --poweroff now
```
