#!/bin/bash

#cd ~/.local/share/applications
#rm -rf wine*
export TERM=xterm
#export GALLIUM_HUD="cpu,fps"
#export PATH=/bin/
export WINE=/usr/bin/wine
export WINEVERPATH=/usr/bin/wine
export WINESERVER=/usr/bin/wineserver
export WINELOADER=/usr/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/usr/bin/lib32
export LD_LIBRARY64_PATH=/usr/bin/lib
#export WINEDEBUG=+fps
export WINEPREFIX=~/.LoL/
# Esta é uma opção que às vezes é necessária para alguns jogos
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
# Para tornar a prefix do wine preparada para 32bis. Opção necessária para alguns jogos:
#export WINEARCH=win32
export vblank_mode=0
export DRI_PRIME=1

# Aqui prepara o Wine para o jogo poder rodar:
/usr/bin/winetricks corefonts vcrun2017 d3dx9
/usr/bin/winetricks winetricks glsl=disabled
# Aqui é o caminho do jogo:
cd ""

/usr/bin/wine Setup.exe

# Opções extras:
# programa.exe -opengl
# progrma.exe -dx9
