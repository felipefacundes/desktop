convert *.[jJpP][nNpP][gG] -density 300x300 -quality 100% imagem.pgm
pdftoppm *.pdf -gray out

for i in *.pgm;
do name=`echo $i | cut -d'.' -f1`;
echo $name;
convert *.pgm -depth 8 \
-colorspace Gray -type grayscale \
-channel rgba -alpha set -fuzz 50% \
-fill none -opaque white \
-fill white -opaque black \
-fill black -opaque none \
-colors 2 -strip \
-alpha off -negate -threshold 1% -density 300x300 -quality 100% "$i" "${name}.tif
rm imagem.pgm
tesseract imagem.tif texto -l por hocr
echo "Obrigado por converter imagem em texto com o OCR script de Roque Felipe, o destruidor desde os tempos mais primordios."
#rm *.tif
exit

