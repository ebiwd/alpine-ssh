FROM alpine:latest

LABEL maintainer www-dev@ebi.ac.uk

RUN apk add --update \
    rsync \
    openssh \
  && rm -rf /var/cache/apk/*

COPY files /

CMD ["/bin/sh"]
