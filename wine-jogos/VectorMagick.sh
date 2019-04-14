#!/bin/bash
cd ~/.local/share/applications
rm -rf wine*
rm mimeinfo.cache

export TERM=xterm
#export GALLIUM_HUD="cpu,fps;primitives-generated"
#export PATH=/bin/
#export PATH=/home/maria/.jogos/wines/4.0-staging/bin/
export WINE=/home/maria/.jogos/wines/4.0-staging/bin/wine
export WINEVERPATH=/home/maria/.jogos/wines/4.0-staging/bin/wine
export WINESERVER=/home/maria/.jogos/wines/4.0-staging/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/4.0-staging/bin/wine
export WINEDLLPATH=/home/maria/.jogos/wines/4.0-staging/lib
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/4.0-staging/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/4.0-staging/lib64
#export WINEARCH=win64
export WINEPREFIX=~/.jogos/wineprefixes/VectorMagic/
export WINEDEBUG=-all

#cd "/home/maria/.jogos/wineprefixes/"Mudar o Nome"/drive_c/users/Phillipe/AppData/Roaming/Rovio/Angry Birds Star Wars/updates/Update"
#cd "/home/maria/.jogos/wineprefixes/"Mudar o Nome"/drive_c/Games/Rovio/Angry Birds"
#cd "/home/maria/.cache/winetricks/dxsdk_jun2010/"

cd  "/home/maria/.jogos/wineprefixes/VectorMagic/drive_c/Program Files (x86)/Vector Magic/"

/home/maria/.jogos/wines/4.0-staging/bin/wine vmde.exe

#winetricks --no-isolate xact_jun2010 wmp10

#d3dx9 d3dx10 d3dcompiler_43 d3dx11_42 d3dx11_43

# DXSDK_Jun10.exe
