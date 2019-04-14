#!/bin/bash

#export PATH=/bin/
#export PATH=/home/maria/.jogos/wines/2.16/bin/
export WINE=/home/maria/.jogos/wines/2.16/bin/wine64
export WINEVERPATH=/home/maria/.jogos/wines/2.16/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.16/bin/wineserver
export W INELOADER=/home/maria/.jogos/wines/2.16/bin/wine64
#export WINEDLLPATH=
export LD _LIBRARY32_PATH=/home/maria/.jogos/wines/2.16/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.16/lib64

cd "/home/maria/.jogos/wineprefixes/worms/drive_c/Program Files (x86)/Team 17/Worms Ultimate Mayhem - Deluxe Edition"
#/Redist/"
#cd "/home/maria/Downloads/Tudo/Torrents/Worms.Ultimate.Mayhem.Deluxe.Edition-PROPHET/ppt-wumd"

WINEPREFIX=~/.jogos/wineprefixes/worms/ /home/maria/.jogos/wines/2.16/bin/wine64 WormsMayhem.exe
#DXSETUP.exe

