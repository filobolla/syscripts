#!/bin/bash
# tgram_notify: universal telegram notification handler
# Usage: tgram_notify <pgrmname> (message)
# Message can be manually written inside the script if this isn't a daemon
PGRM=$1
LOG="/var/log/ups/ups_tgram_notify.log"
CHAT_ID="657316162"
HOST=$(hostname)
HEADER="<b>${PGRM}</b> (${HOST%%.*}) says:\n"
DESCRIPTION=$(echo -e $2)
message="${HEADER}${DESCRIPTION}"
curl -H 'Content-Type: application/json' -d '{"chat_id":"'${CHAT_ID}'", "parse_mode":"HTML", "text":"'"${message}"'"}' https://api.telegram.org/bot813234765:AAFEiAazebcro07zgsL9Gnb7DOvvpMr_oiw/sendMessage >/dev/null 2> /var/log/ups/ups_tgram_notify.log
# If wget is used, special characters must be formatted in urlencoded format (eg. line breaks)
#message=${HEADER/'\n'/'%0a'}${DESCRIPTION/'\n'/'%0a'}
#wget --post-data 'chat_id='${CHAT_ID}'&parse_mode=HTML&text='"${message}"'' https://api.telegram.org/bot813234765:AAFEiAazebcro07zgsL9Gnb7DOvvpMr_oiw/sendMessage >/dev/null 2>> $LOG
