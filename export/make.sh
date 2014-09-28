#!/bin/bash


VERSION=$(cat ../VERSION)
NAME=sshblock
OUT=$NAME-$VERSION
echo $NAME-$VERSION

rm -rf export

mkdir -v export

# For source:
rm -rf source/
mkdir -pv source/$OUT
cp -v ../blocker source/$OUT
(cd source && tar -cvf $OUT.tar $OUT/)
gzip -9 source/$OUT.tar
cp -v source/$OUT.tar.gz export/



# For debian:
rm -rf debian/
mkdir debian/usr/bin -pv
mkdir debian/var/run/sshblock -pv
mkdir debian/var/cache/sshblock -pv
mkdir -pv debian/etc/rsyslog.d
cp ../blocker debian/usr/bin
echo "auth.*\t|/var/run/sshblock/logpipe" \
	> debian/etc/rsyslog.d/sshblock.conf
mkfifo debian/var/run/sshblock/logpipe
