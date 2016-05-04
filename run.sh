#!/bin/bash

# Verify we have docker-compose
if ! command -v docker-compose > /dev/null; then
  echo "ERROR: Could not find docker-compose"
  exit 1
fi

# Verify we have wget
if ! command -v wget > /dev/null; then
  echo "ERROR: Could not find wget"
  exit 1
fi

# Setup temp directory for where to run from
mkdir -p /tmp/two-tier-web-app.$$/ &&
cd /tmp/two-tier-web-app.$$/ &&
wget https://raw.githubusercontent.com/dunse/two-tier-web-app/master/docker-compose.yml &&
docker-compose up -d

# Wait for containers to settle
sleep 5

# Verify setup
if ! wget -O- http://localhost:8084 2> /dev/null | grep -q "Hi there"; then
  echo "ERROR: Unable to contact web server."
  echo "Please check logs for errors."
  exit 1
fi

echo "Success!"
echo "Please access the new web site at: http://localhost:8084"
