#!/bin/bash
# PlayOnGit - Scripts do Wine - para iniciar sem precisar de PlayOnLinux
# Licença: GPLv3
# Mantenedor: Felipe Facundes
# Faça o seu pedido de tutorial e GamePlay no nosso:
# Grupo Gamer do Telegram: https://t.me/winehq_linux
########### Este script irá usar o wine personalizado. Mas, você poderá usar um wine na versão e local de sua escolha
# Criar as pastas de estrutura para o binário isolado do wine - técnica para manipular diversos tipos de wine
cd ~
mkdir -p ~/.local/share/applications/wine/Programs/
mkdir -p ~/.jogos/wines/
mkdir -p ~/.jogos/icons/
mkdir -p ~/.jogos/libraries/dxvk/
mkdir -p ~/.jogos/scripts/run/
mkdir -p ~/.jogos/setups/
#mkdir -p ~/.jogos/wineprefixes/TheSims4/

# Criando o atalho .desktop
cd ~/.local/share/applications/
echo "#!/usr/bin/env xdg-open" > TheSims4.desktop
echo "[Desktop Entry]" >> TheSims4.desktop
echo "Name=The Sims 4" >> TheSims4.desktop
echo "Comment=Jogo ao estilo Second Life (brincar de "casinha" kkk)" >> TheSims4.desktop
echo "Categories=Game;" >> TheSims4.desktop
echo "Exec=/home/$USER/.jogos/scripts/run/TheSims4-run.sh" >> TheSims4.desktop
echo "Type=Application" >> TheSims4.desktop
echo "StartupNotify=true" >> TheSims4.desktop
echo "Icon=/home/$USER/.jogos/icons/TheSims4.png" >> TheSims4.desktop
echo "Terminal=false" >> TheSims4.desktop

# Essa é a versão escolhida do Wine
export TERM=xterm
# Para ver o FPS na tela, para CPU, inclua cpu,fps
#export GALLIUM_HUD="fps"
#export WINE=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wine
export WINE=~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine
#export WINEVERPATH=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wine
export WINEVERPATH=~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine
#export WINESERVER=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wineserver
export WINESERVER=~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wineserver
#export WINELOADER=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wine
export WINELOADER=~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine
#export WINEDLLPATH=$WINEPATH”~/.jogos/wines/wine-staging-4.9-1-x86_64/lib/wine/fakedlls”
#export LD_LIBRARY32_PATH=~/.jogos/wines/Proton-4.6-GE-2/dist/lib/
export LD_LIBRARY32_PATH=~/.jogos/wines/wine-staging-4.9-1-x86_64/lib32/
#export LD_LIBRARY64_PATH=~/.jogos/wines/Proton-4.6-GE-2/dist/lib64/
export LD_LIBRARY64_PATH=~/.jogos/wines/wine-staging-4.9-1-x86_64/lib/

export WINEDEBUG=-all
# Prefix do wine, destino do prefix individual para cada jogo é melhor e evita futuras falhas
export WINEPREFIX=~/.jogos/wineprefixes/TheSims4
# Esta é uma opção que às vezes é necessária para alguns jogos
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
# Para tornar a prefix do wine preparada para 32bits ou 64bits. Opção necessária para alguns jogos:
export WINEARCH=win64
export WINEESYNC=0
export vblank_mode=0
export DRI_PRIME=1
export DXVK_HUD=1


# Aqui é o caminho do jogo e pode ser alterado por você, de acordo com às suas necessidades:
cd "/home/$USER/.jogos/wineprefixes/TheSims4/drive_c/Program Files (x86)/Origin"
~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine Origin.exe


# Irá abrir a localização e o script de inicialização do jogo:
#xdg-open "/home/$USER/.jogos/wineprefixes/TheSims4/drive_c/Program Files (x86)/"
#xdg-open ~/.jogos/scripts/run/TheSims4-run.sh

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

#
#                    ,cldxOxoc:;,
#               ,;:okKNXKK0kO0Okxddol:;,
#        ,;codxkkOKXKko:'......,;clx0KXXOxol:,
#   :lodxxdololc:,'..................,cdk00kxkOkxoc,
#  ;XOxdl:,..  .......................... ..,;lx0XNx
#  lX0c      ..;dddddooooollll,............     .0XO'
#  oKK;    ....0NNXXKKK00OOOkx'.............     x0x,
#  lXX;   ....,WWNNNKdddoooooc.'..............   okk,
#  cXW:  .....xWWWWWl''''''''''''''............  dd0,
#  :OWo ......NMMMMWOkkkkxxxc''''''''.......... .kxK'
#  ,dKk .....lWWWWMMMWWWNNNX:,''''''''...........KOx'
#  ,lk0......ONNNWWddddddddo,,,,,''''''.........lNOc'
#  'cdk;....;KXXXNO''',,,,,,,ddddoooolllccc:....0WO,'
#  ',ddd....o0KKKXl'',,,,,,,lWWNNNXXKKK00OOc...,0Xx'
#   'llo;...kO00K0,'',,,,,,,0MWWWN0OOOkkkxx'...oxK;'
#   ',xcl..,lloool''',,,,,,:WWMMMX''''''......cxko'
#    ':x:c......''''''',,,,xNWWWM0dddddool...:00O,'
#     'ld::.......'''''',,,KNNNWWWMMMWWWWx..;XXK;'
#      'dd::.......'''''''lKXXNN0kkOOOkkk;.;0KK;'
#       'ox::........'''''x0KKKX;'''......lK0k;'
#        'cx:c,........'.,OO00KO........'kN0o,'
#         ',dllc'........lkkOO0c.......:KNk:'
#           ':lldc.......oodddd'.....,d0Oc,'
#            ',:ldxl'..............'lxxo;,'
#              ',;lx0x;..........,cldo:'
#               '',cxXXd,....,cdxkd:'
#                   ',;o0N0odkkkk,'
#                     ',;lxdl:,'
#
# Tutorial by:
#  ___    _             ___                     _
# | __|__| (_)_ __  ___| __|_ _ __ _  _ _ _  __| |___ ___
# | _/ -_) | | '_ \/ -_) _/ _` / _| || | ' \/ _` / -_|_-<
# |_|\___|_|_| .__/\___|_|\__,_\__|\_,_|_||_\__,_\___/__/
#            |_|
#
# ┏┓
# ┃┃╱╲ nesta
# ┃╱╱╲╲ casa
# ╱╱╭╮╲╲ todos
# ▔▏┗┛▕▔ usam
# ╱▔▔▔▔▔▔▔▔▔▔╲
# LINUX
# ╱╱┏┳┓╭╮┏┳┓ ╲╲
# ▔▏┗┻┛┃┃┗┻┛▕▔
# -------------------------





# Oções descartadas:


#cd ~/.local/share/applications
#rm -rf wine*

#cd ~/.jogos/wineprefixes/TheSims4/drive_c/windows/system32/
#rm ntdll.dll
#wget -nc https://www.dlldump.com/dllfiles/N/ntdll.dll
#~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine regsvr32 ntdll.dll

#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x64/* ~/.jogos/wineprefixes/TheSims4/drive_c/windows/syswow64/
#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x32/* ~/.jogos/wineprefixes/TheSims4/drive_c/windows/system32/

#~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine regsvr32 l3codecx.ax
#~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine regsvr32.exe /n /i d3d10.dll
#~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine regsvr32.exe /n /i d3d10_1.dll
#~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine regsvr32.exe /n /i d3d10core.dll
#~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine regsvr32.exe /n /i d3d11.dll
#~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine regsvr32.exe /n /i dxgi.dll
