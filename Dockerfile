FROM ubuntu:latest

MAINTAINER asteinh

RUN apt-get update
RUN apt-get install --no-install-recommends -y octave
RUN apt-get install --no-install-recommends -y \
    liboctave-dev \
    openjdk-11-jre-headless \
    unzip

RUN useradd -ms /bin/bash octave && \
    chown -R octave:octave /home/octave/
USER octave
WORKDIR /home/octave

ADD --chown=octave:octave https://github.com/asteinh/tensorflow.m/archive/master.zip tensorflowm.zip
RUN unzip -q tensorflowm.zip && \
    rm tensorflowm.zip && \
    mv tensor* tensorflowm

ADD --chown=octave:octave https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-1.15.0.tar.gz libtensorflow.tar.gz
RUN mkdir libtensorflow && \
    tar -xzf libtensorflow.tar.gz -C libtensorflow && \
    rm *.tar.gz

WORKDIR tensorflowm
RUN octave-cli --eval "LIBTENSORFLOW = '/home/octave/libtensorflow'; setup();"

ENTRYPOINT ["/usr/bin/octave"]
