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
    apiKey: 'AIzaSyD00xIveTHu4ewEt06-5P0nCI9VgJ3y0d4',
    appId: '1:514089814398:web:8c5f7dcf88b9aa2fe98b2f',
    messagingSenderId: '514089814398',
    projectId: 'appcaronafatecmmflutter',
    authDomain: 'appcaronafatecmmflutter.firebaseapp.com',
    storageBucket: 'appcaronafatecmmflutter.appspot.com',
    measurementId: 'G-X70VH0B891',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiY7zHxuGl51O4Sh3EHW7j_YZ3kJUyATA',
    appId: '1:514089814398:ios:b07590275f0aebfee98b2f',
    messagingSenderId: '514089814398',
    projectId: 'appcaronafatecmmflutter',
    storageBucket: 'appcaronafatecmmflutter.appspot.com',
    iosBundleId: 'com.example.appcaronatg',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiY7zHxuGl51O4Sh3EHW7j_YZ3kJUyATA',
    appId: '1:514089814398:ios:8fa2f73586bc0f4fe98b2f',
    messagingSenderId: '514089814398',
    projectId: 'appcaronafatecmmflutter',
    storageBucket: 'appcaronafatecmmflutter.appspot.com',
    iosBundleId: 'com.example.appcaronatg.RunnerTests',
  );
}
