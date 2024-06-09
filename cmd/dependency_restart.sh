#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

./cmd/dependency_clean.sh

sleep 5

./cmd/dependency_install.sh

sleep 5

flutter pub get
