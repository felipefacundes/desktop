#!/bin/bash

export WINE=/home/maria/.jogos/wines/2.14/bin/wine64
export PATH=/home/maria/.jogos/wines/2.14/bin/
export WINEVERPATH=/home/maria/.jogos/wines/2.14/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14/lib64


cd "/home/maria/.jogos/wineprefixes/JogosAventura/drive_c/Games/IGG-Slime.Rancher.v0.3.2/x64"
WINEPREFIX=~/.jogos/wineprefixes/JogosAventura/ /home/maria/.jogos/wines/2.14/bin/wine64 SlimeRancher.exe
