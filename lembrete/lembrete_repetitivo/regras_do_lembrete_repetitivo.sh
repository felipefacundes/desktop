#!/bin/bash
mkdir -p /home/$USER/Documentos/Lembretes/
#tempo de iniciar o PC
sleep 45

#A primeira condição do lembrete
if 
#ls /home/$USER/Documentos/Lembretes/lembrete{.txt,.jpg,.png,.pdf,.odt};
ls /home/$USER/Documentos/Lembretes/lembrete.txt

then
# SE SATISFAZ ENTRA AQUI
xdg-open /home/$USER/Documentos/Lembretes/lembrete.txt;
play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga;
sleep 5;
pkill play;
sleep 1;
/home/maria/.local/bin/lembrete_repetitivo/cancelar_lembrete.sh;
sleep 15m;
exit;

# Outra condição
elif
ls /home/$USER/Documentos/Lembretes/lembrete.jpg

then
# SE SATISFAZ ENTRA AQUI
xdg-open /home/$USER/Documentos/Lembretes/lembrete.jpg;
play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga;
sleep 5;
pkill play;
sleep 1;
/home/maria/.local/bin/lembrete_repetitivo/cancelar_lembrete.sh;
sleep 15m;
exit;
# --------
else
# SE NAO SATISFAZ ENTRA AQUI
pkill sequenciadorLR
sleep 2
#zenity --info --title="SEM LEMBRETES" --text "Para novos lembretes, crie um lembrete.txt ou .jpg em Documentos/Lembretes/";
xcowsay "SEM LEMBRETES: Para novos lembretes, crie um lembrete.txt ou .jpg em Documentos/Lembretes/";
sleep 5
xcowsay "SEM LEMBRETES: Para novos lembretes, crie um lembrete.txt ou .jpg em Documentos/Lembretes/";
sleep 1
espeak -v brazil-mbrola-4 -s 124 -a 46 "SEM LEMBRETES: Para novos lembretes, crie um lembrete.txt ou .jpg na pasta Lembretes, que fica dentro da pasta Documentos";
xcowsay "SEM LEMBRETES: Para novos lembretes, crie um lembrete.txt ou .jpg em Documentos/Lembretes/";
fi
