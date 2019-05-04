#!/bin/bash
########### Este script irá usar o wine do sistema. Mas, você poderá usar um wine na versão e local de sua escolha
#cd ~/.local/share/applications
#rm -rf wine*
export TERM=xterm
#export GALLIUM_HUD="cpu,fps"
export WINE=/usr/bin/wine
export WINEVERPATH=/usr/bin/wine
export WINESERVER=/usr/bin/wineserver
export WINELOADER=/usr/bin/wine
#export WINEDLLPATH=
export LD_LIBRARY32_PATH=/usr/bin/lib32
export LD_LIBRARY64_PATH=/usr/bin/lib
#export WINEDEBUG=+fps
# Prefix do wine, destino do prefix individual para cada jogo é melhor e evita futuras falhas
export WINEPREFIX=~/.age_of_empires_III/
# Esta é uma opção que às vezes é necessária para alguns jogos
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
# Para tornar a prefix do wine preparada para 32bits. Opção necessária para alguns jogos:
#export WINEARCH=win32
export vblank_mode=0
export DRI_PRIME=1

# Aqui prepara o Wine para o jogo poder rodar:
/usr/bin/winetricks corefonts d3dx9 quartz mfc42 l3codecx msxml4 vcrun6 riched20
# Aqui é o caminho do jogo:
cd ""

# Primeiro configurar o wine
/usr/bin/winecfg
# Depois executar o instalador e depois o jogo
#/usr/bin/wine Setup.exe

# Opções extras:
# programa.exe -opengl
# progrma.exe -dx9
