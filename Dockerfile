FROM ubuntu:latest

# Installing all the dependencies as this is a system we are building on from scratch
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git 

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install PyYAML within the virtual environment
RUN pip install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

# Will run as if we are running all our terminal commands, instead all commands are in a file
ENTRYPOINT [ "/entrypoint.sh" ]
