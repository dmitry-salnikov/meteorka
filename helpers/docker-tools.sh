#!/usr/bin/env bash

source ./git-tools.sh
DOCKER_HUB_USERNAME="mitusha"
REPO_REF="${DOCKER_HUB_USERNAME}/$(git-repo-name)"
TAG_HEAD="$(git-ref-commit)"
TAG_LATEST="$(git-ref-repo)":latest

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
