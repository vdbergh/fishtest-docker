#!/bin/sh
DOCKER="sudo docker"
#DOCKER=podman
$DOCKER image rm fishtest:latest > /dev/null 2>&1
$DOCKER volume rm worker-dir > /dev/null 2>&1
$DOCKER build -t fishtest:latest .
