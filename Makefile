# Prevents one to use @ before each statement
ifndef VERBOSE
.SILENT:
endif

.PHONY: help
help: ## Show this help message
	printf '\033[32mUsage: make [target] ...\033[0m\n\nAvailable targets:\n\n'
	egrep -h '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

up: ## Start the project
	docker compose up -d

down: ## Stop the project
	docker compose down

restart: ## Restart the project
restart: down up
