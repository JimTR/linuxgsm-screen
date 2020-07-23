#!/bin/bash
# LinuxGSM check_config.sh function
# Author: Daniel Gibbs
# Contributor: UltimateByte
# Website: https://linuxgsm.com
# Description: Checks if run from tmux or screen

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

fn_check_is_in_tmux(){
  if [ "${TMUX}" ]; then
		fn_print_fail_nl "multiplexer exception error: Sorry, you cannot start a ${output} session inside of a tmux session."
		fn_script_log_fatal "Tmuxception error: Attempted to start a ${output} session inside of a tmux session."
		fn_print_information_nl "LinuxGSM creates a ${output} session when starting the server."
		echo -e "It is not possible to run a ${output} session inside a tmux session"
		echo -e "https://docs.linuxgsm.com/requirements/tmux#tmuxception"
		core_exit.sh
	fi
}

fn_check_is_in_screen(){
	if [ "${STY}" ]; then
		fn_print_fail_nl "multiplexer exception error: Sorry, you cannot start a ${output} session inside of a screen session."
		fn_script_log_fatal "multiplexer exception error: Attempted to start a ${output} session inside of a screen session."
		fn_print_information_nl "LinuxGSM creates a ${output} session when starting the server."
		echo -e "It is not possible to run a ${output} session inside screen session"
		echo -e "https://docs.linuxgsm.com/requirements/tmux#tmuxception"
		core_exit.sh
	fi
}

fn_check_is_in_tmux
fn_check_is_in_screen
