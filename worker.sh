#!/bin/sh
# Usage: worker.sh args
sudo docker run -it --rm --pid=host -v worker-dir:/opt/fishtest/worker -e "args=$*" fishtest
