# apalive

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

rename setAppName --targets ios,android --value "APA Live"  
rename setBundleId --targets ios,android --value "com.anysoft.apalive"

build apk with low size:
flutter build apk --split-per-abi

build appbundle:
flutter build appbundle --release --build-name=1.0.0 --build-number=4
flutter build apk --release

build runner:
dart run build_runner build --delete-conflicting-outputs