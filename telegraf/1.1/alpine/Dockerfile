FROM aarch64/alpine:3.5

ARG TELEGRAF_VERSION=1.1.2

RUN apk add --no-cache ca-certificates && \
    update-ca-certificates

RUN apk add --no-cache --virtual .build-deps wget gnupg tar && \
    gpg --keyserver hkp://ha.pool.sks-keyservers.net \
        --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5 && \
    wget -q https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_arm64.tar.gz.asc && \
    wget -q https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_arm64.tar.gz && \
    gpg --batch --verify telegraf-${TELEGRAF_VERSION}_linux_arm64.tar.gz.asc telegraf-${TELEGRAF_VERSION}_linux_arm64.tar.gz && \
    tar -C / --strip-components=2 -xzf telegraf-${TELEGRAF_VERSION}_linux_arm64.tar.gz && \
    chmod +x /usr/bin/telegraf && \
    rm -rf *.tar.gz* /root/.gnupg && \
    apk del .build-deps

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
