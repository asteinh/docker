FROM ubuntu:bionic

MAINTAINER asteinh

RUN apt-get update
RUN apt-get install -y curl git

# install docker
RUN mkdir -p /tmp/docker
WORKDIR /tmp/docker
RUN curl https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_19.03.6~3-0~ubuntu-bionic_amd64.deb -o docker-ce-cli.deb
RUN dpkg -i docker-ce-cli.deb

RUN useradd -ms /bin/bash cibuild
RUN chown -R cibuild:cibuild /home/cibuild/
USER cibuild
WORKDIR /home/cibuild

RUN rm -rf /tmp/docker

ENTRYPOINT ["/bin/bash"]
