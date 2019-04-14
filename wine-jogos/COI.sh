#!/bin/bash
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export PATH=/home/maria/.jogos/wines/2.14-staging/bin/
export WINEVERPATH=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14-staging/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14-staging/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14-staging/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14-staging/lib64

cd "/home/maria/.jogos/wineprefixes/COI/drive_c/Castle of Illusion"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010

WINEPREFIX=~/.jogos/wineprefixes/COI /home/maria/.jogos/wines/2.14-staging/bin/wine64 COI.exe

#DXSDK_Jun10.exe


