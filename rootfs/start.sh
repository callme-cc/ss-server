#!/bin/sh
workdir=/work
keydir=/work/key

if [ ! -f $workdir/ss-server.conf ]; then
    echo "Create configure file.."
    mkdir $workdir
    cp -R /conf $workdir
fi
if [ ! -d $keydir ]; then
    echo "Create key file.."
    mkdir $keydir
    cd $keydir
    /usr/sbin/dnscrypt-wrapper --gen-provider-keypair  | grep Public > finger.txt
    cat $keydir/finger.txt
    /usr/sbin/dnscrypt-wrapper --gen-cert-file --crypt-secretkey-file=secret.key > dns.txt
fi

echo "Start ss-server.."
#/usr/sbin/ss-server -p 8443 -k $K -m $M $F $T
/usr/sbin/ss-server -c $workdir/ss-server.conf -f /tmp/ss-server.pid

echo "Start dnscrypt-wrapper..."
/usr/sbin/dnscrypt-wrapper --resolver-address=8.8.8.8:53 --listen-address=0.0.0.0:443 \
                   --provider-name=dns.baidu.com \
                   --crypt-secretkey-file=$keydir/secret.key --provider-cert-file=$keydir/dnscrypt.cert
