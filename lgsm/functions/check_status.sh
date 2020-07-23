#!/bin/bash
# LinuxGSM check_status.sh function
# Author: Daniel Gibbs
# Contributor: UltimateByte
# Website: https://linuxgsm.com
# Description: Checks the process status of the server. Either online or offline.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"
if [ "${output}" == "screen" ]; then
status=$(screen -ls  "${sessionname}" | grep "${sessionname}")
if [ -z "$status" ]
then
        status=0
else
        status=1
fi
else
status=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | grep -Ecx "^${sessionname}")
fi
