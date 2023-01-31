FROM ubuntu:22.04

ARG PYTHON_VERSION
ENV DEBIAN_FRONTEND=noninteractive 
ENV DEBCONF_NONINTERACTIVE_SEEN=true 
ENV PYTHONUNBUFFERED=1

RUN apt-get update
RUN apt install dirmngr ca-certificates software-properties-common apt-transport-https wget -y
RUN gpg --list-keys
RUN gpg --no-default-keyring --keyring /usr/share/keyrings/deadsnakes.gpg --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776
RUN echo 'deb [signed-by=/usr/share/keyrings/deadsnakes.gpg] https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy main' | tee -a /etc/apt/sources.list.d/python.list
RUN apt update
RUN apt install python3.8 python3.8-distutils -y
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.8 get-pip.py
