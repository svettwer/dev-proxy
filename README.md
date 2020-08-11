# dev-proxy
A proxy setup for development purposes using docker.

## Get it
```
docker pull svettwer/dev-proxy
```

## Run it
```bash
docker run --it --rm --name dev-proxy \
	--publish 3128:3128 \
	--volume <PATH_TO>/squid.conf:/etc/squid/squid.conf \
	--volume /srv/docker/squid/cache:/var/spool/squid \
	dev-proxy
```

or use

```bash
sh run.sh
```

## Use it
The container ships with a preconfigured user to test proxy authentication.
user: foobar
password: foo
```bash
PROXY_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dev-proxy)
wget -e use_proxy=yes -e http_proxy=http://foobar:foo@${PROXY_IP}:3128 google.de
```

## Configure it
Change `squid.conf`.
See [Squid config docs](http://www.squid-cache.org/Doc/config/) for options.  
Config options of the base image can be found on [Docker hub](https://hub.docker.com/r/sameersbn/squid)

## Reconfigure it
To reload the config in a running dev-proxy container, use `docker kill -s HUP dev-proxy`.

## Build it yourself
```bash
git clone https://github.com/svettwer/dev-proxy
cd dev-proxy
docker build . -t dev-proxy
```
