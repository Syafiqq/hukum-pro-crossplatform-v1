#!/bin/zsh

### Need to follow this https://firebase.google.com/docs/flutter/setup
### Command required before execute the fluttefire
### 1. Follow this https://firebase.google.com/docs/cli#setup_update_cli
###    $ curl -sL https://firebase.tools | bash
### 2. Run firebase login
###    $ firebase login
### 3. Install flutterfire cli
###    $ dart pub global activate flutterfire_cli
### 4. Finish, run this script shouldn't have any issue


# Define environment
firebase_project="$1"


#DO NOT EDIT, THIS ENSURE TO RUN THE SCRIPT FROM ROOT DIRECTORY
cd "$(git rev-parse --show-toplevel)" || exit

# remove Google-Service-Info.plist
rm ./ios/Runner/GoogleService-Info.plist

# remove google-services.json
rm ./android/app/google-services.json

# remove firebase_options.dart
rm ./lib/infrastructure/firebase/firebase_options.dart

# execute flutterfire configure
flutterfire configure \
  --project="$firebase_project" \
  --out=./lib/infrastructure/firebase/firebase_options.dart \
  --platforms=android,ios \
  --ios-bundle-id=com.github.syafiqq.hukumpro \
  --android-package-name=com.github.syafiqq.hukumpro
