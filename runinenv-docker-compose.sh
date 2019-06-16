#!/usr/bin/env bash

export UNAME=$(whoami)
export UID=$(id -u)
export GID=$(id -g)

exec docker-compose "$@"
