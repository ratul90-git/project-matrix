#!/bin/bash

# Stop all running containers
container_ids=$(docker ps -a -q)
if [ ! -z "$container_ids" ]; then
  docker stop $container_ids
fi

# Remove all containers
if [ ! -z "$container_ids" ]; then
  docker rm -f $container_ids
fi

# Remove ALL volumes forcefully
volume_names=$(docker volume ls -q)
if [ ! -z "$volume_names" ]; then
  docker volume rm -f $volume_names
fi

# Remove all images
image_ids=$(docker images -a -q)
if [ ! -z "$image_ids" ]; then
  docker rmi -f $image_ids
fi

# Remove all networks
docker network prune -f

# Remove all build cache
docker builder prune -f

