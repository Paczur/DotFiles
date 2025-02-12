#!/bin/sh
rm custom.pcf.gz
bdftopcf custom.bdf > custom.pcf
gzip custom.pcf
rm custom.otb
fonttosfnt -o custom.otb custom.bdf
mkfontdir
mkfontscale
fc-cache


# cd bitmapfont2otb
# . .venv/bin/activate
# ./bitmapfont2otb ../custom.bdf ../custom.otb
# deactivate
# cd ..



