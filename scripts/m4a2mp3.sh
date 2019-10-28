# Crédito: Felipe Facundes
# Telegram: @FeFacundes
for i in *.[mM][4][aA];
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" -acodec copy -vn -n "${name}.mp3";
done 
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Criação de Felipe Facundes"
echo "Telegram: @FeFacundes"
echo "Acesse nosso grupo do Telegram:"
echo "https://t.me/winehq_linux"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
