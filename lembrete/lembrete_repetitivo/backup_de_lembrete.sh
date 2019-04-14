#!/bin/bash
mkdir -p /home/$USER/Documentos/Lembretes/Bkp/
sleep 5

#A primeira condição do lembrete
if 
#ls /home/$USER/Documentos/Lembretes/lembrete{.txt,.jpg,.png,.pdf,.odt};
ls /home/$USER/Documentos/Lembretes/lembrete.txt

then
# SE SATISFAZ ENTRA AQUI
mv /home/$USER/Documentos/Lembretes/lembrete.txt "/home/$USER/Documentos/Lembretes/Bkp/lembrete - 
$(date).txt.bkp";
xcowsay "Seu lembrete.txt fora feito backup em Documentos/Lembretes/Bkp/";
exit;

# Outra condição
elif
ls /home/$USER/Documentos/Lembretes/lembrete.jpg

then
# SE SATISFAZ ENTRA AQUI
mv /home/$USER/Documentos/Lembretes/lembrete.jpg "/home/$USER/Documentos/Lembretes/Bkp/lembrete - 
$(date).jpg.bkp";
#zenity --info --title="Cópia de Seguraça" --text "Seu lembrete.jpg fora feito backup em Documentos/Lembretes/Bkp/"
xcowsay "Seu lembrete.jpg fora feito backup em Documentos/Lembretes/Bkp/";
exit;

# --------
else
# SE NAO SATISFAZ ENTRA AQUI
#zenity --info --title="Cópia de Seguraça" --text "Sem lembretes .txt ou .jpg para backups"
xcowsay "Sem lembretes .txt ou .jpg para backups"
fi