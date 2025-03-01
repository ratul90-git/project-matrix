#!/bin/bash

# Set default values
LS_PORT="8081"

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
export LS_PORT

# Perform action-specific commands
if [ "$ACTION" == "start" ]; then
  docker-compose -f ./loginService-compose.yaml up --build -d
elif [ "$ACTION" == "stop" ]; then
  docker-compose -f ./loginService-compose.yaml down
fi

# Check the exit code of docker-compose
if [ $? -eq 0 ]; then
    echo "loginService action=$ACTION Completed."
else
    echo "loginService action=$ACTION failed."
    exit 1
fi