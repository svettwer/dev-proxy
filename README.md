# dev-proxy
A proxy setup using docker for development purposes


## Get it
```bash
git clone https://github.com/svettwer/dev-proxy
cd dev-proxy
```

## Build it
```bash
docker build . -t squid
```

## Run it
```bash
sh run.sh
```

## Use it
```bash
PROXY_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' squid)
wget -e use_proxy=yes -e http_proxy=http://foobar:foo@${PROXY_IP}:3128 google.de
```

## Configure it
Change `squid.conf`.
See [Squid config docs](http://www.squid-cache.org/Doc/config/) for options.
