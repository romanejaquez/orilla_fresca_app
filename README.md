# orilla_fresca_app

A Flutter project based on a fictional produce and grocery app, created for the Flutter Development Series on Building Beautiful User Interfaces by Roman Just Codes.

### Subscribe
Subscribe to my [YouTube Channel](https://www.youtube.com/channel/UCKsp3r1ERjCpKJtD2n5WtPg).

Subscribe to the [series](https://www.youtube.com/watch?v=om36EASG8JI&list=PL8NTBhIXP2gEdQLyKQe20T6sIqypJz5B2) for more upcoming videos.

Follow me on [Twitter](https://twitter.com/drcoderz)

## FOR THE MAP TO WORK:
- Make sure to add your Google Maps API key in the following files:
    - Make sure to have the Directions API enabled on your Google Cloud Console account
        - More info [here](https://developers.google.com/maps/documentation/directions/overview)
    - Under the ***ios*** folder: 
        - ios/Runner/AppDelegate.swift (add the API Key and import the Google Maps Reference)
        - ios/Runner/Info.plist (add the missing permissions)
    - Under the ***android*** folder:
        - android/app.src/main/AndroidManifest.xml (add the API Key entry and permissions)
- pubspec.yaml: install the google_maps_flutter dependency

## FOR THE GOOGLE SIGN IN TO WORK
- Create your own Firebase project in [Firebase Console](https://firebase.google.com/)
- Follow the steps on adding both an Android App and IOS App and install the corresponding SDK's
    - Importing the configuration files (*.plist for IOS, *.json for Android)
    - Installing the required Flutter packages in [pub.dev](https://pub.dev/):
        - [google_sign_in](https://pub.dev/packages/google_sign_in)
        - [firebase_core](https://pub.dev/packages/firebase_core)
        - [firebase_auth](https://pub.dev/packages/firebase_auth)
        - [cloud_firestore](https://pub.dev/packages/cloud_firestore)
        
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
