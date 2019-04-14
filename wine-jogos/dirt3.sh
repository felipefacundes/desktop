#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="fps"
#export PATH=/bin/
#export WINE=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export PATH=/home/maria/.jogos/wines/3.4-staging/bin/
#export WINEVERPATH=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINESERVER=/home/maria/.jogos/wines/3.4-staging/bin/wineserver
#export WINELOADER=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINEDLLPATH=
#export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/3.4-staging/lib32
#export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.4-staging/lib
#export WINEDEBUG=+fps

#cd "/home/maria/.jogos/wineprefixes/Blur/drive_c/Program Files (x86)/R.G. Mechanics/Blur"
#cd "/home/maria/Downloads/Tudo/Torrents/GRID.2_RELOADED/rld-grid2"
#cd "/home/maria/Downloads/Tudo/Torrents/DiRT.3.Complete.Edition.MULTi5-PLAZA"
cd "/home/maria/.jogos/wineprefixes/dirt3/drive_c/Program Files (x86)/DiRT 3 Complete Edition"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd "/home/maria/Downloads/Tudo/Torrents/Blur/"
#cd /home/maria/.cache/winetricks/physx
#cd /home/maria/.cache/wine
export vblank_mode=0
WINEPREFIX=~/.jogos/wineprefixes/dirt3/ wine dirt3_game.exe -dx9
#setup.exe
#DXSDK_Jun10.exe
#Blur.exe
