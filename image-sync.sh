#!/bin/bash

mkdir -p /root/.docker


IMAGE_COUNT=$(echo $IMAGES | jq length)

for ((i=0; i<$IMAGE_COUNT; i++)); do
  IMAGE_NAME=$(echo $IMAGES | jq -r ".[$i].name")
  IMAGE_TAG=$(echo $IMAGES | jq -r ".[$i].tag")

  docker pull reg.redrock.team/dockerhub/$IMAGE_NAME:$IMAGE_TAG

  docker tag reg.redrock.team/dockerhub/$IMAGE_NAME:$IMAGE_TAG reg.redrock.team/sre/$IMAGE_NAME:$IMAGE_TAG

  docker push reg.redrock.team/sre/$IMAGE_NAME:$IMAGE_TAG
done
