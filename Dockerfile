FROM ubuntu:24.04

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
    build-essential \
    ca-certificates \
    curl \
    git \
    zip \
    unzip \
    gnupg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
 && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
 && apt update \
 && apt install -y \
    nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
 && apt-get install -y --force-yes --no-install-recommends \
    ruby-full \
    gcc \
    g++ \
    software-properties-common \
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

RUN mkdir /tmp/npm_cache/ \
 && chmod -R 777 /tmp/npm_cache/ /root \
 && npm config set cache /tmp/npm_cache --global

RUN gem install rake bundler

RUN cd /tmp \
  && curl https://awscli.amazonaws.com/awscli-exe-linux-`uname -i`.zip -o awscliv2.zip \
  && unzip -q awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

RUN mkdir -p /www

WORKDIR /www
