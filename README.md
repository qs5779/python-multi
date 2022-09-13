## [`python-multi`][1] Dockerfile

This is a single purpose repository intended to provide a Dockerfile for an
image with multiple Python versions installed.

The Dockerfile uses `pyenv` to install the included Python versions.

## Short Description

The "Short Description" on Docker Hub should read:

> Multiple Python versions and tox installed into Ubuntu LTS 20.04

This is provided here as a back-up (i.e. in case the short
description is overwritten).

## Commands

This is a collection of useful `docker` commands relevant to
this directory. Some of them are just generic `docker` commands
for making sure the local system is in a good state (useful
for those who don't use `docker` on a regular basis).

### Specific

```
$ docker build \
>   --file src/Dockerfile \
>   --tag qs5779/python-multi:latest \
>   .
$ docker run \
>   --rm \
>   --tty \
>   --interactive \
>   --volume $(git rev-parse --show-toplevel):/var/code/ \
>   qs5779/python-multi:latest \
>   /bin/bash
```

### Generic

```
$ docker system prune  # Clean-up
$ docker image  prune  # Clean-up
$ docker container ls  # Running containers
$ docker images        # List installed/cached images
$ docker image rm ${IMAGE_ID}
$ docker image rm ${REPOSITORY}:${TAG}
```

[1]: https://hub.docker.com/r/qs5779/python-multi/

### Credits/Acknowlegement

forked from https://github.com/jeverling/python-multi which was forked from
https://github.com/dhermes/python-multi

I create i needed tox and python3.10 which was provided by the jeverling fork.
I created this fork as I'll hopefull keep the python versions update as new ones are released.
