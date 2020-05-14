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
    openssh

# Install kubectl & Helm for kubernetes setup

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl \
 && curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.12.3-linux-amd64.tar.gz \
 && tar -xvzf helm-v2.12.3-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && chmod +x /usr/local/bin/helm \
 && mkdir -p $HOME/.kube


RUN pip --no-cache-dir install \
    awscli

COPY files /

CMD ["/bin/bash"]
