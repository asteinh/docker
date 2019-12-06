FROM ubuntu:18.04
MAINTAINER asteinh

# General utilities
RUN apt-get update && apt-get install -y \
  binutils git wget tar build-essential

# Matlab dependencies
RUN apt-get install -y \
    libpng-dev libfreetype6-dev libexpat1 libblas-dev liblapack-dev gfortran \
    libxml2-dev libx11-6 libxext6 libxt6 libxmu6 libxrender1 libxcomposite1 \
    libxmu6 libxrandr2 libfontconfig1 libxi-dev libxcursor-dev libxfixes-dev \
    libasound2-dev libxdamage-dev libxtst-dev libdbus-1-dev libcap-dev \
    libglvnd-dev

# gitlab-runner user to execute jobs
RUN useradd -ms /bin/bash gitlab-runner

USER gitlab-runner
WORKDIR /home/gitlab-runner
