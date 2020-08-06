# dev-proxy
A proxy setup using docker for development purposes


## Get it
```bash
git clone https://github.com/svettwer/dev-proxy
cd dev-proxy
```

## Build it
```bash
docker build . -t dev-proxy
```

## Run it
```bash
sh run.sh
```

## Use it
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
