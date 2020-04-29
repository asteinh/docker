FROM python:3.6.10-slim-buster

MAINTAINER asteinh

RUN pip install numpy \
    svg.path==4.0.2 \
    casadi==3.5.1 \
    Sphinx \
    recommonmark \
    sphinx-rtd-theme

RUN useradd -ms /bin/bash sympathor && \
    chown -R sympathor:sympathor /home/sympathor/
USER sympathor
WORKDIR /home/sympathor

ENTRYPOINT ["/bin/bash"]
