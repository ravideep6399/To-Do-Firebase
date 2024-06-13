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
    apiKey: 'AIzaSyDhzMUWdv8Cy1RqvAZPL0kQuhA-MVP0oLg',
    appId: '1:679761836055:web:c4b8f9622f0e7705bd0452',
    messagingSenderId: '679761836055',
    projectId: 'fir-todo-6dff7',
    authDomain: 'fir-todo-6dff7.firebaseapp.com',
    storageBucket: 'fir-todo-6dff7.appspot.com',
    measurementId: 'G-0CXP5NZSB4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl9D7jEOeZbUrelBhF1EgA-vh0DHMQy3g',
    appId: '1:679761836055:android:c09bbe866886447abd0452',
    messagingSenderId: '679761836055',
    projectId: 'fir-todo-6dff7',
    storageBucket: 'fir-todo-6dff7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPyFE0eN0WLudNCjPT7_LaSAfKZRNMxns',
    appId: '1:679761836055:ios:4ad4aaf4c66e6a9fbd0452',
    messagingSenderId: '679761836055',
    projectId: 'fir-todo-6dff7',
    storageBucket: 'fir-todo-6dff7.appspot.com',
    iosClientId: '679761836055-v8cjh2u646fcf5e4r3af9k8gq52unbkd.apps.googleusercontent.com',
    iosBundleId: 'com.example.todojango',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPyFE0eN0WLudNCjPT7_LaSAfKZRNMxns',
    appId: '1:679761836055:ios:4ad4aaf4c66e6a9fbd0452',
    messagingSenderId: '679761836055',
    projectId: 'fir-todo-6dff7',
    storageBucket: 'fir-todo-6dff7.appspot.com',
    iosClientId: '679761836055-v8cjh2u646fcf5e4r3af9k8gq52unbkd.apps.googleusercontent.com',
    iosBundleId: 'com.example.todojango',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDhzMUWdv8Cy1RqvAZPL0kQuhA-MVP0oLg',
    appId: '1:679761836055:web:1fe39d7b7389bcc4bd0452',
    messagingSenderId: '679761836055',
    projectId: 'fir-todo-6dff7',
    authDomain: 'fir-todo-6dff7.firebaseapp.com',
    storageBucket: 'fir-todo-6dff7.appspot.com',
    measurementId: 'G-FQGEVHZST7',
  );

}