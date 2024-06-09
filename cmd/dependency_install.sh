#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

./cmd/dependency/flutter_dependency.sh
./cmd/dependency/loco_dependency.sh

# Generate dart files
./cmd/flutter_gen_execute.sh

./cmd/dependency/ios_dependency.sh
./cmd/dependency/android_dependency.sh
