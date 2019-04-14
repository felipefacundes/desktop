#!/bin/bash
cd ~/.local/share/applications
rm -rf wine*
rm mimeinfo.cache

export TERM=xterm
#export GALLIUM_HUD="cpu,fps"
#export PATH=/bin/
export WINE=/home/maria/.jogos/wines/3.20/bin/wine
#export PATH=/home/maria/.jogos/wines/3.20/bin/
export WINEVERPATH=/home/maria/.jogos/wines/3.20/bin/wine
export WINESERVER=/home/maria/.jogos/wines/3.20/bin/wineserver
export WINELOADER=/home/maria/.jogos/wines/3.20/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/home/maria/.jogos/wines/3.20/lib
export LD_LIBRARY64_PATH=/home/maria/.jogos/wines/3.20/lib64
#export WINEDEBUG=+fps

cd "/home/maria/.jogos/wineprefixes/sonarx2/drive_c/Program Files/Cakewalk/SONAR X2 Producer"
#cd "/home/maria/Downloads/Torrents/sonar x2/Install"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/
#cd /home/maria/.cache/winetricks/physx
#cd /home/maria/.cache/wine
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1 
#export vblank_mode=0
#export DRI_PRIME=1 
export WINEPREFIX=~/.jogos/wineprefixes/sonarx2/
#winetricks vcrun6sp6 vcrun2010
/home/maria/.jogos/wines/3.20/bin/wine "SONARPDR.exe"
#DXSDK_Jun10.exe
