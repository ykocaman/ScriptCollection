#!/bin/bash
# usage: ./multi_pdf_compresser.sh targetDir/
#

output="output"

find "$1" -type d -links 2 -exec mkdir -p "./$output/{}" \;

find "$1" -type f -iname '*.pdf' -print0 | while read -d $'\0' file
do
	echo -n "$output/$file"
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true -dColorImageResolution=150 -dNOPAUSE  -dBATCH -sOutputFile="$output/$file" $file > /dev/null
	echo " > OK"
done
