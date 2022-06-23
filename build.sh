#!/bin/sh
sudo docker image rm fishtest:latest > /dev/null 2>&1
sudo docker build --no-cache -t fishtest:latest .
