FROM alpine:3.9

LABEL maintainer="Ed Lim <limed@mozilla.com>"

ENV PACKAGE_VERSION="v3.0.2"
ENV KUBECTL_VERSION="v1.12.1"

COPY handler.sh /handler.sh

RUN apk add --no-cache bash curl && \
	curl -Lf -o /usr/bin/lifecycled https://github.com/buildkite/lifecycled/releases/download/${PACKAGE_VERSION}/lifecycled-linux-amd64 && \
	chmod +x /usr/bin/lifecycled && \
	curl -Lf -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
	chmod +x /usr/bin/kubectl && \
	chmod +x /handler.sh
