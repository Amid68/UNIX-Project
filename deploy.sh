#!/bin/bash

# Pull latest code
# git pull

#!/bin/bash

# Build Docker image
sudo docker build -t dictionary-app .

# Stop and remove existing container with force
sudo docker rm -f dictionary-app || true

# Run new container
sudo docker run -d \
  --name dictionary-app \
  -p 8000:80 \
  --add-host=host.docker.internal:host-gateway \
  dictionary-app