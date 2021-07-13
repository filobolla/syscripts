#!/bin/sh

#	dircmp 2.0
#	scan source directory and file occurrences in dest directory and subdirectory
# 	Copyright 2019 Filippo Bollarino
#	If you need to find if a folder contains already present files in your dest folder you can run dircmp
## TODO: add -P,--is-present to search present file occurences;
##		 add -e,--exclude to exclude directories from find search
##		 add -M,--move to automatically move non-present files to correct directory
##		 add -c,--by-checksum to analyze files with different names (-n,--by-name is default)

if [ $# -ne 2 ]; then
	echo "Usage: dircmp <source> <dest>"
	exit 0
fi

src_name=$(echo "$1" | tr ' ' '_' | rev | cut -d "/" -f2,3,4 | rev | tr '/' '-')
dst_name=$(echo "$2" | tr ' ' '_' | rev | cut -d "/" -f2,3,4 | rev | tr '/' '-')
#src_name=$(basename "$1")
#dst_name=$(basename "$2")
# Find files and delete path to ensure similarity of files: 
# src and dst names are appended to allow multiple istances of the program without overwriting
if [ ! -f "$src_name"_files.txt ] || [ ! -s "$src_name"_files.txt ]; then
	echo "Listing ${1}..." 
	find "$1" -type f ! -name ".*" -exec basename {} \; | sort > "$src_name"_files.txt
fi
if [ ! -f "$dst_name"_files.txt ] || [ ! -s "$dst_name"_files.txt ]; then
	echo "Listing ${2}..."
	find "$2" -type f ! -name ".*" -exec basename {} \; | sort > "$dst_name"_files.txt
fi

result=$(diff -i "$src_name"_files.txt "$dst_name"_files.txt) # Case insensitive diff to avoid JPG/jpg differences
#dest_diff_count=$(echo "$result" | grep -c ">") #Only in <dest>
source_diff_count=$(echo "$result" | grep -c "<") #Only in <src>
source_file_count=$(wc -l "$src_name"_files.txt | cut -d" " -f6) # Cut -f6 to extract number (neither tab nor spaces)

if [ "$source_diff_count" -eq 0 ]; then
	echo "All files from ${1} are present in ${2}"
elif [ "$source_diff_count" -eq "$source_file_count" ]; then
	echo "None of the files from ${1} are present in ${2}"
else
	echo "${source_diff_count} files are not present in ${2} folder\nCheck dircmp_${src_name}-${dst_name}_not_present.txt"
	# Problem with cut by whitespaces: select src lines and delete diff symbol '>'
	echo "$result" | grep "<" | sed 's/\<\ //g' > dircmp_"$src_name"-"$dst_name"_not_present.txt
fi