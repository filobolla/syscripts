#!/bin/sh
#
# /etc/init.d/upsmon
# init script for upsmon
#
# chkconfig: 036 95 05
# description: upsmon daemon
#
# processname: upsmon
# pidfile: /var/run/upsmon.pid

RETVAL=0
prog="upsmon"

start() {
    echo -n $"Starting $prog:" 
    nohup upsmon & && echo "Succeded." || echo "Failed."
    echo $! > /var/run/upsmon.pid
    echo
}

stop() {    (6)
    echo -n $"Stopping $prog:"
    if [ -f /var/www/run/upsmon.pid ]; then 
        kill `cat /var/www/run/upsmon.pid` && echo "Succeded." || echo "Failed."
        rm /var/www/run/upsmon.pid
    fi
    echo
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)    (10)
        echo $"Usage: $0 {start|stop|restart}"
        RETVAL=1
esac
exit $RETVAL