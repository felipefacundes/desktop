#!/bin/bash

#export GALLIUM_HUD="cpu,fps;primitives-generated"
#export PATH=/bin/
#export PATH=/home/maria/.jogos/wines/2.18-x86/bin/
export WINE=/home/maria/.jogos/wines/2.18-x86/bin/wine
export WINEVERPATH=/home/maria/.jogos/wines/2.18-x86/bin/wine
export WINESERVER=/home/maria/.jogos/wines/2.18-x86/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.18-x86/bin/wine
export WINEDLLPATH=/home/maria/.jogos/wines/2.18-x86/lib
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.18-x86/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.18-x86/lib64
export WINEARCH=win32
export WINEPREFIX=~/.jogos/wineprefixes/illustrator_cs6/
export WINEDEBUG=-all


#cd "/home/maria/.cache/winetricks/dxsdk_jun2010/"

cd "/home/maria/Downloads/Tudo/Torrents/Adobe Illustrator CC 2017/x86"

#winetricks atmlib msxml3

/home/maria/.jogos/wines/2.18-x86/bin/wine CreativeCloudSet-Up.exe #setup.exe

#winetricks --no-isolate xact_jun2010 wmp10

#d3dx9 d3dx10 d3dcompiler_43 d3dx11_42 d3dx11_43

# DXSDK_Jun10.exe
