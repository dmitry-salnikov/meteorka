#!/usr/bin/env bash

# Get the latest commit short SHA-1 in current folder repository

git-commit-short() {
  echo $(git rev-parse --short HEAD)
}

git-repo-name() {
  echo $(basename -s .git `git config --get remote.origin.url`)
}

git-user-name() {
  echo $(git remote -v | grep "(fetch)" | sed 's/.*\/\([^ ]*\)\/.*/\1/')
}

git-ref-repo() {
  echo $(git-user-name)/$(git-repo-name)
}

git-ref-commit() {
  echo $(git-ref-repo)\:$(git-commit-short)
}

