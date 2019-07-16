Não te interessa, está tentando ver o que aqui? Vai tomar conta da sua vida. 

#export vblank_mode=0
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
#export DRI_PRIME=1
export WINEPREFIX=/home/$USER/.local/share/Steam/steamapps/compatdata/218230/pfx/
#winetricks physx gdiplus d3dcompiler_43 d3dcompiler_47 d3dx9 d3dx10 d3dx10_43 d3dx11_43 d3dx11_42 d3dx9 xact
#winetricks --force /usr/share/dxvk/x64/setup_dxvk_aur.verb
#winetricks -q dotnet462
#winetricks physx

PlanetSide2_x64.exe

#-opengl
#-dx9
# DXSDK_Jun10.exe
