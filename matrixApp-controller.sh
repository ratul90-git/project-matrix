#!/bin/bash
set -e

# Set default values
POSTGRES_DB="matrix_db"
SCHEMA_NAME="matrix_schema"
POSTGRES_USER="dreamer"
POSTGRES_PASSWORD="Beginner@2025"
POSTGRES_PORT="6432"
CLOUD_BEAVER_PORT="9080"
BFF_PORT="5000"
REACTUI_PORT="4000"
WS_PORT="8080"
LS_PORT="8081"

ACTION="$1"

# Check if an action (start or stop) is provided
case "$ACTION" in
  start|stop)
    ;;  # Valid action, do nothing
  *)    # Invalid action (including no action provided)
    echo "Usage: $0 {start|stop}"
	echo "  start - Launches the matrixApp services using Docker Compose."
	echo "  stop  - Stops and removes the running containers."
    exit 1
    ;;
esac

# Export the environment variables
export POSTGRES_DB
export SCHEMA_NAME
export POSTGRES_USER
export POSTGRES_PASSWORD
export POSTGRES_PORT
export CLOUD_BEAVER_PORT
export BFF_PORT
export REACTUI_PORT
export WS_PORT
export LS_PORT

# Substitute environment variables in the .init_db_template.sql script
sed -e "s/\${POSTGRES_DB}/${POSTGRES_DB}/g" \
	-e "s/\${SCHEMA_NAME}/${SCHEMA_NAME}/g" \
    -e "s/\${POSTGRES_USER}/${POSTGRES_USER}/g" \
    ./DATABASE/database-config/.init_db_template.sql > ./DATABASE/database-config/init_db.sql
    
# Perform action-specific commands
if [ "$ACTION" == "start" ]; then
  docker compose -f ./matrixApp-compose.yaml build welcome-micro-service
  docker compose -f ./matrixApp-compose.yaml build login-micro-service
  docker compose -f ./matrixApp-compose.yaml up -d
elif [ "$ACTION" == "stop" ]; then
  docker compose -f ./matrixApp-compose.yaml down
fi

# Exit status of docker compose
echo "matrixApp action=$ACTION Completed."