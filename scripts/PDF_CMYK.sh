#!/bin/bash

# PDF/A
# -dPDFA=1

# PDF/X-3
# -dPDFX=true

# Vector / Image
# -sDEVICE=pdfwrite

# -dPDFSETTINGS=configuration
#    Presets the "distiller parameters" to one of four predefined settings:
#        /screen selects low-resolution output similar to the Acrobat Distiller (up to version X) "Screen Optimized" setting.
#        /ebook selects medium-resolution output similar to the Acrobat Distiller (up to version X) "eBook" setting.
#        /printer selects output similar to the Acrobat Distiller "Print Optimized" (up to version X) setting.
#        /prepress selects output similar to Acrobat Distiller "Prepress Optimized" (up to version X) setting.
#        /default selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file.

# Paper size
# -sPAPERSIZE=a4

# Custom paper size
# -dDEVICEWIDTHPOINTS=width -dDEVICEHEIGHTPOINTS=height

name=`echo -e "${@}" | cut -d'.' -f1`

gsc -dNOPAUSE -dBATCH -dPDFX=true \
  -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dProcessColorModel=/DeviceCMYK \
  -sColorConversionStrategy=CMYK -sOutputFile="${name}"_CMYK.pdf "${@}"
