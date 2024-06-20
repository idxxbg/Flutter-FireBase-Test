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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCcd-AJGVOShTVRoutohtxH9bAzxjUL0-U',
    appId: '1:13815590656:web:11efa8c803b1ceeb144de5',
    messagingSenderId: '13815590656',
    projectId: 'fir-test-8f43b',
    authDomain: 'fir-test-8f43b.firebaseapp.com',
    storageBucket: 'fir-test-8f43b.appspot.com',
    measurementId: 'G-334BFHPK6H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZn4-sv6DjZnN76-YXeE4OLrHb0bxmWfg',
    appId: '1:13815590656:android:13a3dcc1e4c844eb144de5',
    messagingSenderId: '13815590656',
    projectId: 'fir-test-8f43b',
    storageBucket: 'fir-test-8f43b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCz30HsDSgDAk5hYBfHXc6j6MqR9rbjjcA',
    appId: '1:13815590656:ios:080f8ce9d2b7352c144de5',
    messagingSenderId: '13815590656',
    projectId: 'fir-test-8f43b',
    storageBucket: 'fir-test-8f43b.appspot.com',
    iosBundleId: 'com.example.flutterStackApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCz30HsDSgDAk5hYBfHXc6j6MqR9rbjjcA',
    appId: '1:13815590656:ios:080f8ce9d2b7352c144de5',
    messagingSenderId: '13815590656',
    projectId: 'fir-test-8f43b',
    storageBucket: 'fir-test-8f43b.appspot.com',
    iosBundleId: 'com.example.flutterStackApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcd-AJGVOShTVRoutohtxH9bAzxjUL0-U',
    appId: '1:13815590656:web:1937159264a7e074144de5',
    messagingSenderId: '13815590656',
    projectId: 'fir-test-8f43b',
    authDomain: 'fir-test-8f43b.firebaseapp.com',
    storageBucket: 'fir-test-8f43b.appspot.com',
    measurementId: 'G-GXXCTPEV6L',
  );
}