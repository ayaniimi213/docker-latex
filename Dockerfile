# texlive Dockerfile
# https://github.com/ayaniimi213/docker-latex

# Pull base image.
FROM ubuntu:zesty

# maintainer details
MAINTAINER Ayahiko Niimi "niimi@fun.ac.jp"

# Install texlive
RUN set -x && \
      sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list && \
      apt update && apt -y upgrade && \
      apt -y install git wget software-properties-common && \
      apt-add-repository -y ppa:jonathonf/texlive && \
      apt -y install texlive-full latexmk ghostscript && \
      mktexlsr && \
      apt autoremove && \
      apt clean && \
      kanji-config-updmap-sys auto

WORKDIR /data
# VOLUME ["/data"]

CMD ["/usr/bin/latexmk"]
