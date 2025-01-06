FROM ubuntu:latest

# Installing all the dependencies as this is a system we are building on from scratch
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git 

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

# Will run as if we are running all our terminal commands, instead all commands are in a file
ENTRYPOINT [ "/entrypoint.sh" ]

