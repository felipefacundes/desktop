#!/bin/bash
# PlayOnGit - Scripts do Wine - para iniciar sem precisar de PlayOnLinux, Proton ou Lutris, inicie direto do menu iniciar com um desempenho muito melhor e superior.
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
#mkdir -p ~/.jogos/wineprefixes/steam/

cd ~/.jogos/scripts/run/
wget -nc https://raw.githubusercontent.com/felipefacundes/desktop/master/wine-jogos/runs/steam-run.sh
chmod +x steam-run.sh
cd ~/.jogos/icons/
wget -nc https://raw.githubusercontent.com/felipefacundes/desktop/master/wine-jogos/icons/steam.png
cd ~/.jogos/scripts/
wget -nc https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
cd ~/.jogos/wines/
rm -rf wine-staging-4.8-1-x86_64
wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/wine-staging-4.8-1-x86_64.tar.xz
tar -xf wine-staging-4.8-1-x86_64.tar.xz

# Criando o atalho .desktop
cd ~/.local/share/applications/
echo "#!/usr/bin/env xdg-open" > steam.desktop
echo "[Desktop Entry]" >> steam.desktop
echo "Name=Steam Windows" >> steam.desktop
echo "Comment=Rode Jogos do Windows no Linux" >> steam.desktop
echo "Categories=Game;" >> steam.desktop
echo "Exec=/home/$USER/.jogos/scripts/run/steam-run.sh" >> steam.desktop
echo "Type=Application" >> steam.desktop
echo "StartupNotify=true" >> steam.desktop
echo "Icon=/home/$USER/.jogos/icons/steam.png" >> steam.desktop
echo "Terminal=false" >> steam.desktop

# Essa é a versão escolhida do Wine
export TERM=xterm
# Para ver o FPS na tela, para CPU, inclua cpu,fps
#export GALLIUM_HUD="fps"
#export WINE=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wine
export WINE=~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine
#export WINEVERPATH=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wine
export WINEVERPATH=~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine
#export WINESERVER=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wineserver
export WINESERVER=~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wineserver
#export WINELOADER=~/.jogos/wines/Proton-4.6-GE-2/dist/bin/wine
export WINELOADER=~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine
#export WINEDLLPATH=$WINEPATH”~/.jogos/wines/wine-staging-4.8-1-x86_64/lib/wine/fakedlls”
#export LD_LIBRARY32_PATH=~/.jogos/wines/Proton-4.6-GE-2/dist/lib/
export LD_LIBRARY32_PATH=~/.jogos/wines/wine-staging-4.8-1-x86_64/lib32/
#export LD_LIBRARY64_PATH=~/.jogos/wines/Proton-4.6-GE-2/dist/lib64/
export LD_LIBRARY64_PATH=~/.jogos/wines/wine-staging-4.8-1-x86_64/lib/

export WINEDEBUG=-all
# Prefix do wine, destino do prefix individual para cada jogo é melhor e evita futuras falhas
export WINEPREFIX=~/.jogos/wineprefixes/steam
# Esta é uma opção que às vezes é necessária para alguns jogos
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
# Para tornar a prefix do wine preparada para 32bits ou 64bits. Opção necessária para alguns jogos:
export WINEARCH=win64
export WINEESYNC=0
export vblank_mode=0
export DRI_PRIME=1
export DXVK_HUD=1

# Aqui prepara o Wine para o jogo poder rodar:        # Não use -> l3codecx     # Opção para winetricks: dlls list           galliumnine vulkansdk steam
~/.jogos/scripts/winetricks -q corefonts vlc d3dx9 vcrun2012 xact d3dcompiler_43 d3dcompiler_47 d3dx10 d3dx10_43 d3dx11_42 d3dx11_43 gdiplus
~/.jogos/scripts/winetricks autostart_winedbg=disable csmt=off hosts

cd ~/.jogos/setups/
wget -nc https://sdk.lunarg.com/sdk/download/latest/windows/vulkan-sdk.exe
~/.jogos/wines/wine-staging-4.9-1-x86_64/bin/wine vulkan-sdk.exe /S
# Faça uma instalação manual do dxsdk_jun2010    # https://www.microsoft.com/en-us/download/details.aspx?id=6812
# vamos instalar o DXSDK
mkdir -p ~/.jogos/setups/DXSDK_Jun10/
cd ~/.jogos/setups/DXSDK_Jun10/
#wget -nc https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe -O DXSDK_Jun10.exe
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine DXSDK_Jun10.exe

# Para DXVK - SOMENTE IRÁ FUNCIONAR SE O VULKAN DA SUA PLACA ESTIVER HABILITADO
cd ~/.jogos/libraries/dxvk/
wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/dxvk/dxvk-1.2.1.tar.gz
wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/dxvk/d9vk/d9vk-0.12.tar.gz
tar -xf dxvk-1.2.1.tar.gz
tar -xf d9vk-0.12.tar.gz

bash ~/.jogos/libraries/dxvk/d9vk-0.12/setup_dxvk.sh install
bash ~/.jogos/libraries/dxvk/dxvk-1.2.1/setup_dxvk.sh install

# Executar o instalador e depois o jogo

~/.jogos/scripts/winetricks -q win7
# Primeiro configurar o wine
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/winecfg

cd ~/.jogos/setups/
wget -nc https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe
~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine SteamSetup.exe /S
# Aqui é o caminho do jogo e pode ser alterado por você, de acordo com às suas necessidades:
cd "/home/$USER/.jogos/wineprefixes/steam/drive_c/Program Files (x86)/Steam/"
~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine Steam.exe


# Irá abrir a localização e o script de inicialização do jogo:
#xdg-open ~/.jogos/wineprefixes/steam/drive_c/
#xdg-open ~/.jogos/scripts/run/steam-run.sh

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Instalação FINALIZADA com SUCESSO"
echo "Acesse o seu programa no: \"Menu inciar > Jogos"\"
echo "Criação de Felipe Facundes"
echo "Acesse nosso grupo do Telegram:"
echo "https://t.me/winehq_linux"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
pkill -9 .exe
notify-send "Instalação FINALIZADA com SUCESSO."
sleep 15
notify-send "Se quiser, pode fechar o terminal."

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

#cd ~/.jogos/wineprefixes/steam/drive_c/windows/system32/
#rm ntdll.dll
#wget -nc https://www.dlldump.com/dllfiles/N/ntdll.dll
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine regsvr32 ntdll.dll

#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x64/* ~/.jogos/wineprefixes/steam/drive_c/windows/syswow64/
#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x32/* ~/.jogos/wineprefixes/steam/drive_c/windows/system32/

#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine regsvr32 l3codecx.ax
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine regsvr32.exe /n /i d3d10.dll
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine regsvr32.exe /n /i d3d10_1.dll
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine regsvr32.exe /n /i d3d10core.dll
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine regsvr32.exe /n /i d3d11.dll
#~/.jogos/wines/wine-staging-4.8-1-x86_64/bin/wine regsvr32.exe /n /i dxgi.dll
