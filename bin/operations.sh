
#!/bin/bash

####################
###   Binaries   ###
####################
DOCKER_COMPOSE=$(which docker-compose)
DOCKER=$(which docker)

####################

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

export USER_ID=${UID}
export GROUP_ID=${UID}

${DOCKER} build ${PROJECT_PATH}/builds/lb4-cli/. -t lb4-cli
${DOCKER} run --rm --user="$UID" -it -v ${PROJECT_PATH}/source:/app  \lb4-cli bash -c bash