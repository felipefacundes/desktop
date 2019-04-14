#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="fps"
#export PATH=/home/maria/.jogos/wines/2.18/bin/
#export WINE=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINEVERPATH=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINESERVER=/home/maria/.jogos/wines/3.4-staging/bin/wineserver
#export WINELOADER=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINEDLLPATH=
#export LD _LIBRARY32_PATH=/home/maria/.jogos/wines/3.4-staging/lib
#export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.4-staging/lib64

#cd "/home/maria/.jogos/wineprefixes/worms/drive_c/Program Files (x86)/Team 17/Worms Revolution - Gold Edition/"
export WINEPREFIX=~/.jogos/wineprefixes/ironsight/ 
#winetricks -q d3dx9 d3dx10 d3dx10_43 d3dx11_42 d3dx11_43 d3dcompiler_43 steam dotnet45
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 
#DRI_PRIME=1 /home/maria/.jogos/wines/3.5/bin/wine WormsRevolution.exe
#WormsRevolution.exe

export vblank_mode=0
#cd "/home/maria/.local/share/Steam/steamapps/common/War Thunder"
DRI_PRIME=1 wine ~/Ironsight_US_downloader.exe
