FROM aarch64/alpine:3.5

ARG VERSION=1.2.0

RUN apk add --no-cache ca-certificates && \
    update-ca-certificates

RUN apk add --no-cache --virtual .build-deps wget gnupg tar && \
    gpg --keyserver hkp://ha.pool.sks-keyservers.net \
        --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5 && \
    wget -q https://dl.influxdata.com/influxdb/releases/influxdb-${VERSION}_linux_arm64.tar.gz.asc && \
    wget -q https://dl.influxdata.com/influxdb/releases/influxdb-${VERSION}_linux_arm64.tar.gz && \
    gpg --batch --verify influxdb-${VERSION}_linux_arm64.tar.gz.asc influxdb-${VERSION}_linux_arm64.tar.gz && \
    tar -C / -xzf influxdb-${VERSION}_linux_arm64.tar.gz --strip-components=2 && \
    rm -rf *.tar.gz* /root/.gnupg && \
    apk del .build-deps

COPY influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]

