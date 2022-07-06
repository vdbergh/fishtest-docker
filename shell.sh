#!/bin/sh
#DOCKER="sudo docker"
DOCKER=podman
$DOCKER run -it --rm --pid=host -v worker-dir:/opt/fishtest/worker fishtest /bin/sh
