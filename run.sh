#!/bin/bash

docker run -it --rm --name dev-proxy \
	--publish 3128:3128 \
	--volume $(pwd)/squid.conf:/etc/squid/squid.conf \
	--volume /srv/docker/squid/cache:/var/spool/squid \
	dev-proxy