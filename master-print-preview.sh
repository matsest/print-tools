#!/usr/bin/env bash

# Scales A4 PDF to B5 size with a B5-size box on an A4 page. 
# Saves to new file in same folder. 
#
# Optionaly puts a B5  pdf in the B5-size box and outputs a 
# printable A4, if given the --b5 flag
#
# Will likely outpt lower quality pdf - this is not for checking
# print quality and such, just to check rough sizes of fonts and 
# figures.

# Requires:
#   pdftk (https://www.pdflabs.com/tools/pdftk-server/) 
#   pdfscale (https://github.com/tavinus/pdfScale) (incl. dependencies)

if [ -z "$1" ]; then
    echo 'No input given!'
    echo ''
    echo 'Usage:'
    echo '   $ master-print-preview.sh <pdf-file> [--b5]'
    exit
fi

IN_FILE=$1

if [ ${IN_FILE: -4} != ".pdf" ]; then
    echo 'The input file does not have a .pdf extension'
    exit
fi

STAMP="a4-w-b5-border.pdf"
DATE=`date -u +"%y%m%dT%H%M"`
OUT_FILE="${IN_FILE%%.*}"-print-preview-$DATE.pdf

touch $OUT_FILE

if [ "$2" == '--b5' ]; then
    SCALED_FILE="${IN_FILE%%.*}".A4.SCALED.pdf
    pdfscale -r A4 -s 0.84 "$IN_FILE"
    pdftk "$SCALED_FILE" stamp "$STAMP" output "$OUT_FILE"
else
    SCALED_FILE="${IN_FILE%%.*}".SCALED.pdf
    pdfscale -s 0.84 "$IN_FILE"
    pdftk "$SCALED_FILE" stamp "$STAMP" output "$OUT_FILE"
fi

rm "$SCALED_FILE"
