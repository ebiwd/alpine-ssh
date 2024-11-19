FROM alpine:3.20

LABEL maintainer="es-wwwdev@ebi.ac.uk"

# Install basic utilities, Python, and Kubernetes tools
RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    gettext \
    python3 \
    py3-pip \
    py-setuptools \
    rsync \
    perl \
    jq \
    wget \
    openssh \
    g++ \
    python3-dev \
    libffi-dev \
    openssl \
 && ln -sf python3 /usr/bin/python \
 && pip3 install --break-system-packages --upgrade pip setuptools \
 && pip3 --no-cache-dir install --break-system-packages awscli \
 && curl -LO "https://dl.k8s.io/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
 && chmod +x kubectl && mv kubectl /usr/local/bin/ \
 && curl -L -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
 && chmod 700 get_helm.sh \
 && ./get_helm.sh \
 && rm -f get_helm.sh \
 && mkdir -p $HOME/.kube

# Copy files into the image
COPY files /

# Default command
CMD ["/bin/bash"]
