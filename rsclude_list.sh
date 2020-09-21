 #!/bin/sh
#
#	rsclude_list
#	Rsync --exclude list maker
#	Copyright © Filippo Bollarino 2019
#
#	This script takes a list of files/dirs to copy and let the user choose whether to sync or not.
#	Two files are produced, and you should pass the one in which the undesireable paths reside
#
################################################################################################
# v1.0: This script does not support error handling and always append your choice to file,
#				even after restarting the script
################################################################################################
#

filename=$(echo "$1" | sed 's/.txt//')

while IFS= read -r line
do
	echo "$line"
	read -p "Please enter whether the file will be included[i] or excluded[e]:" choice < /dev/tty
	case $choice in
		"i")
			echo "$line" >> "$filename"_included.txt
			;;
		"e")
			echo "$line" >> "$filename"_excluded.txt
			;;
		*)
			;;
	esac
done < $1
