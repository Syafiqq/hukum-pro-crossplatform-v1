#!/bin/zsh

# DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

# clear flutter dependencies
flutter clean
rm -rf pubspec.lock

# clear ios pods dependencies
cd ios || exit
rm -rf Pods
rm -rf Podfile.lock
cd ../

# clear android dependencies
cd android || exit
if [ -f ./gradlew ]; then
  ./gradlew clean
fi
cd ../

# Clear generated files
./cmd/flutter_gen_clean.sh

rm -rf .dart_tool
