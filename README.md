# Flutter Cross Platform Communication

- This project demonstrates the capability to run platform specific code in flutter app specifically for iOS.
- Platform Channels are being used to invoke the trigger of running iOS specific code written in `Swift`.
- Project specifically handles opening SfSafariWebView in iOS on trigger of CTA available in home screen of app. Ref : `main.dart`
- Once the web view is opened, it can be closed porgramatically depending upon the call back received from web js.


# Configuration Setup
- In order to test out the app, clone the repo and  update the following in project :
- replace the URL with your actual URL which should consist `chat_id` , `auth_token` , `app_id` in `openSafari()` method under `main.dart`  file.
- update your package id under `CFBundleURLSchemes tag`  in info.plist file under iOS folder. Ref: `/main/ios/Runner/Info.plist`.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
