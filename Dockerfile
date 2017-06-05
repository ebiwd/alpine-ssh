FROM alpine:3.6

LABEL maintainer www-dev@ebi.ac.uk

RUN apk add --no-cache \
	bash \
    rsync \
    openssh

COPY files /

CMD ["/bin/sh"]
