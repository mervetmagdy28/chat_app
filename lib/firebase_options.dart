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
    apiKey: 'AIzaSyCAoqcg7gDcdDz14nCwmoeMOsoNbzaIgd0',
    appId: '1:815555414092:web:bc7799513249de3be9cce9',
    messagingSenderId: '815555414092',
    projectId: 'chat-app-ace5e',
    authDomain: 'chat-app-ace5e.firebaseapp.com',
    storageBucket: 'chat-app-ace5e.appspot.com',
    measurementId: 'G-1HLJ945LFB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFm5bBro170pLKZP1LVqBy1fWhm-qu-nk',
    appId: '1:815555414092:android:59a26c032228b4c3e9cce9',
    messagingSenderId: '815555414092',
    projectId: 'chat-app-ace5e',
    storageBucket: 'chat-app-ace5e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK6vMJSRLW18gL3VFZXhuf7ffyvct3hsY',
    appId: '1:815555414092:ios:14736e2c7399f2bee9cce9',
    messagingSenderId: '815555414092',
    projectId: 'chat-app-ace5e',
    storageBucket: 'chat-app-ace5e.appspot.com',
    iosClientId: '815555414092-knggnc3hgn3hp2q3dbe9mo6mk0lde2p7.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBK6vMJSRLW18gL3VFZXhuf7ffyvct3hsY',
    appId: '1:815555414092:ios:14736e2c7399f2bee9cce9',
    messagingSenderId: '815555414092',
    projectId: 'chat-app-ace5e',
    storageBucket: 'chat-app-ace5e.appspot.com',
    iosClientId: '815555414092-knggnc3hgn3hp2q3dbe9mo6mk0lde2p7.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}