#!/bin/sh

# if Wireguard is down, the command 'wg' will do nothing  (exit code 0).
# conversely, if Wireguard is up, the command 'wg' will complain about the user not being root (exit code 1).
# we can use this fact to determine if we are connected to Wireguard or not.

connection_status() {
	wg 2>/dev/null && echo '0' || echo '1';
}

case $1 in
--toggle)
	if [ "$(connection_status)" = "0" ]
	then
		sudo wg-quick up wg0 2>/dev/null; notify-send -t 2000 "VPN" "Wireguard is up";
	else
		sudo wg-quick down wg0 2>/dev/null; notify-send -t 2000 "VPN" "Wireguard is down";
	fi
	;;
*)
	if [ "$(connection_status)" = "0" ]
	then
		echo "VPN: down";
	else
		echo "VPN: up";
	fi
	;;
esac
