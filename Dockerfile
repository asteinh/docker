FROM node:lts-alpine

MAINTAINER asteinh

RUN apk add --update --no-cache \
    bash curl tar make git openssh

# install docker
RUN apk add --no-cache docker-cli

# install gh-pages
RUN npm install -g --silent gh-pages@2.2.0

# install python & sphinx
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && pip3 install --no-cache --upgrade pip
RUN pip3 install --no-cache \
    sphinx \
    sphinx_rtd_theme \
    recommonmark \
    sphinxcontrib-matlabdomain

# create user
RUN mkdir -p /home/cibuild && \
    adduser --home /home/cibuild --shell /bin/bash cibuild --disabled-password && \
    chown -R cibuild:cibuild /home/cibuild/ && \
    chown -R cibuild:cibuild /usr/local/lib/node_modules/gh-pages

USER cibuild
WORKDIR /home/cibuild

# git config
RUN git config --global user.email "docker@tensorflowm-ci" && \
    git config --global user.name "tensorflowm-ci" && \
    ssh -o "StrictHostKeyChecking no" github.com || true

ENTRYPOINT ["/bin/bash"]
