#!/bin/sh
sudo docker run -it --rm --pid=host -v worker-dir:/opt/fishtest/worker fishtest /bin/sh
