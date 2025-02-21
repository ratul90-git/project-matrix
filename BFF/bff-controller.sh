#!/bin/bash

# Set default values
BFF_PORT="5000"

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
export BFF_PORT

# Perform action-specific commands
if [ "$ACTION" == "start" ]; then
  docker-compose -f ./bff-compose.yaml up --build -d
elif [ "$ACTION" == "stop" ]; then
  docker-compose -f ./bff-compose.yaml down
fi

# Check the exit code of docker-compose
if [ $? -eq 0 ]; then
    echo "BFF action=$ACTION Completed."
else
    echo "BFF action=$ACTION failed."
    exit 1
fi