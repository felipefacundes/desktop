#!/bin/sh

ans=$(zenity  --width=40 --height=200 --title="Cancelar Lembrete" --list  --text "Deseja cancelar o lembrete?" --radiolist  --column "Escolha" --column "Ação" TRUE Cancelar FALSE Depois); #echo $ans


if [ "$ans" = "Cancelar" ] ; then
   pkill sequenciadorLR && /home/$USER/.local/bin/lembrete_repetitivo/backup_de_lembrete.sh
fi
if [ "$ans" = "Depois" ]; then
   #notify-send "O lembrete continuará a te alertar"
   xcowsay "O lembrete continuará a te alertar"
fi
