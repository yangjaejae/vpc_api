  
#!/bin/bash
DOCKER_CONTAINER_NAME="was"
DOCKER_IMAGE_NAME="was/nodejs"
DOCKER_IMAGE_TAG="v1.0.0"
echo "start WAS Server"

echo "Build image#############################################"
docker rm -f $(docker ps -aqf name="${DOCKER_CONTAINER_NAME}")
docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .
docker run -d \
           -p "4000:4000" \
           --name="${DOCKER_CONTAINER_NAME}" \
           -v ~/vpc_api/:/usr/src/app \
           -w "/usr/src/app" \
           --restart=on-failure \
           ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} \
           npm start
