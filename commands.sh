find ./ -type f -name "*.g.dart" -delete
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs