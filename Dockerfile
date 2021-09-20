FROM alpine:3.13

LABEL maintainer www-dev@ebi.ac.uk

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    gettext \
    py-pip \
    py-setuptools \
    rsync \
    perl \
    jq \
    wget \
    openssh

# Install kubectl & Helm for kubernetes setup
ENV VERIFY_CHECKSUM=false
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl \
 && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
 && chmod 700 get_helm.sh \
 && ./get_helm.sh \
 && chmod +x /usr/local/bin/helm \
 && mkdir -p $HOME/.kube

RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools
    
RUN pip --no-cache-dir install \
    awscli

COPY files /

CMD ["/bin/bash"]
