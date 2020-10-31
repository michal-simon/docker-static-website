FROM ubuntu:20.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    software-properties-common \
    curl \
    git \
    python3-pip \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg8-dev \
    zlib1g-dev \
    gpg-agent \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:brightbox/ruby-ng -y
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get update \
 && apt-get install -y --force-yes --no-install-recommends \
  nodejs \
  ruby2.6 \
  ruby2.6-dev \
  zip \
  unzip \
  gcc \
  g++ \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN gem install rake bundler
RUN pip3 install setuptools --upgrade \
 && pip3 install awscli --upgrade
RUN mkdir -p /www

USER root
WORKDIR /www
