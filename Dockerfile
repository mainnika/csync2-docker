# syntax = docker/dockerfile:1.2
FROM registry.access.redhat.com/ubi8/ubi

RUN set -eux; \
	dnf install -yq https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm; \
        dnf copr enable -yq mainnika/csync2; \
	dnf install -yq ca-certificates csync2; \
        dnf clean all \
        ;

ENV CSYNC_HOST=""
ENV CSYNC_MODE="-ii"
ENV CSYNC_ARGS="-v"

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

