# Image-specific settings
IMAGE_NAME = freistil/template
RUN_OPTS = -d

# Determine current Git commit
GIT_SHA := $(shell git rev-parse HEAD)

# Build the image
build:
	docker build -t ${IMAGE_NAME}:${GIT_SHA} .

# Start a container from the image
run:
	docker run ${RUN_OPTS} ${IMAGE_NAME}:${GIT_SHA}

# Push to registry
push:
	docker tag -f ${IMAGE_NAME}:${GIT_SHA} ${IMAGE_NAME}:latest
	docker push ${IMAGE_NAME}
