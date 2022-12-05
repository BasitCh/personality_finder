#!/bin/bash

CURRENT=`pwd`
DIR_NAME=`basename "$CURRENT"`
if [ $DIR_NAME == 'tool' ]
then
  cd ..
fi

flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-dev.yaml
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-alpha.yaml
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-beta.yaml
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-prod.yaml