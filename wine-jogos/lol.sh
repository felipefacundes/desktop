#!/bin/bash
# Para instalar a droga do LOL
# Tutorial fonte: https://appdb.winehq.org/objectManager.php?sClass=version&iId=36323&iTestingId=104834
#
#cd ~/.local/share/applications
#rm -rf wine*
#rm mimeinfo.cache
cd ~
rm -rf .wine
export TERM=xterm
#export GALLIUM_HUD="cpu,fps"
export WINE=/usr/bin/wine
#export PATH=/usr/bin/
export WINEVERPATH=/usr/bin/wine
export WINESERVER=/usr/bin/wineserver
export WINELOADER=/usr/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/usr/lib
export LD_LIBRARY64_PATH=/usr/lib32
#export WINEDEBUG=+fps
export WINEARCH=win32
export WINEPREFIX=~/.wine
/usr/bin/winetricks corefonts vcrun2017 d3dx9
/usr/bin/winetricks winetricks glsl=disabled
sleep 5
/usr/bin/winecfg
# Essa opção será depois de tudo instalado você irá indicar o binário (.exe) do LoL, da pasta Programs ou Arquivos de Programas
# Aí é só alterar e descomentar

#cd "diretório do .exe"
#export MESA_GLTHREAD=true __GL_THREADED_OPTIMIZATIONS=0 Arquivo.exe
