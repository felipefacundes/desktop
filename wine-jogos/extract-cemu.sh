  mkdir -p "$HOME"/.cemu/wine
  ln -s /usr/share/cemu/Cemu.exe "$HOME"/.cemu/Cemu.exe
  ln -s /usr/share/cemu/dbghelp.dll "$HOME"/.cemu/dbghelp.dll
  ln -s /usr/share/cemu/keystone.dll "$HOME"/.cemu/keystone.dll
  ln -s /usr/share/cemu/gameProfiles "$HOME"/.cemu/gameProfiles
  ln -s /usr/share/cemu/graphicPacks "$HOME"/.cemu/graphicPacks
  cp -r /usr/share/cemu/hfiomlc01 "$HOME"/.cemu/
  cp -r /usr/share/cemu/mlc01 "$HOME"/.cemu/
  cp -r /usr/share/cemu/shaderCache "$HOME"/.cemu/
