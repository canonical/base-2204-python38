FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    PYTHONUNBUFFERED=1

RUN apt update && \
    apt install -y gnupg && \
    gpg --list-keys && \
    gpg --no-default-keyring --keyring /usr/share/keyrings/deadsnakes.gpg --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 && \
    echo 'deb [signed-by=/usr/share/keyrings/deadsnakes.gpg] http://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy main' | tee -a /etc/apt/sources.list.d/python.list && \
    apt update && \
    apt install curl python3.8 python3.8-distutils -y && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
    curl --output get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3.8 get-pip.py && \
    apt clean 
