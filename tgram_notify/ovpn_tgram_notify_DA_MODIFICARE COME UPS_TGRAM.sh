#!/bin/bash
# ovpn_tgram_notify: telegram notification handler for OpenVPN-related events
CHAT_ID="657316162"
HOST=$(hostname)
message="<b>OpenVPN</b> says:\nConnection from <u>${trusted_ip}</u>to <u>${HOST%%.*}</u> established $(echo -e '\xE2\x9C\x85')\nClient: <i>${common_name}</i>\nTunnel IP: <u>${ifconfig_pool_remote_ip}</u>"
curl -H 'Content-Type: application/json' -d '{"chat_id":"'${CHAT_ID}'", "parse_mode":"HTML", "text":"'"${message}"'"}' https://api.telegram.org/bot813234765:AAFEiAazebcro07zgsL9Gnb7DOvvpMr_oiw/sendMessage 2> /var/log/openvpn/ovpn_tgram_notify.log