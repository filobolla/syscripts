#!/bin/bash

curl -H 'Content-Type: application/json' -d '{"chat_id":"657316162", "parse_mode":"HTML", "text":"<b>'"$(hostname)"'</b> says:'"\n"'Hello my friend"}' https://api.telegram.org/bot813234765:AAFEiAazebcro07zgsL9Gnb7DOvvpMr_oiw/sendMessage