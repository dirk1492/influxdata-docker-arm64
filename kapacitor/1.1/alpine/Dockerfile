FROM aarch64/alpine:3.5

ARG VERSION=1.1.1

RUN apk add --no-cache ca-certificates && \
    update-ca-certificates

RUN apk add --no-cache --virtual .build-deps wget gnupg tar && \
    gpg --keyserver hkp://ha.pool.sks-keyservers.net \
        --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5 && \
    wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor-${VERSION}_linux_arm64.tar.gz.asc && \
    wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor-${VERSION}_linux_arm64.tar.gz && \
    gpg --batch --verify kapacitor-${VERSION}_linux_arm64.tar.gz.asc kapacitor-${VERSION}_linux_arm64.tar.gz && \
    tar -C / -xzf kapacitor-${VERSION}_linux_arm64.tar.gz --strip-components=2 && \
    rm -rf *.tar.gz* /root/.gnupg && \
    apk del .build-deps

COPY kapacitor.conf /etc/kapacitor/kapacitor.conf

EXPOSE 9092

VOLUME /var/lib/kapacitor

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["kapacitord"]

