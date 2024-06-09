#!/bin/bash

export MYSQL_ROOT_PASSWORD="default-root-password"
export MYSQL_PASSWORD="default-mysql-password"
export REGISTRY_ADMIN_MAIL="test@test.it"
export REGISTRY_ADMIN_PASSWORD="password"
export REGISTRY_SECRET="e7er2yjacmbqjxsmf6h3rtrh7t6wjhef7bkv6kauv3wng35z"
export EXTERNAL_URL=""
export CONTROL_SWITCH='$controlSwitch'

if test -f ".env"; then
    echo "Loading .env file"
    # Override default variables from .env file
    export $(grep -v '^#' .env | xargs)    
else
    echo ".env file does not exist, using default config"
fi

rm -rf appsettings.json
rm -rf initialize.sql

envsubst < appsettings-template.json > appsettings.json
envsubst < initialize-template.sql > initialize.sql