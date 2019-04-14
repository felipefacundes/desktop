#!/bin/sh

ans=$(zenity  --width=40 --height=200 --title="Sair" --list  --text "O que quer fazer?" --radiolist  --column "Escolher" --column "Executar" TRUE Desligar FALSE Reiniciar FALSE Sair); #echo $ans


if [ "$ans" = "Desligar" ] ; then
   desligar
fi
if [ "$ans" = "Reiniciar" ]; then
   reboot
fi
if [ "$ans" = "Sair" ]; then
   reboot
fi
