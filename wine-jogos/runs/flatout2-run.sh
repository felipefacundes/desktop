#!/bin/bash
# PlayOnGit - Inicie seus Jogos direto do menu iniciar, sem precisar de PlayOnLinux, Proton ou Lutris, e com um desempenho muito melhor e superior.
# Licença: GPLv3
# Mantenedor: Felipe Facundes
# Faça o seu pedido de tutorial e GamePlay no nosso:
# 既 Grupo 調 Gamer do 切 Telegram 切: https://t.me/winehq_linux
########### Este script irá usar o wine personalizado. Mas, você poderá usar um wine na versão e local de sua escolha
WV=wine-staging-4.0-1-x86_64
GN=flatout2
SN="FlatOut 2"
CME="Jogo de corrida de demolição"


# Essa é a versão escolhida do Wine
export TERM=xterm
# Para ver o FPS na tela, para CPU, inclua cpu,fps
export GALLIUM_HUD="fps"
W=~/.jogos/wines/$WV
export WINE=$W/bin/wine
export WINEVERPATH=$W
export WINEPATH=$W/bin:$WINEPATH
export WINESERVER=$W/bin/wineserver
export WINELOADER=$W/bin/wine
export WINEDLLPATH=$W/lib/wine/fakedlls
export LD_LIBRARY_PATH="$W/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY32_PATH="$W/lib32:$LD_LIBRARY32_PATH"
export LD_LIBRARY64_PATH="$W/lib:$LD_LIBRARY64_PATH"
#$W/bin/wine "cmd"

export WINEDEBUG=-all
# Prefix do wine, destino do prefix individual para cada jogo é melhor e evita futuras falhas
export WINEPREFIX=~/.jogos/wineprefixes/$GN
# Esta é uma opção que às vezes é necessária para alguns jogos
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
# Para tornar a prefix do wine preparada para 32bits ou 64bits. Opção necessária para alguns jogos:
export WINEARCH=win64
export WINEESYNC=0
export vblank_mode=0
# Para placas gráficas híbridas use o DRI_PRIME=1
#export DRI_PRIME=1
#export DXVK_LOG_LEVEL=none
#export DXVK_HUD=1

# Configurar o wine
#$W/bin/winecfg

#⛔⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⛔
#  _          _                     _ _       _                       _           _
# | |        (_)                   | (_)     | |                     | |         (_)              ▏▏
# | |     ___ _  __ _    __ _ ___  | |_ _ __ | |__   __ _ ___    __ _| |__   __ _ ___  _____      ▏▏
# | |    / _ \ |/ _` |  / _` / __| | | | '_ \| '_ \ / _` / __|  / _` | '_ \ / _` | \ \/ / _ \     ▏▏
# | |___|  __/ | (_| | | (_| \__ \ | | | | | | | | | (_| \__ \ | (_| | |_) | (_| | |>  < (_) |    ▏▏
# \_____/\___|_|\__,_|  \__,_|___/ |_|_|_| |_|_| |_|\__,_|___/  \__,_|_.__/ \__,_|_/_/\_\___/     ⧩
#⛔⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⛔
# Logo abaixo é o CAMINHO do instalador do jogo e pode ser alterado por você, de acordo com às suas necessidades:
# Coloque o endereço da PASTA entre às "ASPAS" e mude o nome do executável do instalador.
# Respeitando as Letras MAÍUSCULAS e minúsculas. Exemplo: Setup.exe
#⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬

#cd "/home/$USER/.jogos/wineprefixes/flatout2/drive_c/GOG Games/FlatOut 2"
cd "/home/$USER/.jogos/wineprefixes/$GN/drive_c/flatout2_demo"
$W/bin/wine FlatOut2.exe

#⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫
### Só altere essas DUAS linhas ACIMA, como já explicado.
#⛔◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭⛔
#   _        _                _
#  | |   ___(_)__ _   __ _ __(_)_ __  __ _    ◭
#  | |__/ -_) / _` | / _` / _| | '  \/ _` |   ▏▏
#  |____\___|_\__,_| \__,_\__|_|_|_|_\__,_|   ▏▏
#       ____
#  _  _ ____ ____    _  _ ____ _  _ ____    _  _ ____ ____    ___  ____ _  _ ____ _ ____    _    _ _  _ _  _ ____ ____
#  |\ | |__| |  |    |\/| |___  \/  |__|    |\ | |__| [__     |  \ |___ |\/| |__| | [__     |    | |\ | |__| |__| [__
#  | \| |  | |__|    |  | |___ _/\_ |  |    | \| |  | ___]    |__/ |___ |  | |  | | ___]    |___ | | \| |  | |  | ___]
#⛔ Não mexa nas demais linhas, deixa do jeito que está.                                                              ⛔

# Irá abrir a localização e o script de inicialização do jogo:
#xdg-open ~/.jogos/wineprefixes/$GN/drive_c/
#xdg-open ~/.jogos/scripts/run/$GN-run.sh





























################################# 喇 MPV Player 懶 喇
#pkill -9 .exe
#cd ~/.jogos/setups/
#wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/codecs-and-players/mpv.tar.xz
#tar -xf mpv.tar.xz
#cd ~/.jogos/setups/mpv
# $W/bin/wineconsole mpv-install.bat

################################# Opções extras:
# Opções da $GN: https://developer.valvesoftware.com/wiki/Command_Line_Options
#-insecure
#-forcenovsync
#-nojoy
#-fullscreen ou -full
#-applaunch 230410
# Acima são opções da $GN
#
# programa.exe -opengl
# progrma.exe -dx9
#
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
#                   ',視嗢荒華者喝啕喙調﬏磌,'
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





################################# Oções descartadas:

#cd ~/.local/share/applications
#rm -rf wine*

#cd ~/.jogos/wineprefixes/$GN/drive_c/windows/system32/
#rm ntdll.dll
#wget -nc https://www.dlldump.com/dllfiles/N/ntdll.dll
# $W/bin/wine regsvr32 /i /S ntdll.dll

# INSTALE O DXVK - Manualmente

#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x64/* ~/.jogos/wineprefixes/Origin/drive_c/windows/system32/
#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x32/* ~/.jogos/wineprefixes/Origin/drive_c/windows/syswow64/

#$W/bin/wine regsvr32 /i /S l3codecx.ax
#~/.jogos/scripts/winetricks d3d10=native d3d10_1=native d3d10core=native d3d11=native dxgi=native
