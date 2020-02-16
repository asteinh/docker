FROM amd64/debian:bullseye

MAINTAINER asteinh

RUN apt-get update && \
    apt-get install -y bash curl octave liboctave-dev

RUN useradd -ms /bin/bash octave && \
    chown -R octave:octave /home/octave/
USER octave
WORKDIR /home/octave

ENTRYPOINT ["/bin/bash"]
