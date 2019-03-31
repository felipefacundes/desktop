mkdir -p /home/$USER/.Backup/

mkdir -p /home/$USER/.Backup/Documentos/Tudo/
mkdir -p /home/$USER/.Backup/Documentos/Downloads/Tudo/
mkdir -p /home/$USER/.Backup/Música/Tudo/
mkdir -p /home/$USER/.Backup/Vídeos/Tudo/
mkdir -p /home/$USER/.Backup/Imagens/Tudo/

cd /home/$USER/
mv Documentos/* /home/$USER/.Backup/Documentos/Tudo/
mv Documentos/.* /home/$USER/.Backup/Documentos/Tudo/
rm -rf Documentos
mv Downloads/* /home/$USER/.Backup/Documentos/Downloads/Tudo/
mv Downloads/.* /home/$USER/.Backup/Documentos/Downloads/Tudo/
rm -rf Downloads
mv Música/* /home/$USER/.Backup/Música/Tudo/
mv Música/.* /home/$USER/.Backup/Música/Tudo/
rm -rf Música
mv Vídeos/* /home/$USER/.Backup/Vídeos/Tudo/
mv Vídeos/.* /home/$USER/.Backup/Vídeos/Tudo/
rm -rf Vídeos
mv Imagens/* /home/$USER/.Backup/Imagens/Tudo/
mv Imagens/.* /home/$USER/.Backup/Imagens/Tudo/
rm -rf Vídeos

cd /home/$USER/.Backup/

echo -e "ln -s /home/$USER/.Backup/Documentos /home/$USER/Documentos" > /home/$USER/.Backup/criar-links.sh
echo -e "ln -s /home/$USER/.Backup/Documentos/Downloads /home/$USER/Downloads" >> /home/$USER/.Backup/criar-links.sh
echo -e "ln -s /home/$USER/.Backup/Música /home/$USER/Música" >> /home/$USER/.Backup/criar-links.sh
echo -e "ln -s /home/$USER/.Backup/Vídeos /home/$USER/Vídeos" >> /home/$USER/.Backup/criar-links.sh
echo -e "ln -s /home/$USER/.Backup/Imagens /home/$USER/Imagens" >> /home/$USER/.Backup/criar-links.sh
chmod +x /home/$USER/.Backup/criar-links.sh
ln -s /home/$USER/.Backup/criar-links.sh /home/$USER/.criar-links.sh
sudo chattr +i /home/$USER/.Backup/criar-links.sh

echo -e "#!/bin/bash" > /home/$USER/.Backup/Documentos/Acessar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R -i Tudo; sleep 3h; chattr -R +i Tudo'" >> /home/$USER/.Backup/Documentos/Acessar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Documentos/Acessar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Documentos/Acessar_pasta_Tudo.sh
echo -e "#!/bin/bash" > /home/$USER/.Backup/Documentos/Travar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R +i Tudo'" >> /home/$USER/.Backup/Documentos/Travar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Documentos/Travar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Documentos/Travar_pasta_Tudo.sh

echo -e "#!/bin/bash" > /home/$USER/.Backup/Documentos/Downloads/Acessar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R -i Tudo; sleep 10h; chattr -R +i Tudo'" >> /home/$USER/.Backup/Documentos/Downloads/Acessar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Documentos/Downloads/Acessar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Documentos/Downloads/Acessar_pasta_Tudo.sh
echo -e "#!/bin/bash" > /home/$USER/.Backup/Documentos/Downloads/Travar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R +i Tudo'" >> /home/$USER/.Backup/Documentos/Downloads/Travar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Documentos/Downloads/Travar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Documentos/Downloads/Travar_pasta_Tudo.sh

echo -e "#!/bin/bash" > /home/$USER/.Backup/Música/Acessar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R -i Tudo; sleep 6h; chattr -R +i Tudo'" >> /home/$USER/.Backup/Música/Acessar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Música/Acessar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Música/Acessar_pasta_Tudo.sh
echo -e "#!/bin/bash" > /home/$USER/.Backup/Música/Travar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R +i Tudo'" >> /home/$USER/.Backup/Música/Travar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Música/Travar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Música/Travar_pasta_Tudo.sh

echo -e "#!/bin/bash" > /home/$USER/.Backup/Vídeos/Acessar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R -i Tudo; sleep 8h; chattr -R +i Tudo'" >> /home/$USER/.Backup/Vídeos/Acessar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Vídeos/Acessar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Vídeos/Acessar_pasta_Tudo.sh
echo -e "#!/bin/bash" > /home/$USER/.Backup/Vídeos/Travar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R +i Tudo'" >> /home/$USER/.Backup/Vídeos/Travar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Vídeos/Travar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Vídeos/Travar_pasta_Tudo.sh

echo -e "#!/bin/bash" > /home/$USER/.Backup/Imagens/Acessar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R -i Tudo; sleep 6h; chattr -R +i Tudo'" >> /home/$USER/.Backup/Imagens/Acessar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Imagens/Acessar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Imagens/Acessar_pasta_Tudo.sh
echo -e "#!/bin/bash" > /home/$USER/.Backup/Imagens/Travar_pasta_Tudo.sh
echo -e "gksu su -c 'chattr -R +i Tudo'" >> /home/$USER/.Backup/Imagens/Travar_pasta_Tudo.sh
chmod +x /home/$USER/.Backup/Imagens/Travar_pasta_Tudo.sh
sudo chattr +i /home/$USER/.Backup/Imagens/Travar_pasta_Tudo.sh

cd /home/$USER/
sudo chattr -R +i .Backup

mkdir -p /home/$USER/.local/bin/
echo -e "#!/bin/bash" > /home/$USER/.local/bin/criar-links-automaticamente.sh
echo -e "while true; do sh ~/.Backup/criar-links.sh; done" >> /home/$USER/.local/bin/criar-links-automaticamente.sh
chmod +x /home/$USER/.local/bin/criar-links-automaticamente.sh

echo -e "#!/usr/bin/env xdg-open" > /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "[Desktop Entry]" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Encoding=UTF-8" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Name=criar-links-automaticamente" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Comment=criar-links-automaticamente" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Type=Application" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Exec=/home/$USER/.local/bin/criar-links-automaticamente.sh" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Icon=terminal" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Name[fr_FR]=criar-links-automaticamente" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "StartupWMClass=criar-links-automaticamente.sh" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "StartupNotify=false" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Categories=System;" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop
echo -e "Keywords=command line;execute;" >> /home/$USER/.config/autostart/criar-links-automaticamente.desktop



echo -e "PS1='\033[01;30m[\t] \033[01;37m\u@\h:\033[01;34m\w\033[01;37m\$'" > /home/$USER/.zshrc
echo -e "export PS1" >> /home/$USER/.zshrc
echo -e "export EDITOR=nano" >> /home/$USER/.zshrc
echo -e "export VISUAL=nano" >> /home/$USER/.zshrc
echo -e "#screenfetch" >> /home/$USER/.zshrc
echo -e "#/home/$USER/.local/bin/arch_artwork_A_colors.sh" >> /home/$USER/.zshrc
echo -e "echo -e 'Ei, você.'" >> /home/$USER/.zshrc
echo -e "echo -e 'Leia com ATENÇÃO as opções abaixo.'" >> /home/$USER/.zshrc
echo -e "echo -e 'Ctrl + D (para sair).'" >> /home/$USER/.zshrc
echo -e "echo -e 'Ou digite: exit (para sair).'" >> /home/$USER/.zshrc
echo -e "alias rm='trash-put'" >> /home/$USER/.zshrc
echo -e "alias yd='youtube-dl'" >> /home/$USER/.zshrc


echo -e "PS1='\033[01;30m[\t] \033[01;37m\u@\h:\033[01;34m\w\033[01;37m\$'" > /home/$USER/.bashrc
echo -e "export PS1" >> /home/$USER/.bashrc
echo -e "export EDITOR=nano" >> /home/$USER/.bashrc
echo -e "export VISUAL=nano" >> /home/$USER/.bashrc
echo -e "#screenfetch" >> /home/$USER/.bashrc
echo -e "#/home/$USER/.local/bin/arch_artwork_A_colors.sh" >> /home/$USER/.bashrc
echo -e "echo -e 'Ei, você.'" >> /home/$USER/.bashrc
echo -e "echo -e 'Leia com ATENÇÃO as opções abaixo.'" >> /home/$USER/.bashrc
echo -e "echo -e 'Ctrl + D (para sair).'" >> /home/$USER/.bashrc
echo -e "echo -e 'Ou digite: exit (para sair).'" >> /home/$USER/.bashrc
echo -e "alias rm='trash-put'" >> /home/$USER/.bashrc
echo -e "alias yd='youtube-dl'" >> /home/$USER/.bashrc

echo
echo
echo -e "execute:   sudo pacman -Syy trash-cli"