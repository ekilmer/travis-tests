compile:
	echo "Compiling"

all: format compile test

# Use formatting images from https://github.com/Unibeautify/docker-beautifiers
DOCKER_FMT=docker run -v $(shell pwd):/workdir -w /workdir unibeautify/
# Choose which files to format
PY_FMT_FILES=$(shell find . -iname '*.py')

format:
	$(DOCKER_FMT)black $(PY_FMT_FILES)

ci-format:
	$(DOCKER_FMT)black --check $(PY_FMT_FILES)

test: test-service-1 test-service-2 test-service-3

test-service-1:
	echo "Testing service 1"

test-service-2:
	echo "Testing service 2"

test-service-3:
	echo "Testing service 3"

deploy:
	echo "Deploying!"
