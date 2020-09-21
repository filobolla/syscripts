#!/bin/sh
#
#	damaged_jpgs
#	log jpegs status and errors
#	Copyright © Filippo Bollarino 2019
#
#	This check the jpg file passed as first argument with jpeginfo in search for errors.
#	All errors and warnings are logged to the output file specified as second argument.
#	It is recommended to run this with a find command, like this:
#		find path/to/dir -type f -iname "*.jpg" --exec bash damaged_jpgs.sh {} path/to/output/file \;
#

result=`jpeginfo -c "$1"`
if echo "$result" | grep -q -e WARNING -e ERROR > /dev/null; then		# if result contain error, this is appended to file
	echo "$result" >> $2
fi
