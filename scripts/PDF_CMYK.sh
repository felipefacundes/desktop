#!/bin/bash

# PDF/A
# -dPDFA=1

# PDF/X-3
# -dPDFX=true

# Vector / Image
# -sDEVICE=pdfwrite

# Paper size
# -sPAPERSIZE=a4

# Custom paper size
# -dDEVICEWIDTHPOINTS=width -dDEVICEHEIGHTPOINTS=height

name=`echo -e "${@}" | cut -d'.' -f1`

gsc -dNOPAUSE -dBATCH -dPDFX=true \
  -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dProcessColorModel=/DeviceCMYK \
  -sColorConversionStrategy=CMYK -sOutputFile="${name}"_CMYK.pdf "${@}"
