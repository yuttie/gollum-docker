#!/bin/sh
docker run --name=gollum \
           -d \
           --restart=unless-stopped \
           -v $(pwd)/notes:/wiki \
           -u $(id -u $USER):$(id -g $USER) \
           -p 4567:8080 \
           gollum
