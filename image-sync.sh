#!/bin/bash

mkdir -p /root/.docker

SOURCE_COUNT=$(echo $SOURCE_ADDRESSES | jq length)

for ((i=0; i<SOURCE_COUNT; i++)); do
  SOURCE_NAME=$(echo $SOURCE_ADDRESSES | jq -r ".[$i].name")
  SOURCE_TAG=$(echo $SOURCE_ADDRESSES | jq -r ".[$i].tag")
  DEST_NAME=$(echo $DESTINATION_ADDRESSES | jq -r ".[$i].name")
  DEST_TAG=$(echo $DESTINATION_ADDRESSES | jq -r ".[$i].tag")

  SOURCE="$SOURCE_NAME:$SOURCE_TAG"
  DEST="$DEST_NAME:$DEST_TAG"

  docker pull $SOURCE
  docker tag $SOURCE $DEST
  docker push $DEST
done
