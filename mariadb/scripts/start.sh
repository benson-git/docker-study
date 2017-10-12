#!/bin/bash

set -e

#
# When Startup Container script
#

if [[ -e /scripts/firstrun.sh ]]; then
	# config mariadb
	/scripts/firstrun_maria.sh
    	rm /scripts/firstrun.sh
else
	# Cleanup previous mariadb sockets
	if [[ -e ${DATA_DIR}/mysql.sock ]]; then
		rm -f ${DATA_DIR}/mysql.sock
	fi
fi

exec /usr/bin/mysqld_safe

