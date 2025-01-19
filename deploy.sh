#!/bin/bash

# Pull latest code
# git pull

# Build Docker image
docker build -t dictionary-app .

# Stop and remove existing container
docker stop dictionary-app || true
docker rm dictionary-app || true

# Run new container
docker run -d \
  --name dictionary-app \
  -p 8000:80 \
  --add-host=host.docker.internal:host-gateway \
  dictionary-app