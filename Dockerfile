FROM amd64/debian:10

MAINTAINER asteinh

RUN apt-get update && \
    apt-get install -y bash curl tar git
RUN apt-get install --no-install-recommends -y octave liboctave-dev
RUN apt-get clean && apt-get autoclean
RUN useradd -ms /bin/bash octave && \
    chown -R octave:octave /home/octave/

USER octave
WORKDIR /home/octave
