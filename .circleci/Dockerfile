FROM alpine

ARG ARCH

ARG KUBECTL_VERSION=1.5.2

RUN case `uname -m` in \
    x86_64) ARCH=amd64; ;; \
    armv7l) ARCH=arm; ;; \
    aarch64) ARCH=arm64; ;; \
    ppc64le) ARCH=ppc64le; ;; \
    s390x) ARCH=s390x; ;; \
    *) echo "un-supported arch, exit ..."; exit 1; ;; \
    esac && \
    echo "export ARCH=$ARCH" > /envfile && \
    cat /envfile


# Install zip and unzip
RUN apk add --update zip unzip git curl docker docker-compose make bash openssh && \
    rm -rf /var/cache/apk/*

# Install python and pip
RUN apk add --no-cache --virtual .gyp python3 make g++

# Install aws-cli
RUN apk add --update python3 py-pip && \
    pip install awscli && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

# Install jq yq
RUN apk add --update --no-cache jq yq

# Install kubectl
RUN . /envfile && echo $ARCH && \
    apk add --update ca-certificates && \
    apk add --update -t deps curl && \
    curl -sLO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl && \
    apk del --purge deps && \
    rm /var/cache/apk/*

# RUN apk add --update ca-certificates && \
#     apk add --update -t deps curl && \
#     curl -L https://storage.googleapis.com/kubernetes-release/release/v1.5.2/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
#     chmod +x /usr/local/bin/kubectl && \
#     apk del --purge deps && \
#     rm /var/cache/apk/*

# Install aws-iam-authenticator
RUN . /envfile && echo $ARCH && \
    authenticator=$(curl -fs https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases/latest | jq --raw-output '.name' | sed 's/^v//') && \
    curl -fL https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${authenticator}/aws-iam-authenticator_${authenticator}_linux_${ARCH} -o /usr/bin/aws-iam-authenticator && \
    chmod +x /usr/bin/aws-iam-authenticator

# RUN apk add --update ca-certificates && \
#     apk add --update -t deps curl && \
#     curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator && \
#     chmod +x /usr/local/bin/aws-iam-authenticator && \
#     apk del --purge deps && \
#     rm /var/cache/apk/*

# Install eksctl
RUN . /envfile && echo $ARCH && \
    apk add --update ca-certificates && \
    apk add --update -t deps curl && \
    curl -sL "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_${ARCH}.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/bin && \
    chmod +x /usr/bin/eksctl && \
    rm /var/cache/apk/*