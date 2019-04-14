#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="cpu,fps"
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export PATH=/home/maria/.jogos/wines/3.4-staging/bin/
export WINEVERPATH=/home/maria/.jogos/wines/3.4-staging/bin/wine
export WINESERVER=/home/maria/.jogos/wines/3.4-staging/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/3.4-staging/lib32
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.4-staging/lib
#export WINEDEBUG=+fps

cd "/home/maria/.jogos/wineprefixes/Blur/drive_c/Program Files (x86)/R.G. Mechanics/Blur"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd "/home/maria/Downloads/Tudo/Torrents/Blur/"
#cd /home/maria/.cache/winetricks/physx
#cd /home/maria/.cache/wine
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1 
export vblank_mode=0
export DRI_PRIME=1 
export WINEPREFIX=~/.jogos/wineprefixes/Blur/ 
/home/maria/.jogos/wines/3.4-staging/bin/wine Blur.exe -opengl
#setup.exe
#DXSDK_Jun10.exe
#Blur.exe
