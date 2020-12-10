.PHONY: up runner test help
.DEFAULT_GOAL := help

PROJECTNAME := $(shell basename "$(PWD)")
ENV ?= dev

## runner: run shel mode in container
## :	make runner -e ENV=(dev|test)
runner:
	docker-compose run --rm runner

## test: run rake test
test:
	docker-compose run --rm runner rake test

## down: down docker-compose
down:
	docker-compose down

## help: current command
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
