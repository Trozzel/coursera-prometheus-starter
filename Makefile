#Create a makefile for rust that compiles debug and release, formats, lints, and cleans the project.
# it should have a "help" target that reads all text behind '##' in this file and prints it as help message.

.PHONY: help

help: ## This help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

debug: ## Compile the project in debug mode
	cargo build

release: ## Compile the project in release mode
	cargo build --release

format: ## Format the project
	cargo fmt

lint: ## Lint the project
	cargo clippy

clean: ## Clean the project
	cargo clean

test: ## Run the tests
	cargo test

run: ## Run the project
	cargo run

all: debug release format lint test ## Run all the targets

