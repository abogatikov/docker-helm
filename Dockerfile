FROM alpine/helm:2.16.1
MAINTAINER abogatikov@devalexb.com

ARG VERSION=1.16.2
ENV BIN_URL="https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/kubectl"

# install kubectl
RUN apk add --update --no-cache curl ca-certificates && \
    curl -LO ${BIN_URL} && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    apk del curl && \
    rm -f /var/cache/apk/*