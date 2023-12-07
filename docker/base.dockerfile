FROM --platform=amd64 ubuntu:22.04

RUN apt update &&\
    apt install -y software-properties-common &&\
    add-apt-repository -y multiverse &&\
    dpkg --add-architecture i386 &&\
    apt update &&\
    apt -y install htop sudo mc lnav ruby wget curl &&\
    apt clean
