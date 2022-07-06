#!/bin/sh
# Usage: worker.sh args
DOCKER="sudo docker"
#DOCKER=podman
$DOCKER run -it --rm --pid=host -v worker-dir:/opt/fishtest/worker -e "args=$*" fishtest
