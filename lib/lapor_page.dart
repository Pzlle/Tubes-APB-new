import 'package:flutter/material.dart';
import 'package:tubes/log_page.dart';
import 'package:tubes/setting_page.dart';
// import 'package:tubes/account_settings_page.dart';
import 'Laporan_page.dart';
import 'login_page.dart';
import 'hamburger_page.dart';
import 'package:ripple_wave/ripple_wave.dart';

class LaporPage extends StatefulWidget {
  const LaporPage({Key? key}) : super(key: key);

  @override
  _LaporPageState createState() => _LaporPageState();
}

class _LaporPageState extends State<LaporPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
            //hamburger
            iconSize: 32,
            icon: const Icon(Icons.menu),
            onPressed: _openDrawer,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              },
              child: const SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ehe.jpeg'),
                  radius: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(238, 102, 102, 1),
              Color.fromRGBO(184, 0, 0, 1),
              Color.fromRGBO(238, 102, 102, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                ' LAPOR \nNDANNN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              RippleWave(
                color: const Color.fromRGBO(236, 240, 249, 0.373),
                childTween: Tween(begin: 0.7, end: 1),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LaporanPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    height: 180,
                    width: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 255, 255, 0.542),
                    ),
                    child: Image.asset(
                      'assets/images/sos.png',
                      color: const Color.fromARGB(255, 205, 24, 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}