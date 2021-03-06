#!/bin/sh
workdir=/work
keydir=/work/key

if [ ! -f $workdir/ss-server.conf ]; then
    echo "Create configure file.."
    mkdir $workdir
    cp /conf/ss-server.conf $workdir
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
/usr/sbin/ss-server -c $workdir/ss-server.conf -f /tmp/ss-server.pid

echo "Start dnscrypt-wrapper..."
/usr/sbin/dnscrypt-wrapper --resolver-address=8.8.8.8:53 \
                   --provider-name=2.dnscrypt-cert.baidu.com \
                   --crypt-secretkey-file=$keydir/secret.key \
                   --provider-cert-file=$keydir/dnscrypt.cert \
                   --provider-publickey-file=$keydir/public.key

