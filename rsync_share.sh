#!/bin/sh
#
# rsync_share
# Rsync copy to remote share (AFP, CIFS, NFS) on Mac
# Copyright © Filippo Bollarino 2019
#
# This script mounts the destination share by launching an AppleScript from terminal with function mymount
# Then a rsync command is runned
#

function mymount
{
    osascript <<EOF
    mount volume "afp://CasaBolla-NAS._afpovertcp._tcp.local/Public"
EOF
}

function sync_dir
{
  rsync -auhz --delete-after ~/Documents/Banca/ /Volumes/Public/Banca/ >/dev/null 2>&1
}

mymount
sync_dir
