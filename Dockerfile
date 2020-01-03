FROM debian:stable-slim
LABEL maintainer="lucianoborguetti@gmail.com"
LABEL version="20.01.03"

# Set envs
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get -qqy update \
 && apt-get -qqy dist-upgrade \
 && apt-get -qqy install ca-certificates \
 && apt-get -qqy install curl \
 && apt-get -qqy install ngrep \
 && apt-get -qqy autoremove \
 && apt-get -qqy clean \
 && rm -rf /var/lib/apt/*
