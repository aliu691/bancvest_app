import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    return '.env';
  }

  static String get firebaseWebApiKey {
    return dotenv.env['FIREBASE_WEB_API_KEY'] ??
        'FIREBASE WEB API KEY NOT FOUND';
  }

  static String get firebaseWebAppId {
    return dotenv.env['FIREBASE_WEB_APP_ID'] ?? 'FIREBASE WEB APP ID NOT FOUND';
  }

  static String get firebaseAndroidApiKey {
    return dotenv.env['FIREBASE_ANDROID_API_KEY'] ??
        'FIREBASE ANDROID API KEY NOT FOUND';
  }

  static String get firebaseAndroidAppId {
    return dotenv.env['FIREBASE_ANDROID_APP_ID'] ??
        'FIREBASE ANDROID APP ID NOT FOUND';
  }

  static String get firebaseIosApiKey {
    return dotenv.env['FIREBASE_IOS_API_KEY'] ??
        'FIREBASE IOS API KEY NOT FOUND';
  }

  static String get firebaseIosAppId {
    return dotenv.env['FIREBASE_IOS_APP_ID'] ?? 'FIREBASE IOS APP ID NOT FOUND';
  }

  static String get firebaseMessagingKey {
    return dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ??
        'FIREBASE MESSAGING SENDER ID NOT FOUND';
  }

  static String get firebaseIosClientId {
    return dotenv.env['FIREBASE_IOS_CLIENT_ID'] ??
        'FIREBASE IOS CLIENT ID NOT FOUND';
  }
}
