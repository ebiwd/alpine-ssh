FROM alpine:3.6

LABEL maintainer www-dev@ebi.ac.uk

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    gettext \
    python \
    py-pip \
    py-setuptools \
    rsync \
    perl \
    jq \
    wget \
    openssh

# Install kubectl & Helm for kubernetes setup

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
 && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl \
 && curl -LO https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz \
 && tar -xvzf helm-v3.8.0-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && chmod +x /usr/local/bin/helm \
 && mkdir -p $HOME/.kube

RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools
    
RUN pip --no-cache-dir install \
    awscli

COPY files /

CMD ["/bin/bash"]
