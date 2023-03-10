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
    apiKey: 'AIzaSyDMLRTuoSlwcmqYhuky3cRFkpH1kUfvjb0',
    appId: '1:384690879167:web:7ef2c89e8d6bee08a8640a',
    messagingSenderId: '384690879167',
    projectId: 'notes-app-fe6c6',
    authDomain: 'notes-app-fe6c6.firebaseapp.com',
    storageBucket: 'notes-app-fe6c6.appspot.com',
    measurementId: 'G-V02XEQVYBJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOlfSW8wPT4kUxtKAU2JGBAb1gEiIRByw',
    appId: '1:384690879167:android:4327278fc19d28f8a8640a',
    messagingSenderId: '384690879167',
    projectId: 'notes-app-fe6c6',
    storageBucket: 'notes-app-fe6c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5Af2MkRHFJR-2OhldhxtSQVLU0YK5csc',
    appId: '1:384690879167:ios:f1de078887dc0021a8640a',
    messagingSenderId: '384690879167',
    projectId: 'notes-app-fe6c6',
    storageBucket: 'notes-app-fe6c6.appspot.com',
    iosClientId:
        '384690879167-ugc89ios1njihe98ee63l1v1o3laiec3.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5Af2MkRHFJR-2OhldhxtSQVLU0YK5csc',
    appId: '1:384690879167:ios:f1de078887dc0021a8640a',
    messagingSenderId: '384690879167',
    projectId: 'notes-app-fe6c6',
    storageBucket: 'notes-app-fe6c6.appspot.com',
    iosClientId:
        '384690879167-ugc89ios1njihe98ee63l1v1o3laiec3.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesapp',
  );
}
