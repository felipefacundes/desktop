#!/bin/bash

#!/bin/bash
#export PATH=/bin/
#export PATH=/home/maria/.jogos/wines/2.16/bin/
export WINE=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export WINEVERPATH=/home/maria/.jogos/wines/2.14-staging/bin/wine64
export WINESERVER=/home/maria/.jogos/wines/2.14-staging/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.14-staging/bin/wine64
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.14-staging/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.14-staging/lib64


cd "/home/maria/.jogos/wineprefixes/Cars2/drive_c/Program Files (x86)/Disney Interactive Studios/Carros 2"

WINEPREFIX=~/.jogos/wineprefixes/Cars2/ /home/maria/.jogos/wines/2.14-staging/bin/wine64 Game-Cars.exe

#winetricks -q d3dx9 d3dx10 d3dcompiler_43 d3dx11_42 d3dx11_43  
#/home/maria/.jogos/wines/2.16/bin/winecfg 64 Game-Cars.exe
