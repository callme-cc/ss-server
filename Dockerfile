FROM busybox
MAINTAINER TISP LIMITED Roy <roy@tisp.com>

ADD rootfs /
ENV K "secert@key"
ENV M "aes-128-cfb"
ENV F "--fast-open"
ENV T "-t 60"
EXPOSE 8443
RUN chmod +x /run.sh
CMD ["/run.sh"]

