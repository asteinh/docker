FROM amd64/debian:10

MAINTAINER asteinh

RUN apt-get update
RUN apt-get install -y bash curl tar git
RUN apt-get install -y octave

RUN useradd -ms /bin/bash octave && \
    chown -R octave:octave /home/octave/

USER octave
WORKDIR /home/octave
