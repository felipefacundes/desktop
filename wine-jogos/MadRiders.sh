#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="fps"
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/3.5/bin/wine
#export PATH=/home/maria/.jogos/wines/3.4-staging/bin/
export WINEVERPATH=/home/maria/.jogos/wines/3.5/bin/wine
export WINESERVER=/home/maria/.jogos/wines/3.5/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/3.5/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/3.5/lib32
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.5/lib
#export WINEDEBUG=+fps

#cd "/home/maria/.jogos/wineprefixes/Blur/drive_c/Program Files (x86)/R.G. Mechanics/Blur"
#cd "/home/maria/Downloads/Tudo/Torrents/GRID.2_RELOADED/rld-grid2"
cd "/home/maria/.jogos/wineprefixes/MadRiders/drive_c/Program Files (x86)/Ubisoft/Mad Riders"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd "/home/maria/Downloads/Tudo/Torrents/Blur/"
#cd /home/maria/.cache/winetricks/physx
#cd /home/maria/.cache/wine
export vblank_mode=0
WINEPREFIX=~/.jogos/wineprefixes/MadRiders/ /home/maria/.jogos/wines/3.5/bin/wine MadRidersGame_x86.exe
#winetricks d3dx9 d3dx10_43 d3dx11_42 d3dx11_43 d3dcompiler_43 #MadRidersGame_x86.exe
#-opengl
#-dx9
#setup.exe
#DXSDK_Jun10.exe
#Blur.exe
