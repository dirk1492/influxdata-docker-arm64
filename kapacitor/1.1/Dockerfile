FROM aarch64/debian:jessie-slim

RUN gpg \
    --keyserver hkp://ha.pool.sks-keyservers.net \
    --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5 

ARG VERSION=1.1.1

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
		ca-certificates \
		wget \
		&& wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor_${VERSION}_arm64.deb.asc \
		&& wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor_${VERSION}_arm64.deb \
		&& apt-get purge wget -y \
		&& apt-get autoremove -y \
		&& rm -rf /var/lib/apt/lists/* \
		&& rm -rf /var/cache/* \
		&& gpg --batch --verify kapacitor_${VERSION}_arm64.deb.asc kapacitor_${VERSION}_arm64.deb \
    		&& dpkg -i kapacitor_${VERSION}_arm64.deb \
    		&& rm -f kapacitor_${VERSION}_arm64.deb*

COPY kapacitor.conf /etc/kapacitor/kapacitor.conf

EXPOSE 9092

VOLUME /var/lib/kapacitor

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["kapacitord"]

