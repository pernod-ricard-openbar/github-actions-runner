FROM ubuntu:20.04

# Arguments
ARG VERSION="2.290.1"

# Environment variables
ENV URL=""
ENV TOKEN=""
ENV NAME=""
ENV GROUP=""
ENV LABELS=""

# To avoid prompt
ENV DEBIAN_FRONTEND=noninteractive

# Basic pacakges
RUN apt-get update && \
    apt-get install -y tzdata curl apt-transport-https ca-certificates software-properties-common

# Installing Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt-cache policy docker-ce
RUN apt install -y docker-ce


# Installing the runner
ENV RUNNER_ALLOW_RUNASROOT=1
WORKDIR /actions-runner
RUN curl -o actions-runner-linux-x64-${VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-x64-${VERSION}.tar.gz
RUN tar xzf ./actions-runner-linux-x64-${VERSION}.tar.gz
RUN ./bin/installdependencies.sh

# Cleanup
RUN rm -rf ./actions-runner-linux-x64-${VERSION}.tar.gz
RUN rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Entrypoint launching
WORKDIR /
COPY run.sh run.sh
RUN chmod +x run.sh
CMD ["./run.sh"]