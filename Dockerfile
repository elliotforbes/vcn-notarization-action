# The Base Image we want to use for our action
FROM alpine:latest

# install curl
RUN apk update && apk add bash
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

# create a workspace directory for us to work in
WORKDIR /workspace

# We copy the shell script that will perform the action of notarizing any
# files or docker images we pass into it
COPY . /workspace

# We specify the entrypoint for our GitHub action which should be the shell script
# that we have above
ENTRYPOINT [ "/workspace/entrypoint.sh" ]
# CMD ["vcn"]