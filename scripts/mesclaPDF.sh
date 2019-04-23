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

gsc -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress -sOutputFile=mesclado.pdf *.[pP][dD][fF]
