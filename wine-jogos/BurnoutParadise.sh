#!/bin/bash
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/2.18/bin/wine64
#export PATH=/home/maria/.jogos/wines/2.18/bin/
export WINEVERPATH=/home/maria/.jogos/wines/2.18/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.18/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.18/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.18/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.18/lib64
export WINEDEBUG=-all

cd "/home/maria/.jogos/wineprefixes/BurnoutParadise/drive_c/Burnout Paradise. The Ultimate Box"
WINEPREFIX=~/.jogos/wineprefixes/BurnoutParadise/ /home/maria/.jogos/wines/2.18/bin/wine64 BurnoutParadise.exe
