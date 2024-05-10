FROM steamcmd/steamcmd:ubuntu-22

EXPOSE 27015

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y libcurl4-openssl-dev \
  && apt-get clean \
  && rm -rf  /var/log/*log /var/lib/apt/lists/* /var/log/apt/* /var/lib/dpkg/*-old /var/cache/debconf/*-old \
  && useradd -m steam

USER steam

WORKDIR /server/

COPY server /server.skeleton/
COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
