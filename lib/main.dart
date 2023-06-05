import 'package:flutter/material.dart';
import 'package:tubes/Laporan_page.dart';
import 'package:tubes/edit_laporan_page.dart';
import 'package:tubes/setting_page.dart';
import 'lapor_page.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'welcome_page.dart';
import 'Laporan_page.dart';
import 'log_page.dart';
import 'setting_page.dart';
import 'edit_laporan_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/registration': (context) => const RegistrationPage(),
        '/lapor': (context) => const LaporPage(),
        '/laporan': (context) => const LaporanPage(),
        '/log': (context) => const LogPage(),
        '/setting': (context) => const SettingPage(),
        '/editlaporan': (context) => const EditLaporanPage(),
      },
    );
  }
}
