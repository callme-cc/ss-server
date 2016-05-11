#!/bin/sh
echo "./ss-server -k $K -m $M $F $T"
/usr/sbin/ss-server -A -u -p 8443 -k $K -m $M $F $T
