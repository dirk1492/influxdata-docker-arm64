FROM aarch64/alpine:3.5

ARG VERSION=1.1.0~beta6

RUN apk update && apk upgrade && \
    apk add --no-cache ca-certificates && \
    update-ca-certificates

RUN apk add --no-cache --virtual .build-deps wget tar && \
    wget https://dl.influxdata.com/chronograf/releases/chronograf-${VERSION}_linux_arm64.tar.gz && \
    tar -C / -xzf chronograf-${VERSION}_linux_arm64.tar.gz --strip-components=2 && \
    rm -rf *.tar.gz* /root/.gnupg && \
    apk del .build-deps

EXPOSE 8888

VOLUME /var/lib/chronograf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["chronograf"]
