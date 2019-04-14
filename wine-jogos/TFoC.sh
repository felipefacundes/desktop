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
export WINEPREFIX=~/.jogos/wineprefixes/TFoC/

#cd "/home/maria/.jogos/wineprefixes/"Mudar o Nome"/drive_c/users/Phillipe/AppData/Roaming/Rovio/Angry Birds Star Wars/updates/Update"
#cd "/home/maria/.jogos/wineprefixes/"Mudar o Nome"/drive_c/Games/Rovio/Angry Birds"
#cd "/home/maria/.cache/winetricks/dxsdk_jun2010/"

#cd "/home/maria/Downloads/Tudo/Torrents/sr-tfoc"
cd "/home/maria/.jogos/wineprefixes/TFoC/drive_c/Program Files/Activision/Transformers Fall of Cybertron/Binaries"

/home/maria/.jogos/wines/2.17-x86/bin/wine TFOC

#winetricks xact_jun2010 d3dx9 d3dx10 d3dcompiler_43 d3dx11_42 d3dx11_43 vcrun6

# DXSDK_Jun10.exe
