#!/bin/bash
#
# basename
# output file basename to file
# Copyright © Filippo Bollarino 2019
#
# This script allow to obtain the file basename starting with absolute path using Bash parameter expansion
in="$1"
out=${in##*/}

echo "$out" >> file_Media.txt
