FROM python:3.6.10-slim-buster

MAINTAINER asteinh

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install make git

RUN pip install numpy \
    svg.path==4.0.2 \
    casadi==3.5.1 \
    Sphinx \
    recommonmark \
    sphinx-rtd-theme \
    coverage \
    pytest \
    codecov

RUN useradd -ms /bin/bash sympathor && \
    chown -R sympathor:sympathor /home/sympathor/
USER sympathor
WORKDIR /home/sympathor

ENTRYPOINT ["/bin/bash"]
