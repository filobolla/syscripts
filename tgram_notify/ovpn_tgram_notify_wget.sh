#!/bin/bash
# ovpn_tgram_notify: telegram notification handler for OpenVPN-related events
# wget can be replaced by curl to unlock different content-type encodings (application/json)
PGRM=$1
CHAT_ID="<CHAT_ID>"
HOST=$(hostname)
HEADER="<b>${PGRM}</b> (${HOST%%.*})says:%0a"
DESCRIPTION="Connection from <u>${trusted_ip}</u>to <u>${HOST%%.*}</u> established $(echo -e '\xE2\x9C\x85')%0aClient: <i>${common_name}</i>%0aTunnel IP: <u>${ifconfig_pool_remote_ip}</u>"
message="${HEADER}${DESCRIPTION}"
wget --post-data 'chat_id='${CHAT_ID}'&parse_mode=HTML&text='"${message}"'' https://api.telegram.org/bot<BOT_TOKEN>/sendMessage >/dev/null 2> /var/log/openvpn/ovpn_tgram_notify.log