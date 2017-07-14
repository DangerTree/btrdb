#!/bin/bash
set -ex

vmajor=$(cat ../version/consts.go | grep "VersionMajor" | cut -d' ' -f 4)
vminor=$(cat ../version/consts.go | grep "VersionMinor" | cut -d' ' -f 4)
vsubminor=$(cat ../version/consts.go | grep "VersionSubminor" | cut -d' ' -f 4)
version=$vmajor.$vminor.$vsubminor

cp Dockerfile_ Dockerfile
echo "LABEL BTrDB_Version=$version" >> Dockerfile

cp ./release/amd64/btrdbd .
cp `which panicparse` .

docker build --no-cache -t btrdb/release .
#docker push btrdb/release

docker build -t btrdb/release:latest .
#docker push btrdb/release:latest

docker build -t btrdb/release:$vmajor .
#docker push btrdb/release:$vmajor

#docker build -t btrdb/release:$vmajor.$vminor .
#docker push btrdb/release:$vmajor.$vminor

#docker build -t btrdb/release:$vmajor.$vminor.$vsubminor .
#docker push btrdb/release:$vmajor.$vminor.$vsubminor
