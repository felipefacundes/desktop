#!/bin/bash

#export PATH=/bin/
#export WINE=/home/maria/.jogos/wines/3.4-staging/bin/wine64
#export PATH=/home/maria/.jogos/wines/3.4-staging/bin/
#export WINEVERPATH=/home/maria/.jogos/wines/3.4-staging/bin/wine64
#export WINESERVER=/home/maria/.jogos/wines/3.4-staging/bin/wineserver
#export WINELOADER=/home/maria/.jogos/wines/3.4-staging/bin/wine64
#export WINEDLLPATH=
#export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/3.4-staging/lib32
#export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.4-staging/lib

cd "/home/maria/.jogos/wineprefixes/F1RacerStars/drive_c/F1 Race Stars/"
#cd "/home/maria/.jogos/wineprefixes/F1RacerStars/drive_c/F1 Race Stars/support/openal/"
WINEPREFIX=~/.jogos/wineprefixes/F1RacerStars/ wine F1RaceStars.exe -opengl
