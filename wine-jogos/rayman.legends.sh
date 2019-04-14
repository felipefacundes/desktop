#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="cpu,fps"
#export PATH=/bin/
#export PATH=/home/maria/.jogos/wines/2.14-staging/bin/
export WINE=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export WINEVERPATH=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14-staging/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14-staging/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14-staging/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14-staging/lib64
export WINEDEBUG=-all

#cd "/home/maria/Downloads/Tudo/Torrents/Rayman.Legends-RELOADED/rld-rlegends/"
cd "/home/maria/.jogos/wineprefixes/RaymanLegends/drive_c/Rayman Legends/" 
#support"

#cd "/home/maria/.cache/winetricks/dxsdk_jun2010/"

WINEPREFIX=~/.jogos/wineprefixes/RaymanLegends/ /home/maria/.jogos/wines/2.14-staging/bin/wine64 "Rayman Legends.exe"
#UplayInstaller.exe
