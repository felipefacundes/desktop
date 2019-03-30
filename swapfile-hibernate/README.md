# swapfile-hibernate

> Hibernar com swapfile sem programas adicionais.
> Hibernate with swapfile without programs. 

### Crie e monte o swapfile. Create and mount swapfile
```
sudo fallocate -l 3G /swapfile
sudo chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### Descubra o dispositivo que foi criado. UUID device of the swapfile
    sudo findmnt -no SOURCE,UUID -T /swapfile
  
### Recomenda-se ao usar resume=UUID no grub. UUID recommended
    sudo findmnt -no UUID -T /var/lib/swap/swapfile

### Descubra o offset do arquivo swap (swapfile). Offset of the swapfile
#### É indicado o número no primeiro bloco (no ínicio)
    sudo filefrag -v /swapfile

### Ou para descubrir logo o offset, use:
    sudo filefrag -v /swapfile | grep "0:        0.."

### Em GRUB_CMDLINE_LINUX_DEFAULT= no arquivo /etc/default/grub ###
#### inlua resume e resume_offset. Include resume_offset and resume ####
#### use o UUID (recomendado). UUID recommended #####
    resume=UUID="seu UUID" resume_offset="seu offset"

### Em "HOOKS" no arquivo /etc/mkinitcpio.conf ###
#### logo após filesystems, inclua resume. Beffore filesystems. ####
    .. filesystems resume ..

### Finalize rodando os comandos. Run commands ###
    sudo mkinitcpio -p linux
    sudo grub-mkconfig -o /boot/grub/grub.cfg
