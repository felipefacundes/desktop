convert *.jpg -density 300x300 -quality 100% imagem.pgm
convert *.png -density 300x300 -quality 100% imagem.pgm
pdftoppm *.pdf -gray out

for i in *.pgm;
do name=`echo $i | cut -d'.' -f1`;
echo $name;
convert -density 300x300 -depth 16 \
-fuzz 50% -fill none -opaque white \
-fill white -opaque black \
-fill black -opaque none \
-alpha off -negate -quality 100% "$i" "${name}.pbm";
done
#-sampling-factor 4:2:0
#-define jpeg:dct-method=float

convert -density 300x300 -quality 100% *.pbm imagem.tif
rm *.pbm *.pgm *.png

#tesseract imagem.tif texto -l por hocr
echo Obrigado por converter imagem em texto, com o Roque Felipe o destruidor desde os tempos mais primordios OCR script,
#rm *.tif
exit
