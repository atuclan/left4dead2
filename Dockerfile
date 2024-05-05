FROM steamcmd/steamcmd:ubuntu-22

EXPOSE 27015

WORKDIR /server/

COPY server /server.skeleton/
COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
