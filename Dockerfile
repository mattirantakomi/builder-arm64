FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Helsinki

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y apt-transport-https mysql-client \
    nano less telnet wget iptables procps tzdata locales dnsutils \
    iputils-ping traceroute net-tools screen rsync \
    build-essential unzip wget git bison flex mtools nano u-boot-tools bc \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

CMD ["tail", "-f", "/dev/null"]
