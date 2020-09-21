#!/bin/bash
#	order_media
#	sort media by exif parameter with exiftool
#	Copyright © Filippo Bollarino 2019
#	The script find every media file in the directory and prints his exif metadata.
#	If the exif field match the argument, it is then moved to the relative folder
#
#	Use it with a find command to move all of your files automatically like this:
#	find path/to/dir \ 	(no final backslash)
#	-type f \
#	-maxdepth 1 \ 	(to avoid run find in newly created directories)
#	-exec path/to/script/./order_media.sh {} "exif field" \;
#
#	Eg. you can sort your photos by device passing as parameter the field "Camera Model Name" (see exiftool output)
#

if [ "$#" -eq "0" ]
  then
    echo "No arguments supplied"
		exit 1
	else
		path="$1"
		field="$2"
		out="${path%/*}"
		out_iphone="$out"/"${out##*/}"_iphone
		out_ipad="$out"/"${out##*/}"_ipad

		result=$(exiftool "$path" | grep -e "$field")
		#echo "$result"
		if [[ $result =~ "iPhone" ]]; then
			[ ! -d "$out_iphone" ] && mkdir "$out_iphone"
			mv "$path" "$out_iphone"
		elif [[ $result =~ "iPad" ]]; then
			[ ! -d "$out_ipad" ] && mkdir "$out_ipad"
			mv "$path" "$out_ipad"
		fi
fi

#echo "$path"
#echo "$out_iphone"
#echo "$out_ipad"
