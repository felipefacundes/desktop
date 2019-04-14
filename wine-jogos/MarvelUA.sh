#!/bin/bash
#export PATH=/bin/
#export PATH=/home/maria/.jogos/wines/2.17-x86/bin/
export WINE=/home/maria/.jogos/wines/2.17-x86/bin/wine
export WINEVERPATH=/home/maria/.jogos/wines/2.17-x86/bin/wine
export WINESERVER=/home/maria/.jogos/wines/2.17-x86/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/2.17-x86/bin/wine
export WINEDLLPATH=/home/maria/.jogos/wines/2.17-x86/lib
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/2.17-x86/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/2.17-x86/lib64
export WINEARCH=win32
export WINEPREFIX=~/.jogos/wineprefixes/MarvelUA/

#cd "/home/maria/.jogos/wineprefixes/"Mudar o Nome"/drive_c/users/Phillipe/AppData/Roaming/Rovio/Angry Birds Star Wars/updates/Update"
#cd "/home/maria/.jogos/wineprefixes/"Mudar o Nome"/drive_c/Games/Rovio/Angry Birds"
#cd "/home/maria/.cache/winetricks/dxsdk_jun2010/"
#cd "/home/maria/Downloads/Tudo/Torrents/MUA"
cd "/home/maria/.jogos/wineprefixes/MarvelUA/drive_c/Program Files/Activision/Marvel - Ultimate Alliance"

/home/maria/.jogos/wines/2.17-x86/bin/wine game.exe
#GSGameExe_DX9.exe

#winetricks xact_jun2010 d3dx9 d3dx10 d3dcompiler_43 d3dx11_42 d3dx11_43 wmp10 vcrun6

# DXSDK_Jun10.exe
