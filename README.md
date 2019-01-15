# print-tools

> Some useful scripts for making sure your master's thesis gets printed correctly

## Check fonts

To make sure you generated PDF have the fonts embedded subset. Prints the fonts, page by page to stdout.

### Usage

    $ check-pdf-fonts.sh <pdf-file>

## Print preview

It is recommended writing a thesis in A4 format, which upon printing is scaled to B5. 

To get a better sense of how the printed size will be (fonts, figures, etc.), this script shrinks the pages to B5 size and frames it in a B5-sized box on printable A4 pages. A new file is created in the same directory as the input file.

The output will likely be lower quality than input, so do not use for checking print quality.

If you write it in B5 and want to print it on A4 in the same sized box, add the `--b5` flag.

### Usage

    $ master-print-preview.sh <pdf-file> [--b5]

## Dependencies 

  * `sudo apt install poppler-utils`
  * [pdftk](https://www.pdflabs.com/tools/pdftk-server/) 
  * [pdfscale](https://github.com/tavinus/pdfScale) (incl. dependencies)

## Limitations

* Tested on Ubuntu 18.04

## Licence

* [MIT License](LICENSE)
* [GPL License](https://www.pdflabs.com/docs/pdftk-license/gnu_general_public_license_2.txt) (pdftk)
