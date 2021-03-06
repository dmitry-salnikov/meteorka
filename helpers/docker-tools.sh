#!/usr/bin/env bash

DOCKER_HUB_USERNAME="mitusha"
source ./git-tools.sh "$DOCKER_HUB_USERNAME"

REPO_REF="$(git-ref-repo)"
TAG_HEAD="$(git-ref-commit)"
TAG_LATEST="$(git-ref-latest)"

docker-build() {
  docker build -t "$TAG_HEAD" .
}

docker-tag() {
  docker tag "$TAG_HEAD" "$1"
}

docker-tag-latest() {
  docker tag "$TAG_HEAD" "$TAG_LATEST"
}

docker-push() {
  docker push "$REPO_REF"
}

docker-publish() {
  docker-tag-latest && docker-push
}

docker-build-n-publish() {
  docker-build && docker-publish
}
