#!/bin/bash

CURRENT=`pwd`
DIR_NAME=`basename "$CURRENT"`
if [ $DIR_NAME == 'tool' ]
then
  cd ..
fi

find ./ -type f -name "*.g.dart" -delete
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs