FROM aarch64/debian:jessie-slim

RUN gpg \
    --keyserver hkp://ha.pool.sks-keyservers.net \
    --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5 

ARG VERSION=1.2.0

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
		ca-certificates \
		wget \
		&& wget -q https://dl.influxdata.com/influxdb/releases/influxdb_${VERSION}_arm64.deb.asc \
		&& wget -q https://dl.influxdata.com/influxdb/releases/influxdb_${VERSION}_arm64.deb \
		&& apt-get purge wget -y \
		&& apt-get autoremove -y \
		&& rm -rf /var/lib/apt/lists/* \
		&& rm -rf /var/cache/* \
		&& gpg --batch --verify influxdb_${VERSION}_arm64.deb.asc influxdb_${VERSION}_arm64.deb \
    		&& dpkg -i influxdb_${VERSION}_arm64.deb \
    		&& rm -f influxdb_${VERSION}_arm64.deb*

COPY influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]

