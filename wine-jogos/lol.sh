#!/bin/bash
# Felipe Facundes: https://t.me/winehq_linux
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
export WINEPREFIX=~/.LOL/
# Esta é uma opção que às vezes é necessária para alguns jogos
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
# Para tornar a prefix do wine preparada para 32bits. Opção necessária para alguns jogos:
export WINEARCH=win32
export vblank_mode=0
export DRI_PRIME=1

# Aqui prepara o Wine para o jogo poder rodar:        # Não use -> l3codecx     # Opção para winetricks: dlls list
/usr/bin/winetricks -q corefonts vcrun2017 mfc42 msxml4 vcrun6 riched20 wmp9 xact wmp10 vlc faudio quartz d3dx9 d3dcompiler_43 d3dcompiler_47 d3dx10 d3dx10_43 d3dx11_42 d3dx11_43 gdiplus
# Faça uma instalação manual do dxsdk_jun2010    # https://www.microsoft.com/en-us/download/details.aspx?id=6812
# Aqui é o caminho do jogo e pode ser alterado por você, de acordo com às suas necessidades:
cd ""

# Primeiro configurar o wine
#/usr/bin/winecfg
# Depois executar o instalador e depois o jogo
#/usr/bin/wine regsvr32 l3codecx.ax
/usr/bin/wine lol.exe

# Opções extras:
# programa.exe -opengl
# progrma.exe -dx9
# Nosso grupo do Telegram para ajudar o pessoal a rodar jogos do Windows no Linux. E para fazer pedidos de tutorial:
# https://t.me/winehq_linux
# Canal do telegram. Para os arquivos: mfc42.dll e l3codecx.ax só efetuar a busca com o hashtag: #ageofempires
# https://t.me/archLinux_pacotes
# Tutorial do wine, todavia fiz alterações para funcionar corretamente:
# https://appdb.winehq.org/objectManager.php?sClass=version&iId=29761&iTestingId=82749
# Dlls links:
# https://www.pconlife.com/download/winosfile/208/49/c4cce0cfb49fbcc0ad0596523839ccfc/
# https://www.dlldump.com/download-dll-files_new.php/dllfiles/M/mfc42.dll/6.0.400/download.html
# Codecs:  Baixe a versão Mega:  K-Lite_Codec_Pack_1494_Mega.exe  # Depois tem que configurar: às preferencias de codec e habilitar tudo.
# https://www.codecguide.com/download_kl.htm
