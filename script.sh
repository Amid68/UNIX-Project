# Jenkins job

# Check PHP syntax
php -l html/search.php
php -l html/info.php

# Run tests
php html/test-cli.php
php html/test-db-connection.php

# Stop and remove existing containers
docker compose down || true

# Build and start containers
docker compose up -d --build

# Wait for MySQL to be ready (important!)
sleep 30

# Test database connection
docker exec dictionary-project-web-1 php test-db-connection.php