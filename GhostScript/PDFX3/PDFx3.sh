#!/bin/bash

# PDF/A
# -dPDFA=1

# PDF/X-3
# -dPDFX=true

# Vector / Imagem
# -sDEVICE=pdfwrite

for i in *.[pP][dD][fF];
do name=`echo $i | cut -d'.' -f1`;
echo $name;
gsc -dNOPAUSE -dBATCH -dPDFX=true \
-sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dProcessColorModel=/DeviceCMYK \
-sColorConversionStrategy=CMYK -sOutputFile="${name}_CMYK.pdf" -f "$i";
done
