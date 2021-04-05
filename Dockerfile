FROM alpine:latest

RUN apk update && apk add bash
RUN apk add --update \ 
    curl \
    && rm -rf /var/cache/apk/*

WORKDIR /workspace
COPY . /workspace
ENTRYPOINT [ "/workspace/entrypoint.sh" ]