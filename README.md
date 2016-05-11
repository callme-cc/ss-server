# ss-server
ss-server with busybox

#### Run as default
```
docker run -d --name ss -p 8443:8443  tisp/ss
```
#### Run with some option
```
docker run -d --name ss -p 8443:8443 \
-e K="YOU KEY" -e M="rc4" -e F="" -e T="-t 30" \
tisp/ss
```
