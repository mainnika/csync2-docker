#!/bin/bash
set -eux

CSYNC_DEFAULT_MODE="-ii"

CSYNC_HOST=$CSYNC_HOST
CSYNC_ARGS=$CSYNC_ARGS
CSYNC_MODE=$CSYNC_MODE

if [ ! -z "$CSYNC_MODE" ]
then
	CSYNC_ARGS="$CSYNC_ARGS $CSYNC_MODE"
else
        CSYNC_ARGS="$CSYNC_ARGS $CSYNC_DEFAULT_MODE"
fi

if [ ! -z "$CSYNC_HOST" ]
then
	CSYNC_ARGS="$CSYNC_ARGS -N $CSYNC_HOST"
fi

// override generated cmdline if there is an user provided one
if [ ! -z "$*" ]
then
	CSYNC_ARGS="$*"
fi

set -- /usr/sbin/csync2 $CSYNC_ARGS
exec "$@"
