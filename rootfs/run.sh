#!/bin/sh
echo "./ss-server -k $K -m $M $F $T"
/usr/sbin/ss-server -A -p 8443 -k $K -m $M $F $T
