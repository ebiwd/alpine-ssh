FROM alpine:3.6

LABEL maintainer www-dev@ebi.ac.uk

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    python \
    py-pip \
    py-setuptools \
    rsync \
    openssh

RUN pip --no-cache-dir install \
    awscli

COPY files /

CMD ["/bin/bash"]
