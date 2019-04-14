#!/bin/bash

export WINE=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export PATH=/home/maria/.jogos/wines/2.14-staging/bin/
export WINEVERPATH=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14-staging/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14-staging/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14-staging/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14-staging/lib64

cd "/home/maria/.jogos/wineprefixes/Commandos2/drive_c/GOG Games/Commandos 2"
WINEPREFIX=~/.jogos/wineprefixes/Commandos2/ /home/maria/.jogos/wines/2.14-staging/bin/wine64 comm2.exe
