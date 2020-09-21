#!/bin/bash

echo "Beginning transfer LA STAMPA to Archivio..." $'\n'

rsync_log="Transfer LA STAMPA to Archivio executed correctly.\n\nRsync report:"$(rsync -auzh --exclude-from './lastampa_incorso.txt' --stats --delete --delete-excluded $1 /volume1/Public/LA\ STAMPA/ /volume1/Archivio/LA\ STAMPA/)
MSG=$'Transfer to Archivio executed correctly'
curl -s -X POST \
	-H 'Content-Type: application/json'\
	-d '{"chat_id": "657316162","text": "'"$rsync_log"'"}' \
	https://api.telegram.org/bot813234765:AAFEiAazebcro07zgsL9Gnb7DOvvpMr_oiw/sendMessage > /dev/null

sudo bash sync_mt_archivio.sh $1
