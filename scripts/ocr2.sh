convert *.jpg -density 300x300 -quality 100 imagem.pgm
convert *.png -density 300x300 -quality 100 imagem.pgm
pdftoppm *.pdf -gray out

for i in *.pgm;
do name=`echo $i | cut -d'.' -f1`;
echo $name;
convert -adaptive-resize 2480x3508 -contrast-stretch 0,3% \
-normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB \
-depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 \
-strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0 \
-sampling-factor 4:2:0 "$i" "${name}.webp";
done

rm *.pgm
convert imagem*.webp -quality 100% -density 300 imagem.tif

sleep 1
#tesseract imagem.tif texto -l por hocr
echo Obrigado por converter imagem em texto, com o Roque Felipe o destruidor desde os tempos mais primordios OCR script,
rm *.png
rm *.pgm
rm *.gif
#rm *.tif
exit
