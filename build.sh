#!/bin/sh

set -xe

# Build Raspberry Pi image
#docker build -t mruettgers/freeswitch -f targets/rpi/Dockerfile .

# Build AMD64 image
docker build -t mruettgers/freeswitch -f targets/amd64/Dockerfile .