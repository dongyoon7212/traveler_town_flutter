// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyAH9NqHi22KYV8VRXcRCYJH5iPbo0ykWvw',
    appId: '1:552170877326:web:77d256bf4759dd605e74df',
    messagingSenderId: '552170877326',
    projectId: 'traveler-town',
    authDomain: 'traveler-town.firebaseapp.com',
    storageBucket: 'traveler-town.appspot.com',
    measurementId: 'G-K99TGJ3V51',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEGF1Hcbk6-IfNDWhRZz8tePP29mGw-Bc',
    appId: '1:552170877326:ios:258140f8ea9ec3b15e74df',
    messagingSenderId: '552170877326',
    projectId: 'traveler-town',
    storageBucket: 'traveler-town.appspot.com',
    iosBundleId: 'com.example.travelerTown',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEGF1Hcbk6-IfNDWhRZz8tePP29mGw-Bc',
    appId: '1:552170877326:ios:258140f8ea9ec3b15e74df',
    messagingSenderId: '552170877326',
    projectId: 'traveler-town',
    storageBucket: 'traveler-town.appspot.com',
    iosBundleId: 'com.example.travelerTown',
  );
}
