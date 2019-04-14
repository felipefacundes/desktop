#!/bin/bash
cd ~/.local/share/applications
rm -rf wine*
rm mimeinfo.cache

export TERM=xterm
#export GALLIUM_HUD="fps"
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

#export vblank_mode=0
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
#export DRI_PRIME=1
#export DXVK_HUD=1
export DXVK_HUD=devinfo,fps
#winetricks --force /bin/setup_dxvk64
#winetricks --force /usr/share/dxvk/x64/setup_dxvk_aur.verb
#winetricks dxvk
export WINEPREFIX=~/.jogos/wineprefixes/grid2/ 

#cd "/home/maria/Downloads/Tudo/Torrents/GRID.2_RELOADED/rld-grid2"
cd "/home/maria/.jogos/wineprefixes/grid2/drive_c/Program Files (x86)/GRID 2"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd /home/maria/.cache/winetricks/physx
#cd /home/maria/.cache/wine
/home/maria/.jogos/wines/4.0-staging/bin/wine grid2.exe 
#-opengl
#-dx9
#setup.exe
#DXSDK_Jun10.exe
#Blur.exe
