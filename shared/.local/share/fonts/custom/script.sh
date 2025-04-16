#!/bin/sh
rm custom.pcf.gz
rm custom.pf2
bdftopcf custom.bdf > custom.pcf
grub-mkfont --output custom.pf2 custom.bdf
gzip custom.pcf
rm custom.otb
fonttosfnt -o custom.otb custom.bdf
mkfontdir
mkfontscale
fc-cache
xset fp rehash
