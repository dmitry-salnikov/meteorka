#!/usr/bin/env bash

REPOUSER="$1"

git-user-name() {
  echo ${REPOUSER:-$(git remote -v | grep "(fetch)" | sed 's/.*\/\([^ ]*\)\/.*/\1/')}
}

git-commit-short() {
  echo $(git rev-parse --short HEAD)
}

git-repo-name() {
  echo $(basename -s .git `git config --get remote.origin.url`)
}

git-ref-repo() {
  echo $(git-user-name)/$(git-repo-name)
}

git-ref-commit() {
  echo $(git-ref-repo)\:$(git-commit-short)
}

git-ref-commit() {
  echo $(git-ref-repo)\:latest
}
