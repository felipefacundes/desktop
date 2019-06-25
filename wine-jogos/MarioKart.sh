Não te interessa. O que você está olhando aqui. vai tomar conta da sua vida.

export WINEARCH=win64
#export vblank_mode=0
#MESA_GL_VERSION_OVERRIDE=4.1 MESA_GLSL_VERSION_OVERRIDE=410 DRI_PRIME=1
#export DRI_PRIME=1

export WINEPREFIX=~/.jogos/wineprefixes/MarioKartTop/
#winetricks -q dotnet45 d3dx9 d3dx10 d3dcompiler_43 d3dx11_42 d3dx11_43 gdiplus vcrun2010 vcrun2012
cd "/home/maria/.jogos/wineprefixes/MarioKartTop/drive_c/MarioKart/WindowsNoEditor"
#cd /home/maria/.cache/winetricks/dxsdk_jun2010/

#winetricks gdiplus d3dcompiler_43 d3dcompiler_47 d3dx9 d3dx10 d3dx10_43 d3dx11_43 d3dx11_42 d3dx9 dxvk xact
/home/maria/.jogos/wines/4.0-staging/bin/wine UnrealKart.exe -SkipBuildPatchPrereq
#-OpenGL 
#DXSDK_Jun10.exe
