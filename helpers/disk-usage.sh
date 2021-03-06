#!/bin/bash

# disk-usage from docker-experiments
# https://github.com/rsp/docker-experiments
# by Rafał Pocztarski - https://github.com/rsp

if [ $# -ne 1 ]; then
  echo "Usage: $0 \"image1 image2 ...\""
  exit 1
fi

images="$1"

echo "docker-experiments/disk-usage - data from `date -I`"
echo "See: https://github.com/rsp/docker-experiments"

echo -e "Image\tDisk usage"
echo -e "-----\t----------"
for image in $images; do
  echo -ne "$image\t"
  docker run --entrypoint=/bin/sh $image -c \
    'du -sh / 2>/dev/null | cut -f1' \
    || echo "ERROR!"
done
