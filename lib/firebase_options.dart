// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:bancvest_app/models/environments.dart';
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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: Environment.firebaseWebApiKey,
    appId: Environment.firebaseWebAppId,
    messagingSenderId: Environment.firebaseMessagingKey,
    projectId: Environment.firebaseProjectId,
    authDomain: 'bancvest-ec2d6.firebaseapp.com',
    storageBucket: Environment.firebaseStorageBucket,
    measurementId: 'G-T35D8GM6R9',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Environment.firebaseAndroidApiKey,
    appId: Environment.firebaseAndroidAppId,
    messagingSenderId: Environment.firebaseMessagingKey,
    projectId: Environment.firebaseProjectId,
    storageBucket: Environment.firebaseStorageBucket,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: Environment.firebaseIosApiKey,
    appId: Environment.firebaseIosAppId,
    messagingSenderId: Environment.firebaseMessagingKey,
    projectId: Environment.firebaseProjectId,
    storageBucket: Environment.firebaseStorageBucket,
    iosClientId: Environment.firebaseIosClientId,
    iosBundleId: 'com.example.bancvestApp',
  );
}
