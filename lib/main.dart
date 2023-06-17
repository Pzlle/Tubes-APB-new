import 'package:flutter/material.dart';
import 'package:tubes/Laporan_page.dart';
import 'package:tubes/edit_laporan_page.dart';
import 'package:tubes/setting_page.dart';
import 'lapor_page.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'welcome_page.dart';
import 'log_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const WelcomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/registration', page: () => const RegistrationPage()),
        GetPage(name: '/lapor', page: () => const LaporPage()),
        GetPage(name: '/laporan', page: () => const LaporanPage()),
        GetPage(name: '/log', page: () => const LogPage()),
        GetPage(name: '/setting', page: () => const SettingPage()),
        GetPage(name: '/editlaporan', page: () => const EditLaporanPage()),
      ],
    );
  }
}
