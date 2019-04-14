#!/bin/bash

#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/2.14/bin/wine64
export PATH=/home/maria/.jogos/wines/2.14/bin/
export WINEVERPATH=/home/maria/.jogos/wines/2.14/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14/lib64

cd "/home/maria/.jogos/wineprefixes/AvP/drive_c/Rebellion/Aliens vs. Predator Classic 2000"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010

WINEPREFIX=~/.jogos/wineprefixes/AvP/ /home/maria/.jogos/wines/2.14/bin/wine64 AvP_Classic.exe
