include .env
export $(shell sed 's/=.*//' .env)

# Define variables
PROJECT_NAME=$(CONTAINER_NAME)
DOCKER_COMPOSE=docker compose

# Default target: Show help
.PHONY: help
help:
	@echo "Makefile for managing the API Gateway"
	@echo ""
	@echo "Usage:"
	@echo "  make build       - Build the Docker image for the API Gateway"
	@echo "  make start       - Start the API Gateway container"
	@echo "  make stop        - Stop the API Gateway container"
	@echo "  make restart     - Restart the API Gateway container"
	@echo "  make reload      - Reload the NGINX configuration inside the container"
	@echo "  make logs        - View the logs of the API Gateway container"
	@echo "  make clean       - Remove the API Gateway container and network"

# Build the Docker image
.PHONY: build
build:
	$(DOCKER_COMPOSE) build $(PROJECT_NAME)

# Start the container
.PHONY: start
start:
	$(DOCKER_COMPOSE) up -d $(PROJECT_NAME)

# Stop the container
.PHONY: stop
stop:
	$(DOCKER_COMPOSE) down

# Restart the container
.PHONY: restart
restart: stop start

# Reload NGINX configuration
.PHONY: reload
reload:
	docker exec -it $(CONTAINER_NAME) nginx -s reload

# View logs
.PHONY: logs
logs:
	$(DOCKER_COMPOSE) logs -f $(PROJECT_NAME)

# Clean up: Remove containers, networks, and volumes
.PHONY: clean
clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans
