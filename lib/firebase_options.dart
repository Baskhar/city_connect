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
    apiKey: 'AIzaSyBsmfslzF4eUqrvbj9l0ExjszqRr4WF248',
    appId: '1:892953408643:web:b65eb1a6e334044214d7b6',
    messagingSenderId: '892953408643',
    projectId: 'city-connect-21ddf',
    authDomain: 'city-connect-21ddf.firebaseapp.com',
    storageBucket: 'city-connect-21ddf.appspot.com',
    measurementId: 'G-41GJYSHZQC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9-edF5RpIy7WanJgnmLqvTdK_Z3Tj6QU',
    appId: '1:892953408643:android:db32c0351209dcee14d7b6',
    messagingSenderId: '892953408643',
    projectId: 'city-connect-21ddf',
    storageBucket: 'city-connect-21ddf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaB_Y8s92QFwaq2hsgEZBGcig7vd8LJDI',
    appId: '1:892953408643:ios:c79320026be1225f14d7b6',
    messagingSenderId: '892953408643',
    projectId: 'city-connect-21ddf',
    storageBucket: 'city-connect-21ddf.appspot.com',
    iosClientId: '892953408643-vt1sqmj52kfuu5oefr5sbqtv6l7bnngo.apps.googleusercontent.com',
    iosBundleId: 'com.walysson.cityConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaB_Y8s92QFwaq2hsgEZBGcig7vd8LJDI',
    appId: '1:892953408643:ios:2b13745c237e677414d7b6',
    messagingSenderId: '892953408643',
    projectId: 'city-connect-21ddf',
    storageBucket: 'city-connect-21ddf.appspot.com',
    iosClientId: '892953408643-j9jvitgv2f1ovpm8er3ppf1lkf4nl4i6.apps.googleusercontent.com',
    iosBundleId: 'com.walysson.cityConnect.RunnerTests',
  );
}
