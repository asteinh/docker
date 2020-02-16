FROM amd64/debian:bullseye

MAINTAINER asteinh

RUN apt-get update
RUN apt-get install -y bash octave liboctave-dev

RUN useradd -ms /bin/bash octave
RUN chown -R octave:octave /home/octave/
USER octave
WORKDIR /home/octave

ENTRYPOINT ["/bin/bash"]
