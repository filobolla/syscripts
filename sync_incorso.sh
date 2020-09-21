#!/bin/bash
echo "Beginning transfer MARK&THING to In-Corso..." $'\n'
rsync_log="Transfer MARK&THING to In-Corso executed correctly\nRsync report:"$(rsync -auhz --exclude-from './markthing_archivio.txt' --stats --delete --delete-excluded $1 /volume1/Public/MARK\&THING/ /volume1/In-Corso/MARK\&THING/)
curl -X POST \
	-H 'Content-Type: application/json' \
	-d '{"chat_id": "657316162","text": "'"$rsync_log"'"}' \
	https://api.telegram.org/bot813234765:AAFEiAazebcro07zgsL9Gnb7DOvvpMr_oiw/sendMessage > /dev/null
