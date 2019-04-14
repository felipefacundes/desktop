#!/bin/bash
mkdir -p /home/$USER/Documentos/Lembretes/Bkp/
sleep 45

#A primeira condição do lembrete
if 
#ls /home/$USER/Documentos/Lembretes/lembrete{.txt,.jpg,.png,.pdf,.odt};
ls /home/$USER/Documentos/Lembretes/lembrete.txt

then
# SE SATISFAZ ENTRA AQUI
xdg-open /home/$USER/Documentos/Lembretes/lembrete.txt;
play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga;
sleep 40;
pkill play;
sleep 10;
mv /home/$USER/Documentos/Lembretes/lembrete.txt "/home/$USER/Documentos/Lembretes/Bkp/lembrete - 
$(date).txt.bkp";
exit;

# Outra condição
elif
ls /home/maria/Documentos/Lembretes/lembrete.jpg

then
# SE SATISFAZ ENTRA AQUI
xdg-open /home/$USER/Documentos/Lembretes/lembrete.jpg;
play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga;
sleep 40;
pkill play;
sleep 10;
mv /home/$USER/Documentos/Lembretes/lembrete.jpg "/home/$USER/Documentos/Lembretes/Bkp/lembrete - 
$(date).jpg.bkp";
exit;
# --------
else
# SE NAO SATISFAZ ENTRA AQUI
xmessage "SEM LEMBRETES: para novos lembretes, crie um lembrete.txt ou .jpg em Documentos/Lembretes/"
fi
