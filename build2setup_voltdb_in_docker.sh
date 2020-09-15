#!/bin/bash
set -x

apt-get update
apt-get -y install ant build-essential ant-optional openjdk-8-jdk python cmake valgrind ntp ccache git git-email python-httplib2 python-setuptools python-dev 
#apt-show-versions 
#apt-show-versions 出错 
#rm /etc/apt/apt.conf.d/docker-gzip-indexes && apt-get purge -y apt-show- versions 
rm /var/lib/apt/lists/*lz4 && apt-get -o Acquire::GzipIndexes=false update 
apt-get install -y apt-show-versions

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ 
export JRE_HOME=${JAVA_HOME}/jre 
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib 
export PATH=${JAVA_HOME}/bin:$PATH

git clone https://github.com/VoltDB/voltdb.git && cd voltdb

ant 

export PATH="$PATH:$(pwd)/bin/" 
cd tests/test_apps/tpcc

./run.sh server > sever.log & 
./run.sh init 
./run.sh client 2>&1 | tee client.log
