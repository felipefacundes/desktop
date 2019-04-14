#!/bin/bash
export TERM=xterm
export GALLIUM_HU
#export PATH=/bin/
#export PATH=/home/maria/.jogos/wines/2.14/bin/
#export WINE=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINEVERPATH=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINESERVER=/home/maria/.jogos/wines/3.4-staging/bin/wineserver
#export WINELOADER=/home/maria/.jogos/wines/3.4-staging/bin/wine
#export WINEDLLPATH=
#export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/3.4-staging/lib32
#export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.4-staging/lib
export WINEPREFIX=~/.jogos/wineprefixes/TheKingOffFse

#cd "/home/maria/Downloads/Tudo/Torrents/THE.KING.OF.FIGHTERS.XIV.STEAM.EDITION-CODEX/"
cd "/home/maria/.jogos/wineprefixes/TheKingOffFse/drive_c/Program Files (x86)/THE KING OF FIGHTERS XIV STEAM EDITION"
#cd "/home/maria/.jogos/wineprefixes/TheKingOffFse/drive_c/Program Files (x86)/THE KING OF FIGHTERS XIV STEAM EDITION/_CommonRedist/vcredist/2013"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/

export vblank_mode=0
export MESA_GL_VERSION_OVERRIDE=4.5 
export MESA_GLSL_VERSION_OVERRIDE=450 
export DRI_PRIME=1 

MESA_GL_VERSION_OVERRIDE=4.5 MESA_GLSL_VERSION_OVERRIDE=450 DRI_PRIME=1 wine kofxiv.exe
#DXSDK_Jun10.exe
