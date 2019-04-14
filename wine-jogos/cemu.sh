#!/bin/bash
cd ~/.local/share/applications
rm -rf wine*
rm mimeinfo.cache

export TERM=xterm
#export GALLIUM_HUD="cpu,fps"
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

#cd "/home/maria/Documentos/Roque/Tudo/1 prioridade para organizar/pdf2music"
#cd "/home/maria/.jogos/wineprefixes/cemu/drive_c/Program Files/cemu_1.15.0/"
cd "/home/maria/Downloads/Tudo/Jogos/roms/WiiU/Cemu/cemu_1.15.0/"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd /home/maria/.cache/winetricks/physx
#cd /home/maria/.cache/wine
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1 
export vblank_mode=0
export DRI_PRIME=1 
export WINEPREFIX=~/.jogos/wineprefixes/cemu/
#winetricks d3dcompiler_43 d3dcompiler_47 d3dx9 d3dx10 d3dx10_43 d3dx11_43 d3dx11_42 vcrun2008 vcrun2010 vcrun2017 dxvk physx
#dxfullsetup physx
#vcrun6sp6 vcrun2008 gdiplus corefonts d3dx9
/home/maria/.jogos/wines/4.0-staging/bin/wine Cemu
#DXSDK_Jun10.exe
