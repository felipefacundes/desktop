#!/bin/bash --norc
# Comando de papel de parede aleatório universal, super simples. Random Wallpaper Easy.
# Licença GPLv2 
# Mantenedor Felipe Facundes 
# e-mail: felipe.facundes@gmail.com

# Sinal 'kill' recebido
trap "break ; exit" 1 2 3 15

# Após o comando: "find" troque o diretório da "pasta" dos papéis de parede, para o seu diretório correspondente
while true;
do DIR="$HOME/Imagens/Tudo/wallpapers/jpg"
PIC=$(ls --file-type $DIR/*.[jJpP][nNpP][gG] | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$PIC";
# Atualizando tela:
xrefresh || :
# Mude para o tempo que você quiser
sleep 15
done
