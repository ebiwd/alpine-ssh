FROM alpine:3.5

LABEL maintainer www-dev@ebi.ac.uk

RUN apk add --no-cache \
    bash \
    curl \
    rsync \
    openssh

COPY files /

CMD ["/bin/bash"]
