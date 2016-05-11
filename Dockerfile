FROM busybox
MAINTAINER TISP LIMITED Roy <roy@tisp.com>

ADD rootfs /
EXPOSE 8443 9443
CMD ["/start.sh"]

