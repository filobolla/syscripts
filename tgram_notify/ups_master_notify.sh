#!/bin/bash
# ups_master_notify: telegram notification handler for devices which can't support tls
# Usage: ups_master_notify <message>

HOST=$(hostname)
HEADER="Message from <b>${HOST%%.*}</b>:\n"
# DESCRIPTION uses echo -e to also display emoji (passed by UTF-8 code) 
DESCRIPTION="$1"

# If wget is used, special characters must be formatted in urlencoded format (eg. line breaks)
# !! Attention, this string substitution is possible only with bash
notification=${HEADER}${DESCRIPTION}
ssh filippo@192.168.3.119 '/etc/nut/scripts/ups_tgram_notify.sh upsmon "'${notification}'"'