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
    apiKey: 'AIzaSyDUwL3YeeIuIYiSklAK8AqSzIiTeo1xI6E',
    appId: '1:781794469901:web:d6741c047d636c2fe44d44',
    messagingSenderId: '781794469901',
    projectId: 'mminhlequang-apps',
    authDomain: 'mminhlequang-apps.firebaseapp.com',
    storageBucket: 'mminhlequang-apps.appspot.com',
    measurementId: 'G-5V560Y15VT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYTajg6dojVzF8tEdeuUt69BA0WR9xaX8',
    appId: '1:781794469901:android:0cdd4350efdbd740e44d44',
    messagingSenderId: '781794469901',
    projectId: 'mminhlequang-apps',
    storageBucket: 'mminhlequang-apps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAD71cJSiky9fNaPb86HA4A7lljPIBPIMA',
    appId: '1:781794469901:ios:6d8728f2708961efe44d44',
    messagingSenderId: '781794469901',
    projectId: 'mminhlequang-apps',
    storageBucket: 'mminhlequang-apps.appspot.com',
    iosBundleId: 'com.app.boilerplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAD71cJSiky9fNaPb86HA4A7lljPIBPIMA',
    appId: '1:781794469901:ios:a05f6581161519f0e44d44',
    messagingSenderId: '781794469901',
    projectId: 'mminhlequang-apps',
    storageBucket: 'mminhlequang-apps.appspot.com',
    iosBundleId: 'y',
  );
}
