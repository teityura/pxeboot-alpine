FROM alpine:3.12

RUN set -x && \
  apk add --no-cache tftp-hpa syslinux

COPY ./docker-entrypoint.sh ./docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD /usr/sbin/in.tftpd -L -s /tftpboot/
