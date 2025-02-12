#!/bin/sh
rm custom.pcf.gz
bdftopcf custom.bdf > custom.pcf
gzip custom.pcf
rm custom.otb
fonttosfnt -o custom.otb custom.bdf
mkfontdir
mkfontscale
fc-cache
xset fp rehash
