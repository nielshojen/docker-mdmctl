FROM ubuntu:bionic

ENV MICROMDM_VERSION=1.4.0

COPY run.sh /run.sh

RUN apt-get update && apt-get -y install curl unzip && \
    curl -L https://github.com/micromdm/micromdm/releases/download/v${MICROMDM_VERSION}/micromdm_${MICROMDM_VERSION}-1-g32e0711.zip -o /micromdm.zip && \
    unzip /micromdm.zip && \
    mv /build/linux/mdmctl / && \
    rm -r /build && \
    chmod a+x /mdmctl && \
    apt-get -y remove curl unzip && \
    chmod a+x /run.sh

CMD ["/run.sh"]
