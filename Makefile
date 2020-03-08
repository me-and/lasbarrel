.DEFAULT_GOAL = lasbarrel.stl

DOCKER = docker
OPENSCAD = openscad

ifeq ($(USE_DOCKER),Yes)
	BUILD_CMD = $(DOCKER) run --rm --volume $$(pwd):/build $(OPENSCAD)
	DOCKER_DEP = .docker/build
else
	BUILD_CMD = $(OPENSCAD)
	DOCKER_DEP =
endif

$(DOCKER_DEP): Dockerfile
	$(DOCKER) build --tag openscad .
	mkdir -p .docker
	touch .docker/build

lasbarrel.stl: lasbarrel.scad $(DOCKER_DEP)
	$(BUILD_CMD) -o $@ $<
