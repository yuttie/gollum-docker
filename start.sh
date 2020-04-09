#!/bin/sh
docker run --name=gollum \
           -d \
           --restart=unless-stopped \
           -v $(pwd):/wiki \
           -u $(id -u $USER):$(id -g $USER) \
           -p 4567:4567 \
           gollum
