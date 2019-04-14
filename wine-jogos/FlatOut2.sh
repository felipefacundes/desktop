#!/bin/bash

export GALLIUM_HUD="cpu,fps"
#export GALLIUM_HUD=".w256.h64.x1600.y520.d.c1000fps+cpu,.datom-count"
#export GALLIUM_HUD="fps"
#export PATH=/bin/
export PATH=/home/maria/.jogos/wines/2.14/bin/
export WINE=/home/maria/.jogos/wines/2.14/bin/wine64
export WINEVERPATH=/home/maria/.jogos/wines/2.14/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14/lib64
export WINEDEBUG=-all

cd "/home/maria/.jogos/wineprefixes/FlatOut2/drive_c/GOG Games/FlatOut 2/"
WINEPREFIX=~/.jogos/wineprefixes/FlatOut2/ /home/maria/.jogos/wines/2.14/bin/wine64 "FlatOut2.exe"
#export GALLIUM_HUD="fps"
GALLIUM_HUD=".w256.h64.x1600.y520.d.c1000fps+cpu,.datom-count"
