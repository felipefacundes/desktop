#!/bin/bash
cd ~/.local/share/applications
rm -rf wine*
rm mimeinfo.cache

export TERM=xterm
#export GALLIUM_HUD="cpu,fps"
#export DXVK_HUD=1
export DXVK_HUD=devinfo,fps
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

export WINEARCH=win64
#export vblank_mode=0
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
export DRI_PRIME=1
export WINEPREFIX=~/.jogos/wineprefixes/JogosAventura
#winetricks physx gdiplus d3dcompiler_43 d3dcompiler_47 d3dx9 d3dx10 d3dx10_43 d3dx11_43 d3dx11_42 d3dx9 xact
#vcrun6sp6 vcrun2008 gdiplus corefonts d3dx9
#dxfullsetup physx
#winetricks --force /usr/share/dxvk/x64/setup_dxvk_aur.verb

cd "/home/maria/.local/share/Steam/steamapps/common/Paladins/Binaries/Win64/"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd /home/maria/.cache/winetricks/physx
/home/maria/.jogos/wines/4.0-staging/bin/wine Paladins.exe
#-SkipBuildPatchPrereq 
#-OpenGL
#-dx9
#DXSDK_Jun10.exe
