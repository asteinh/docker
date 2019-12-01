FROM amd64/debian:bullseye
MAINTAINER asteinh

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y octave=5.1.0-4+b1

RUN useradd -ms /bin/bash octave
RUN chown -R octave:octave /home/octave/

USER octave
WORKDIR /home/octave

ENTRYPOINT ["octave"]
