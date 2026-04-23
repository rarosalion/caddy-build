#!/bin/sh

docker build . --tag caddy-build:latest
docker cp $(docker create caddy-build:latest):/usr/bin/caddy ./
