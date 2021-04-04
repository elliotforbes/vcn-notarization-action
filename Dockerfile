# The Base Image we want to use for our action
FROM linuxbrew/linuxbrew

# We copy the shell script that will perform the action of notarizing any
# files or docker images we pass into it
COPY entrypoint.sh /entrypoint.sh

# Downloads the latest version of codenotary's vcn tool
RUN brew tap vchain-us/brew
RUN brew install vcn

# We specify the entrypoint for our GitHub action which should be the shell script
# that we have above
ENTRYPOINT [ "/entrypoint.sh" ]