FROM alpine:3.3

ENV MICROMDM_VERSION=1.4.0

RUN apk --no-cache add curl && \
    curl -L https://github.com/micromdm/micromdm/releases/download/v${MICROMDM_VERSION}/micromdm_${MICROMDM_VERSION}-1-g32e0711.zip -o /micromdm.zip && \
    unzip /micromdm.zip && \
    mv /build/linux/mdmctl / && \
    rm -r /build && \
    chmod a+x /mdmctl && \
    apk del curl && \
    mkdir /config /certs /repo && \
