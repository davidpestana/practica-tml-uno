#!/bin/bash

DOCKER_COMPOSE=$(which docker-compose)
DOCKER=$(which docker)

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

${DOCKER_COMPOSE} \
    -f ${PROJECT_PATH}/deploy/develop/docker-compose.yaml \
    logs -f --tail 40 