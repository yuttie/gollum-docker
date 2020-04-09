# Dockerfile for Gollum

## Build

```sh
docker build -t gollum .
```


## Run

```sh
docker run --name=my-gollum --rm -v$(pwd):/wiki -u $(id -u $USER):$(id -g $USER) -p 4567:4567 gollum
```
