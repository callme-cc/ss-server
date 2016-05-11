FROM busybox
MAINTAINER TISP LIMITED Roy <roy@tisp.com>

ADD rootfs /
EXPOSE 8443 443
CMD ["/start.sh"]

