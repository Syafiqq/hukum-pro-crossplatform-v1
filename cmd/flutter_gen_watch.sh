#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

dart run build_runner watch
