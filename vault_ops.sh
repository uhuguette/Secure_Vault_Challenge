#!/usr/bin/bash

Vault="$secure/secure_vault"
secret_file="$Vault/secrets.txt"
log_file="$Vault/logs.txt"

if [ ! -d "$Vault" ]; then
	echo "Error: secure_vault not found"
	exit 1
fi
 
while true; do
	echo "SECURE VAULT OPERATIONS"
	echo "                       "
	echo "1) add a new secret"
	echo "2) update secret"
	echo "3) add log entry"
	echo "4) access keys"

	echo "5)exit"
	read -p "choose an option from [1-5]: " choice

	case $choice in 
		1)
			read -p "enter new secret: " secret
			echo "$secret" >> "$secret_file"
			echo "secret added✅"
			;;
		2)
			read -p "enter secret to update: " old
			read -p "enter new secret: " new
			if grep -q "$old" "secret_file"; then
				sed -i "s/$old/$new" "secret_file"
				echo "secret updated✅"
			else 
			  echo "no match found"
			fi
			;; 
		3)
		     	read -p "enter log message: " log
			echo "$(date '+%Y-%m-%d %H:%M:%S') - $log" >> "$log_file"
			echo "log entry added✅"
			;;
		4)
			echo "access denied ❌"
			;;
		5)
			echo "exiting... goodbye👋"
			break
			;;
		*) 
			echo "invalid option"
			;;
	esac
done





