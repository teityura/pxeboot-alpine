FROM alpine:3.12

RUN set -x && \
  apk add --no-cache apache2

COPY ./docker-entrypoint.sh ./docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD /usr/sbin/httpd -DFOREGROUND
