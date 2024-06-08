#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

dart run build_runner clean

# Remove all .g.dart files within lib folder and its subfolders not tracked by git
find ./lib -name '*.g.dart' | grep -v "$(git ls-files)" | xargs rm
find ./lib -name '*.freezed.dart' | grep -v "$(git ls-files)" | xargs rm

# Remove all .g.dart files within example folder and its subfolders not tracked by git
find ./example -name '*.g.dart' | grep -v "$(git ls-files)" | xargs rm
find ./example -name '*.freezed.dart' | grep -v "$(git ls-files)" | xargs rm
