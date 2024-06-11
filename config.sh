#!/bin/bash

export REGISTRY_ADMIN_USER="admin"
export REGISTRY_ADMIN_MAIL="test@test.it"
export REGISTRY_ADMIN_PASSWORD="password"
export REGISTRY_SECRET="e7er2yjacmbqjxsmf6h3rtrh7t6wjhef7bkv6kauv3wng35z"
export DATA_DIR=/data
export PORT=5000

if test -f ".env"; then
    echo "Loading .env file"
    # Override default variables from .env file
    export $(grep -v '^#' .env | xargs)    
else
    echo ".env file does not exist, using default config"
fi

rm -rf appsettings.json

envsubst < appsettings-template.json > "$DATA_DIR/appsettings.json"
envsubst < docker-dronedb-template.service > /etc/systemd/system/docker-dronedb.service