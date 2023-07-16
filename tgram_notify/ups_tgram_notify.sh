#!/bin/bash
# tgram_notify: universal telegram notification handler
# Usage: tgram_notify <pgrmname> (message)
# Message can be manually written inside the script if this isn't a daemon
PGRM=$1
HOST=$(hostname)
CHAT_ID="657316162"
BOT_TOKEN=""

HEADER="<b>${PGRM}</b> (${HOST%%.*}) says:\n"
DESCRIPTION=$(echo -e $2)
message="${HEADER}${DESCRIPTION}"

curl -s \
-X POST \
-H 'Content-Type: application/json' \
-d '{
"chat_id":"'${CHAT_ID}'", 
"parse_mode":"HTML", 
"text":"'"${message}"'
"}' \
https://api.telegram.org/bot${BOT_TOKEN}/sendMessage | logger -i -t "$(basename $0)"
