# csync2-docker

> `docker pull do.cr.tokarch.uk/mainnika/csync2`

The image in this repository is based on Red Hat Universal Base Image 8 ["registry.access.redhat.com/ubi8/ubi"](https://catalog.redhat.com/software/containers/ubi8/ubi/5c359854d70cc534b3a3784e).

## configure by using env

- CSYNC_HOST, no default value
- CSYNC_MODE, default=`-ii`
- CSYNC_ARGS, default=`-v`

### CSYNC_HOST

it is possible to override the node hostname, if this env has data then csync2 will be run with `-N nodename`.

### CSYNC_MODE

by default csync2 run with `-ii` mode, but one can override this mode, e.g. `CSYNC_MODE=-i`.

### CSYNC_ARGS

entrypoint run csync2 with verbose mode, `-v`. if custom args are necessary then setup `CSYNC_ARGS=-r`

## build image

```
$ DOCKER_BUILDKIT=1 docker build -t csync2 .
```

