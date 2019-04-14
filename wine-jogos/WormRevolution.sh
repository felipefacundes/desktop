#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="fps"
#export PATH=/home/maria/.jogos/wines/2.18/bin/
export WINE=/home/maria/.jogos/wines/3.5/bin/wine
export WINEVERPATH=/home/maria/.jogos/wines/3.5/bin/wine
export WINESERVER=/home/maria/.jogos/wines/3.5/bin/wineserver
export W INELOADER=/home/maria/.jogos/wines/3.5/bin/wine
#export WINEDLLPATH=
export LD _LIBRARY32_PATH=/home/maria/.jogos/wines/3.5/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.5/lib64

cd "/home/maria/.jogos/wineprefixes/worms/drive_c/Program Files (x86)/Team 17/Worms Revolution - Gold Edition/"
export WINEPREFIX=~/.jogos/wineprefixes/worms/ 
#winetricks d3dx9 d3dx10_43 d3dX11_42 d3dx11_43 d3dcompiler
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 
DRI_PRIME=1 /home/maria/.jogos/wines/3.5/bin/wine WormsRevolution.exe
#WormsRevolution.exe
