compile:
	echo "Compiling"

all: format compile test

# Docker command for running with current directory mounted
DOCKER_FMT=docker run -v $(shell pwd):/workdir -w /workdir
# Choose which files to format
PY_FMT_FILES=$(shell find . -iname '*.py')
C_FMT_FILES=$(shell find . -iname '*.c')

format:
	$(DOCKER_FMT) unibeautify/black $(PY_FMT_FILES)
	$(DOCKER_FMT) ekilmer3/clang-format -i -style=file $(C_FMT_FILES)

ci-format:
	$(DOCKER_FMT) unibeautify/black --check $(PY_FMT_FILES)
	$(DOCKER_FMT) ekilmer3/clang-format -i -style=file $(C_FMT_FILES)
	git diff --exit-code

test: test-service-1 test-service-2 test-service-3

test-service-1:
	echo "Testing service 1"

test-service-2:
	echo "Testing service 2"

test-service-3:
	echo "Testing service 3"

deploy:
	echo "Deploying!"
