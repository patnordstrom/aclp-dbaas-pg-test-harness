#!/usr/bin/env bash

source vars.sh

if [ "$1" = "pgbench" ];
  then
  docker-compose run --rm pgbench-init
  docker-compose run --rm pgbench
fi