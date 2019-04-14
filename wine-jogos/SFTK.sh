#!/bin/bash

export TERM=xterm

export WINE=/home/maria/.jogos/wines/1.9.16/bin/wine64
export WINEVERPATH=/home/maria/.jogos/wines/1.9.16/bin/wine64
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/1.9.16/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/1.9.16/lib64

cd "/home/maria/.jogos/wineprefixes/SSFIV/drive_c/Street Fighter X Tekken"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010

WINEPREFIX=~/.jogos/wineprefixes/SSFIV /home/maria/.jogos/wines/1.9.16/bin/wine64 SFTK.exe
#DXSDK_Jun10.exe


