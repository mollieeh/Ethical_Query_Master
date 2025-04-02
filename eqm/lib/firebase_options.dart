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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA5QeV8tSxhNX-63SY2nHYOYxBVX7HCc5E',
    appId: '1:998229623206:web:ca9581d7c2636e8a6a8f67',
    messagingSenderId: '998229623206',
    projectId: 'ethical-query-master',
    authDomain: 'ethical-query-master.firebaseapp.com',
    storageBucket: 'ethical-query-master.firebasestorage.app',
    measurementId: 'G-F0VRQVVBGL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoqolwPlPHNwZOpcumA85ePOqHqmKpEuE',
    appId: '1:998229623206:android:59d7dd950d1fbe116a8f67',
    messagingSenderId: '998229623206',
    projectId: 'ethical-query-master',
    storageBucket: 'ethical-query-master.firebasestorage.app',
  );
}
