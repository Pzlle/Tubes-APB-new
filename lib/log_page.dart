import 'package:flutter/material.dart';
import 'package:tubes/edit_laporan_page.dart';

import 'hamburger_page.dart';
import 'setting_page.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _editLaporan() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditLaporanPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(208, 0, 0, 1),
                  Color.fromARGB(255, 255, 255, 255)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(0, 217, 92, 92),
                        ),
                        child: IconButton(
                          iconSize: 35,
                          icon: const Icon(Icons.menu),
                          onPressed: _openDrawer,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(width: 260),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 52,
                            width: 52,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(0, 217, 92, 92),
                            ),
                            child: IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.settings),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingPage()),
                                );
                              },
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/ehe.jpeg'),
                    radius: 70,
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          icon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              leading: const Text("13/05/2023"),
                              title: const Text("Pelecehan"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _editLaporan();
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              leading: const Text("14/05/2023"),
                              title: const Text("Kekerasan"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _editLaporan();
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}