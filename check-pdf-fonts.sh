#!/usr/bin/env bash

# Checks fonts page by page in a pdf-file. Output to stdout.
# Useful for checking if fonts are embedded
#
# Requires: 
#   - pdffonts and pdfinfo from poppler-utils
#   
#   Can be installed by 'brew install poppler' (macOS)
#   or 'sudo apt install poppler-utils' (Ubuntu/Debian)
#
# Usage:
#   $ check-pdf-fonts.sh <pdf-file>

if [ -z "$1" ]; then
    echo 'No input given!'
    echo ''
    echo 'Usage:'
    echo '   $ check-pdf-fonts.sh <pdf-file>'
    exit
fi

IN_FILE=$1

if [ ${IN_FILE: -4} != ".pdf" ]; then
    echo 'The input file does not have a .pdf extension'
    exit
fi

for i in `seq 1 1 \`pdfinfo $IN_FILE| grep 'Pages' | cut -d: -f2 | sed -e 's/ //g'\``
do
  printf "\nPage $i\n";
  pdffonts -f $i -l $i $IN_FILE;
done
