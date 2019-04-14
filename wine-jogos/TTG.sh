#!/bin/bash

#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/1.9.19/bin/wine64
export PATH=/home/maria/.jogos/wines/1.9.19/bin/
export WINEVERPATH=/home/maria/.jogos/wines/1.9.19/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/1.9.19/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/1.9.19/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/1.9.19/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/1.9.19/lib64


#cd /home/maria/.cache/winetricks/dxsdk_jun2010
cd "/home/maria/.jogos/wineprefixes/TTG/drive_c/Activision/Transformers - The Game"

#WINEPREFIX=~/.jogos/wineprefixes/TTG/ /home/maria/.jogos/wines/1.9.19/bin/winecfg;

WINEPREFIX=~/.jogos/wineprefixes/TTG/ /home/maria/.jogos/wines/1.9.19/bin/wine64 Transformers.exe
#DXSDK_Jun10.exe
