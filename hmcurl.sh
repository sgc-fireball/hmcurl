#!/bin/sh

start() {
	echo "Starting hmcurl"
	logger -t homematic -p user.info "starting hmcurl"
	echo "OK"
}

stop() {
	echo "Stopping hmcurl"
	logger -t homematic -p user.info "stopping hmcurl"
	echo "OK"
}

uninstall() {
	mount -o remount,rw /
	mount -o remount,rw /usr/local

    rm /bin/curl
    rm /lib/libcurl.so.4
    rm /lib/libcurl.so.4.3.0

    logger -t homematic -p user.info "uninstalled hmcurl"
	mount -o remount,ro /usr/local
	mount -o remount,ro /
}

}info() {
	echo "Info: Author: <a href=\"mailto:rh+homematic@hrdns.de\">Richard Huelsberg</a><br>"
	echo "Info: Homepage: <a target=\"_blank\" href=\"https://www.hrdns.de\">HRdns.de</a><br>"
	echo "Name: HMcurl"
	echo "Version: 0.0.1"
	echo "Operations: uninstall"
	echo "Update: https://raw.githubusercontent.com/sgc-fireball/hmcurl/master/VERSION"
}

case "$1" in
	""|start)
		start
		;;
	stop)
		stop
		;;
	reload|restart)
		stop
		sleep 2
		start
		;;
	info)
		info
		;;
	uninstall)
		uninstall
		;;
esac
