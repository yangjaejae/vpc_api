#!/bin/bash
DOCKER_CONTAINER_NAME="was"
DOCKER_IMAGE_NAME="was/nodejs"
DOCKER_IMAGE_TAG="v1.0.0"
echo "start WAS Server"

cd /home/ec2-user/vpc_api

echo "Ready for start server #############################################"
docker stop $(docker ps -qa) && docker rm $(docker ps -qa)
docker rmi -f ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} . 