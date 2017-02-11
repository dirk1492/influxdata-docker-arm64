FROM aarch64/debian:jessie-slim

RUN gpg \
    --keyserver hkp://ha.pool.sks-keyservers.net \
    --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5

ARG VERSION=1.1.0~beta6

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
                ca-certificates \
                wget \
                && wget -q https://dl.influxdata.com/chronograf/releases/chronograf_${VERSION}_arm64.deb \
                && apt-get purge wget -y \
                && apt-get autoremove -y \
                && rm -rf /var/lib/apt/lists/* \
                && rm -rf /var/cache/* \
                && dpkg -i chronograf_${VERSION}_arm64.deb \
                && rm -f chronograf_${VERSION}_arm64.deb*

EXPOSE 8888

VOLUME /var/lib/chronograf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["chronograf"]
