#!/bin/bash

# Set default values
POSTGRES_USER="dreamer"
POSTGRES_PASSWORD="Beginner@2025"
POSTGRES_DB="matrix_db"
SCHEMA_NAME="matrix_schema"
POSTGRES_PORT="6432"
CLOUD_BEAVER_PORT="9080"

ACTION="$1"

# Check if an action (start or stop) is provided
case "$ACTION" in
  start|stop)
    ;;  # Valid action, do nothing
  *)    # Invalid action (including no action provided)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac

# Export the environment variables
export POSTGRES_USER
export POSTGRES_PASSWORD
export POSTGRES_DB
export SCHEMA_NAME
export POSTGRES_PORT
export CLOUD_BEAVER_PORT

# Substitute environment variables in the init_db.sql script
sed -e "s/\${SCHEMA_NAME}/${SCHEMA_NAME}/g" \
    -e "s/\${POSTGRES_USER}/${POSTGRES_USER}/g" \
    -e "s/\${POSTGRES_DB}/${POSTGRES_DB}/g" \
    ./init_db_template.sql > ./init_db.sql

# Perform action-specific commands
if [ "$ACTION" == "start" ]; then
  docker-compose -f ./database.yaml up -d
elif [ "$ACTION" == "stop" ]; then
  docker-compose -f ./database.yaml down
fi

# Check the exit code of docker-compose
if [ $? -eq 0 ]; then
    echo "Database action=$ACTION Completed."
else
    echo "Database action=$ACTION failed."
    exit 1
fi
