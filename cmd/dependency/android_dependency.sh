#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

cd android || exit
if [ -f ./gradlew ]; then
  ./gradlew build --refresh-dependencies
fi
cd ../
