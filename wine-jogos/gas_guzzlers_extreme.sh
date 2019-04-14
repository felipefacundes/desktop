#!/bin/bash

export TERM=xterm
export GALLIUM_HUD="fps"
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/4.0-staging/bin/wine
#export PATH=/home/maria/.jogos/wines/4.0-staging/bin/
export WINEVERPATH=/home/maria/.jogos/wines/4.0-staging/bin/wine
export WINESERVER=/home/maria/.jogos/wines/4.0-staging/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/4.0-staging/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/4.0-staging/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/4.0-staging/lib64
#export WINEDEBUG=+fps

#cd "/home/maria/Downloads/Tudo/Torrents/Gas Guzzlers Dilogy/02 Gas Guzzlers Extreme/"
cd "/home/maria/.jogos/wineprefixes/gasguzzlersextreme/drive_c/Program Files (x86)/Gas Guzzlers Extreme/Bin32/"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd /home/maria/.cache/winetricks/physx
#cd /home/maria/.cache/wine
export WINEPREFIX=~/.jogos/wineprefixes/gasguzzlersextreme/ 
#export vblank_mode=0
#export DRI_PRIME=1
#winetricks gdiplus d3dcompiler_43 d3dcompiler_47 d3dx9 d3dx10 d3dx10_43 d3dx11_43 d3dx11_42 d3dx9 dxvk xact physx
/home/maria/.jogos/wines/4.0-staging/bin/wine GasGuzzlers.exe -dx11
#-opengl
#-dx9
#setup.exe
#DXSDK_Jun10.exe
#Blur.exe
