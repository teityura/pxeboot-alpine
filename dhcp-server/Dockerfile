FROM alpine:3.12

RUN set -x && \
  apk add --no-cache dhcp

RUN rm -f /etc/dhcp/dhcpd.conf.example && \
  touch /var/lib/dhcp/dhcpd.leases && \
  touch /var/lib/dhcp/dhcpd.leases~ && \
  chown dhcp:dhcp /var/lib/dhcp/dhcpd.leases~

CMD /usr/sbin/dhcpd -4 -f -d --no-pid -cf '/etc/dhcp/dhcpd.conf' -lf '/var/lib/dhcp/dhcpd.leases' eno1
