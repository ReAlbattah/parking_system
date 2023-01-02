// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDaIE3j7hLGrHmjuNia0DeUIPP6hvT6708',
    appId: '1:755741657646:web:85be788ccc0e9ae50fedbf',
    messagingSenderId: '755741657646',
    projectId: 'parkingsystem-627d7',
    authDomain: 'parkingsystem-627d7.firebaseapp.com',
    storageBucket: 'parkingsystem-627d7.appspot.com',
    measurementId: 'G-WMFJS01F2E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBW-QuraRiN1CZexCRJQQhNr4J8QuJxeLU',
    appId: '1:755741657646:android:7d1afb810569aaf00fedbf',
    messagingSenderId: '755741657646',
    projectId: 'parkingsystem-627d7',
    storageBucket: 'parkingsystem-627d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhW_xgq_JODUll5BiSZATqIhe4mEBtVhc',
    appId: '1:755741657646:ios:936664225a05bd9b0fedbf',
    messagingSenderId: '755741657646',
    projectId: 'parkingsystem-627d7',
    storageBucket: 'parkingsystem-627d7.appspot.com',
    iosClientId: '755741657646-lnqtpor6lckssd993nt7d5spflf13fce.apps.googleusercontent.com',
    iosBundleId: 'com.example.parkingSystem',
  );
}
