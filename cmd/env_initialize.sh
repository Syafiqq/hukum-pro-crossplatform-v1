#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

if [ ! -f "assets/config/.env" ]; then
  cp assets/config/.env.example assets/config/.env
fi
