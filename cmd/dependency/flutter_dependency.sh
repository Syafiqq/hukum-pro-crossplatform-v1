#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

flutter pub get
