#!/bin/bash

# wrapper for the project, it's just frontend.

[ -f ".env" ] && source ".env"

# Gecenin 2'si parametre ayrıştırmaya üşenir gibi oldum, sadece argümanlar..
case "${1,,}" in
	"--help"|"-h")
		echo "Usage of the ${0##*/}:"
	;;
	*)
		export TOKEN="${1}"
		export CHANNEL="${2}"
	;;
esac

command -v "curl" &> /dev/null || {
	echo "Curl not found, before execute this script please install this it."
	exit 1
}

curl -X POST -H "Content-Type: application/json" -d "{'chat_id': '${CHANNEL}', 'text': '${CTX}', 'disable_notification': true}" "https://api.telegram.org/bot$${tOKEN}/sendMessage"
