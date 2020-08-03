FROM sameersbn/squid

RUN apt-get update && \
	apt-get install -y apache2-utils && \
	htpasswd -b -c /etc/squid/passwords foobar foo