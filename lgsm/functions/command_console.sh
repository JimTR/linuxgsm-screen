#!/bin/bash
# LinuxGSM command_console.sh function
# Author: Daniel Gibbs
# Website: https://linuxgsm.com
# Description: Gives access to the server tmux console.

commandname="CONSOLE"
commandaction="Access console"
functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

check.sh
fn_print_header
if [ "${shortname}" == "rust" ]||[ "${shortname}" == "hw" ]||[ "${shortname}" == "ark" ]; then
	fn_print_information_nl "${gamename} does not produce a verbose output to the console"
	fn_print_information_nl "${gamename} does not allow server commands to be entered in to the console"
fi
if [ "${output}" == "screen" ]; then
fn_print_information_nl "Press \"CTRL+a\" then \"d\" to exit console."
fn_print_warning_nl "Do NOT press CTRL+c to exit."
else
fn_print_information_nl "Press \"CTRL+b\" then \"d\" to exit console."
fn_print_warning_nl "Do NOT press CTRL+c to exit."
fi
echo -e "	* https://docs.linuxgsm.com/commands/console"
echo -e ""
if ! fn_prompt_yn "Continue?" Y; then
	return
fi
fn_print_information_nl "Using ${output}"
fn_print_dots "Accessing console"
check_status.sh

if [ "${status}" != "0" ]; then
	fn_print_ok_nl "Accessing console"
	fn_script_log_pass "Console accessed"
	if [ "${output}" == "screen" ]; then
	screen -r "${sessionname}"
	else
	tmux attach-session -t "${sessionname}"
	fi
	fn_print_ok_nl "Closing console"
	fn_script_log_pass "Console closed"
else
	fn_print_error_nl "Server not running"
	fn_script_log_error "Failed to access: Server not running"
	if fn_prompt_yn "Do you want to start the server?" Y; then
		exitbypass=1
		command_start.sh
	fi
fi

core_exit.sh