#!/bin/bash

DOCKER_COMPOSE=$(which docker-compose)
DOCKER=$(which docker)

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "[$(date +"%Y-%m-%d %T")] Stopping lingering containers..."


${DOCKER_COMPOSE} \
    -f ${PROJECT_PATH}/deploy/develop/docker-compose.yaml \
    down --remove-orphans  

echo "[$(date +"%Y-%m-%d %T")] Starting the containers..."

${DOCKER_COMPOSE} \
    -f ${PROJECT_PATH}/deploy/develop/docker-compose.yaml \
    up -d    


${DOCKER_COMPOSE} \
    -f ${PROJECT_PATH}/deploy/develop/docker-compose.yaml \
    logs -f --tail 40 

