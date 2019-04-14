#!/bin/bash

export GALLIUM_HUD="cpu,fps"
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/2.14/bin/wine64
export PATH=/home/maria/.jogos/wines/2.14/bin/
export WINEVERPATH=/home/maria/.jogos/wines/2.14/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14/lib64
export WINEDEBUG=-all

cd "/home/maria/.jogos/wineprefixes/jgs_lutas/drive_c/BLADE ARCUS from Shining Battle Arena"
WINEPREFIX=~/.jogos/wineprefixes/jgs_lutas /home/maria/.jogos/wines/2.14/bin/wine64 game.exe
