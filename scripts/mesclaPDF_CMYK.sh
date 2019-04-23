#!/bin/gsc

# PDF/A
# -dPDFA=1

# PDF/X-3
# -dPDFX=true

# Vector / Imagem
# -sDEVICE=pdfwrite

# Tamanho do papel
# -sPAPERSIZE=a4

# Tamanho do papel personalizado
# -dDEVICEWIDTHPOINTS=width -dDEVICEHEIGHTPOINTS=height

gsc -dNOPAUSE -dBATCH -dPDFX=true \
-sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress -dProcessColorModel=/DeviceCMYK \
-sColorConversionStrategy=CMYK -sOutputFile=mesclado_CMYK.pdf *.[pP][dD][fF]
