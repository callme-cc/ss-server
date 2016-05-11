# ss-server
ss-server and DNSCrypt-Wrapper with busybox 

*ss-server run on 8433.*
*DNSCrypt-Wrapper run on 443.*



#### Run as default
```
docker run -d --name ss -p 8443:8443 -p 443:443 tisp/ss
```
#### Run with some option
```
docker run -d --name ss -p 8443:8443 -v ~/ss:/work tisp/ss
```

#### Client var.
```
## dnscrypt-proxy
--provider-key: see the /work/key/finger.txt
--provider-name: dns.baidu.com
--resolver-address: your docker ip:443

## ss-redir
{
    "server_port":8443,
    "password":"mypassword",
    "timeout":60,
    "method":"aes-128-cfb",
    "fast_open": true
}

```
