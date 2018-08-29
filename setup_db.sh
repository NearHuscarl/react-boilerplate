#!/bin/env bash

set -o errexit

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

if [[ ! -x /usr/bin/heroku ]]; then
	echo 'heroku-cli is not installed'
	exit 1
fi

heroku login
# Create heroku remote
# For a new heroku app
heroku create
# For an existing heroku app
# $ heroku git:remote -a <app-name>

while read -r line ; do
	ENV_VARS+="$line "
done < "$SCRIPT_DIR/.env_development"

heroku config:set $ENV_VARS
