#!/bin/sh

while true; do
  ls -d ~/Documents/Banca/* | entr -dp ./rsync_folder.sh 2>&1
done