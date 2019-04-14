#!/bin/bash

export PATH=/home/maria/.jogos/wines/2.14/bin/
export WINE=/home/maria/.jogos/wines/2.14/bin/wine64
export WINEVERPATH=/home/maria/.jogos/wines/2.14/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14/lib64


#cd "/home/maria/.jogos/wineprefixes/JogosAventura/drive_c/Games/LEGO Jurassic World"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010
cd "/home/maria/.jogos/wineprefixes/JogosAventura/drive_c/Games/Guns, Gore and Cannoli/"

WINEPREFIX=~/.jogos/wineprefixes/JogosAventura /home/maria/.jogos/wines/2.14/bin/wine64 ggc
#DXSDK_Jun10.exe


