convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% \
-normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB \
-depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 \
-strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0 *.jpg out.jpg

#-sampling-factor 4:2:0
#-define jpeg:dct-method=float
