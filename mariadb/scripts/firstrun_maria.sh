#!/bin/bash

set -e 

DB_NAME=${DB_NAME:-}

if [[ -n "${DB_NAME}" ]]; then
	DB_USER=${DB_USER:-admin}
	DB_PASS=${DB_PASS:-admin}
fi

MARIADB_NEW='false'

#
#  MariaDB setup
#
firstrun_maria() {

	# First install mariadb
	if [[ -d "${DATA_DIR}" ]]; then
	    
	echo "===> MariaDB installed..."
        
        mkdir -p /etc/mysql/conf.d
	   	
        mysqld --initialize-insecure --user=mysql --datadir=${DATA_DIR}  > /dev/null
        echo "===> System databases initialized..."

	# Start mariadb
        /usr/bin/mysqld_safe --user=mysql > /dev/null 2>&1 &

        echo "===> Waiting for MariaDB to start..."

		STA=1
		#while [[ STA -ne 0 ]]; do
                    #printf "."
			#sleep 20
			mysql -uroot -e "select 1" > /dev/null
			STA=$?
                         printf STA
		#done
        echo "===> Start OK..."

		# 1. Create a localhost-only admin account
		# 2. if needed, Create remote db admin account with root privilieges
		# 3. if set, create a database with specific username and password
		#mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'"
		#mysql -u root -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}'"
		#mysql -u root -e "CREATE USER '${DB_USER}'@'127.0.0.1' IDENTIFIED BY '${DB_PASS}'"
		mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION; FLUSH PRIVILEGES;"
			
			echo "OK"

		if [[ ${REMOTE_ADMIN} == 'true' ]]; then
			echo "Enabled"

			REMOTE_ADMIN_USER=${REMOTE_ADMIN_USER:-admin}
			REMOTE_ADMIN_PASS=${REMOTE_ADMIN_PASS:-admin}
			echo "Createing remote admin user with root privilieges"

			mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${REMOTE_ADMIN_USER}'@'%' IDENTIFIED BY '${REMOTE_ADMIN_PASS}' WITH GRANT OPTION; FLUSH PRIVILEGES;"
			echo "OK"
		else
			echo "Disabled"
		fi

        # shutdown mariadb to wait for supervisor
		mysqladmin -u root shutdown

		# set a flag
		MARIADB_NEW='true'
	else
        echo "===> Create localhost completed..."

    fi

    #
    # Create specific user/database if needed
    #
    echo "Checking: Database creation"

    if [[ -n ${DB_NAME} ]]; then
    	echo "Needed"

    	/usr/bin/mysqld_safe --user mysql > /dev/null 2>&1 &

    	STA=1
		while [[ STA -ne 0 ]]; do
                    printf "."
			sleep 5
			mysql -uroot -e "status" > /dev/null 2>&1
			printf ".come here" $?
			STA=$?
		done
		echo "OK"

		for db in $(awk -F',' '{for (i = 1 ; i <= NF ; i++) print $i}' <<< "${DB_NAME}");
			do

				echo "Createing required database \"$db\"..."
				mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`$db\` DEFAULT CHARACTER SET \`utf8mb4\` COLLATE \`utf8mb4_unicode_ci\`;"
				echo "OK"

				if [[ -n "${DB_USER}" ]]; then
					echo "Granting access to database \"$db\" for user \"${DB_USER}\"..."
					mysql -uroot -e "GRANT ALL PRIVILEGES ON \`$db\`.* TO '${DB_USER}' IDENTIFIED BY '${DB_PASS}';"
				fi
			done

		# shutdown mariadb to wait for supervisor
		mysqladmin -u root shutdown

	else
		echo "Ignored"
	fi

	echo "Initialization for maria image completed !!!"
}

firstrun_maria