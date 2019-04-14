#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="fps"
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/3.5/bin/wine
#export PATH=/home/maria/.jogos/wines/3.5/bin/
export WINEVERPATH=/home/maria/.jogos/wines/3.5/bin/wine
export WINESERVER=/home/maria/.jogos/wines/3.5/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/3.5/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/3.5/lib32
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.5/lib
export WINEDEBUG=+fps

cd "/home/maria/.jogos/wineprefixes/Crysis2/drive_c/Games/EmuCR-Dolphin-Triforce-3.0-697-x64"
export vblank_mode=0
WINEPREFIX=~/.jogos/wineprefixes/Crysis2/ /home/maria/.jogos/wines/3.5/bin/wine Dolphin.exe
#setup.exe
#DXSDK_Jun10.exe
#Blur.exe
