#!/bin/bash

set -e
. build/include.sh

docker run -ti $DOCKER_OPTS magfest/uber-dev $1
# docker-compose up
