convert *.jpg -density 300x300 -quality 100% imagem.pgm
convert *.png -density 300x300 -quality 100% imagem.pgm
pdftoppm *.pdf -gray out

for i in *.pgm;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
convert -density 300x300 -depth 8 \
-quality 100% -colorspace Gray -type grayscale \
-channel rgba -alpha set -fuzz 50% \
-fill none -opaque white \
-fill white -opaque black \
-fill black -opaque none \
-colors 256 -strip \
-alpha off -negate -threshold 1% -density 300x300 "$i" "${name}.pbm";
done

convert -density 300x300 -quality 100% *.pbm imagem.tif
rm *.pbm *.pgm *.png

tesseract imagem.tif texto -l por hocr
echo Obrigado por converter imagem em texto, com o Roque Felipe o destruidor desde os tempos mais primordios OCR script,
#rm *.tif
exit
