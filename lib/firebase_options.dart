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
    apiKey: 'AIzaSyC0tVmCQFUwzc6l-KmdCLuaoPoIAMHpNWI',
    appId: '1:1022162430541:web:7314df0dffeca2d0a04a04',
    messagingSenderId: '1022162430541',
    projectId: 'laporndan-94c0d',
    authDomain: 'laporndan-94c0d.firebaseapp.com',
    storageBucket: 'laporndan-94c0d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWhTsivlg9cbdeYquhjkwnhMYXEUNjYN4',
    appId: '1:1022162430541:android:463fee5ec2c16978a04a04',
    messagingSenderId: '1022162430541',
    projectId: 'laporndan-94c0d',
    storageBucket: 'laporndan-94c0d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWYV-kt0uXVeC53z22KpUlgCf8j93XmX0',
    appId: '1:1022162430541:ios:0973c3f7a2d92eaea04a04',
    messagingSenderId: '1022162430541',
    projectId: 'laporndan-94c0d',
    storageBucket: 'laporndan-94c0d.appspot.com',
    iosClientId: '1022162430541-7qanosmlcic5qsetndvl5ajo24bsu48v.apps.googleusercontent.com',
    iosBundleId: 'com.example.tubes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWYV-kt0uXVeC53z22KpUlgCf8j93XmX0',
    appId: '1:1022162430541:ios:0973c3f7a2d92eaea04a04',
    messagingSenderId: '1022162430541',
    projectId: 'laporndan-94c0d',
    storageBucket: 'laporndan-94c0d.appspot.com',
    iosClientId: '1022162430541-7qanosmlcic5qsetndvl5ajo24bsu48v.apps.googleusercontent.com',
    iosBundleId: 'com.example.tubes',
  );
}
