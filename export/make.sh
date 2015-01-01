#!/bin/bash


VERSION=$(cat ../VERSION)
NAME=bruteblocker
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
mkdir debian/var/run/bruteblocker -pv
mkdir debian/var/cache/bruteblocker -pv
mkdir -pv debian/etc/rsyslog.d
cp ../blocker debian/usr/bin
echo "auth.*\t|/var/run/bruteblocker/logpipe" \
	> debian/etc/rsyslog.d/bruteblocker.conf
mkfifo debian/var/run/bruteblocker/logpipe
