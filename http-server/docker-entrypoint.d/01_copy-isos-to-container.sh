#!/bin/sh

set -e

# CentOS Stream Release8
mkdir -p /var/isos/centos-stream-release8
cp -r /isos/centos-stream-release8/. /var/isos/centos-stream-release8/
ls -al /var/isos/centos-stream-release8/

exit 0
