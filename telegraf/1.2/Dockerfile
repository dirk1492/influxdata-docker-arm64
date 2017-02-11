FROM aarch64/debian:jessie-slim

RUN gpg \
    --keyserver hkp://ha.pool.sks-keyservers.net \
    --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5 

ARG TELEGRAF_VERSION=1.2.1

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
		ca-certificates \
		wget \
		&& wget -q https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_arm64.deb.asc \
		&& wget -q https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_arm64.deb \
		&& apt-get purge wget -y \
		&& apt-get autoremove -y \
		&& rm -rf /var/lib/apt/lists/* \
		&& rm -rf /var/cache/*

RUN gpg --batch --verify telegraf_${TELEGRAF_VERSION}_arm64.deb.asc telegraf_${TELEGRAF_VERSION}_arm64.deb && \
    dpkg -i telegraf_${TELEGRAF_VERSION}_arm64.deb && \
    rm -f telegraf_${TELEGRAF_VERSION}_arm64.deb*

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
