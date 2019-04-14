#!/bin/bash
cd ~/.local/share/applications
rm -rf wine*
rm mimeinfo.cache

export TERM=xterm
export GALLIUM_HUD="fps"
export DXVK_HUD=1
#export DXVK_HUD=devinfo,fps
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/4.0-staging-git/bin/wine
#export PATH=/home/maria/.jogos/wines/4.0-staging-git/bin/
export WINEVERPATH=/home/maria/.jogos/wines/4.0-staging-git/bin/wine
export WINESERVER=/home/maria/.jogos/wines/4.0-staging-git/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/4.0-staging-git/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/4.0-staging-git/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/4.0-staging-git/lib64
#export WINEDEBUG=+fps

export WINEARCH=win64
#export vblank_mode=0
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
#export DRI_PRIME=1
export WINEPREFIX=/home/maria/.local/share/Steam/steamapps/compatdata/218230/pfx/
#winetricks physx gdiplus d3dcompiler_43 d3dcompiler_47 d3dx9 d3dx10 d3dx10_43 d3dx11_43 d3dx11_42 d3dx9 xact
#winetricks --force /usr/share/dxvk/x64/setup_dxvk_aur.verb
#winetricks -q dotnet462
#winetricks physx

#cd "/home/maria/.cache/winetricks/dxsdk_jun2010/"
cd "/home/maria/.local/share/Steam/steamapps/common/PlanetSide 2/"
/home/maria/.jogos/wines/4.0-staging-git/bin/wine PlanetSide2_x64.exe
#-opengl
#-dx9
# DXSDK_Jun10.exe
