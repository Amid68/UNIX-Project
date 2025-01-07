#!/bin/bash

REPO_URL="https://github.com/Amid68/UNIX-Project"
APP_DIR="/var/www/html"   
CONTAINER_NAME="dictionary_app_container"
DOCKER_IMAGE="dictionary_app:latest"

echo "Starting the automation process..."


echo "Pulling the latest code from the repository..."
if [ ! -d "$APP_DIR" ]; then
  git clone $REPO_URL $APP_DIR
else
  cd $APP_DIR
  git pull origin main
fi


echo "Compiling the application..."


echo "Building the Docker image..."
docker build -t $DOCKER_IMAGE $APP_DIR


echo "Stopping and removing the existing container (if running)..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true


echo "Deploying the application in a container..."
docker run -d --name $CONTAINER_NAME -p 8080:80 $DOCKER_IMAGE

echo "Automation process completed successfully!"
