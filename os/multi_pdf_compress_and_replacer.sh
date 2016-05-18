#!/bin/bash
# usage: ./multi_pdf_compress_and_replacer.sh targetDir/
#

originals="originals"

find "$1" -type d -links 2 -exec mkdir -p "./$originals/{}" \;

counter=0;
find "$1" -type f -iname '*.pdf' -print0 | while read -d $'\0' file
do
	counter=$(($counter+1))
	echo -n "$counter) $file"
	mv $file "$originals/$file" > /dev/null 2>&1
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true -dColorImageResolution=150 -dNOPAUSE  -dBATCH \
	-dOptimize=true -dConvertCMYKImagesToRGB=true -dColorConversionStrategy=/sRGB -dColorImageDownsampleType=/Bicubic -dGrayImageDownsampleType=/Bicubic \
	-dMonoImageDownsampleType=/Bicubic -sOutputFile=$file "$originals/$file"  > /dev/null 2>&1 
	echo "> OK"
done
