FROM node:lts-alpine

MAINTAINER asteinh

RUN apk add --update --no-cache \
    bash git openssh make

# install docker
RUN apk add --no-cache docker-cli

# install gh-pages
RUN npm install -g --silent gh-pages@2.2.0
RUN npm cache clean --force

# install python & sphinx
RUN apk add --no-cache python3
RUN python3 -m ensurepip && pip3 install --no-cache --upgrade pip
RUN pip3 install --no-cache \
    sphinx \
    sphinx_rtd_theme \
    recommonmark \
    sphinxcontrib-matlabdomain

# create user
RUN mkdir -p /home/cibuild
RUN adduser --home /home/cibuild --shell /bin/bash cibuild --disabled-password
RUN chown -R cibuild:cibuild /home/cibuild/
USER cibuild
WORKDIR /home/cibuild

# git config
RUN git config --global user.email "docker@tensorflowm-ci"
RUN git config --global user.name "tensorflowm-ci"
RUN ssh -o "StrictHostKeyChecking no" github.com || true

ENTRYPOINT ["/bin/bash"]
