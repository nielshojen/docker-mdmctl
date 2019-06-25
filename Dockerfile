FROM alpine:3.3

ENV MICROMDM_VERSION=1.5.0

COPY run.sh /run.sh

RUN apk --no-cache add curl && \
    curl -L https://github.com/micromdm/micromdm/releases/download/v${MICROMDM_VERSION}/micromdm_${MICROMDM_VERSION}.zip -o /micromdm.zip && \
    unzip /micromdm.zip && \
    mv /build/linux/mdmctl / && \
    rm -r /build && \
    chmod a+x /mdmctl && \
    apk del curl && \
    chmod a+x /run.sh

CMD ["/run.sh"]
