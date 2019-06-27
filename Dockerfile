FROM alpine:3.3

ENV MICROMDM_VERSION=1.5.0

COPY run.sh /run.sh

RUN apk --no-cache add curl
RUN curl -L https://github.com/micromdm/micromdm/releases/download/v${MICROMDM_VERSION}/micromdm_v${MICROMDM_VERSION}.zip -o /micromdm.zip
RUN unzip /micromdm.zip
RUN mv /build/linux/mdmctl /
RUN rm -r /build
RUN chmod a+x /mdmctl
RUN apk del curl
RUN chmod a+x /run.sh

CMD ["/run.sh"]
