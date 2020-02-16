FROM ubuntu:bionic

MAINTAINER asteinh

RUN apt-get update
RUN apt-get install -y curl git

# install docker
RUN mkdir -p /tmp/docker
RUN curl https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_19.03.6~3-0~ubuntu-bionic_amd64.deb -o /tmp/docker/docker-ce-cli.deb
RUN dpkg -i /tmp/docker/docker-ce-cli.deb
RUN rm -rf /tmp/docker

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g --silent gh-pages@2.2.0

RUN useradd -ms /bin/bash cibuild
RUN chown -R cibuild:cibuild /home/cibuild/
USER cibuild
WORKDIR /home/cibuild

# git config
RUN git config user.email "docker@tensorflowm-ci"
RUN git config user.name "tensorflowm-ci"
RUN ssh -o "StrictHostKeyChecking no" github.com || true

# cleanup
RUN rm -rf /tmp/*

ENTRYPOINT ["/bin/bash"]
