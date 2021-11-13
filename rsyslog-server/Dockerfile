FROM alpine:3.12

RUN set -x && \
  apk add --no-cache rsyslog

CMD /usr/sbin/rsyslogd -n -f /etc/rsyslog.d/pxe.conf
