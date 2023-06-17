import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tubes/lapor_page.dart';
import 'package:tubes/needhelp_page.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({Key? key}) : super(key: key);

  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _JenisTindakan = TextEditingController();
  final TextEditingController _TanggalKejadian = TextEditingController();
  final TextEditingController _deskripsiKronologi = TextEditingController();
  final TextEditingController _TempatKejadian = TextEditingController();

  // late User? user;

  @override
  void dispose() {
    _JenisTindakan.dispose();
    _TanggalKejadian.dispose();
    _deskripsiKronologi.dispose();
    _TempatKejadian.dispose();
    super.dispose();
  }

  void _cancel() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LaporPage()),
    );
  }

  void _needHelp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NeedHelpPage()),
    );
  }

  void _signUp() async {
    String jenis = _JenisTindakan.text;
    String tanggal = _TanggalKejadian.text;
    String deskripsi = _deskripsiKronologi.text;
    String tempat = _TempatKejadian.text;

    createLaporan(jenis, tanggal, deskripsi, tempat);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LaporPage()),
    );
    if (jenis.isEmpty || tanggal.isEmpty || deskripsi.isEmpty || tempat.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Laporan gagal'),
            content: const Text('Data cannot be empty'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (tempat.length < 6) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Failed'),
            content: const Text('Password must be at least 6 characters'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> createLaporan(String jenis, String tanggal ,String deskripsi, String tempat) async {
    try {
      await FirebaseFirestore.instance.collection('Laporan').doc().set({
        'jenis': jenis,
        'tanggal': tanggal,
        'deskripsi' : deskripsi,
        'tempat' : tempat,
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Laporan Failed'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            children: [
              const SizedBox(height: 110),
              RichText(
                text: const TextSpan(
                  text: 'Tuliskan\nLaporan Anda',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "inter",
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: _JenisTindakan,
                        decoration: InputDecoration(
                          labelText: 'jenis Tindakan',
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: _TanggalKejadian,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Kejadian',
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          if (!value.contains('@gmail.com')) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: _deskripsiKronologi,
                        decoration: InputDecoration(
                          labelText: 'Deskripsi Kronologi',
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: _TempatKejadian,
                        // obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Tempat Kejadian',
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tempat kejadian cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          _signUp();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(238, 102, 102, 1.0),
                        ),
                        child: const Text('Submit'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: _cancel,
                            child: const Text(
                              '                                    cancel',
                              style: TextStyle(
                                color: Color.fromRGBO(238, 102, 102, 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future createLaporan({required String selectedTindakan}) async {
  //   final docLaporan = FirebaseFirestore.instance.collection('Laporan').doc(); 
  
  //   final laporan = Laporan{
  //     id: docLaporan.id,
  //     name : name,
  //     age : 21,
  //     birthday: DateTime(2001,7,28),
  //   };

  //   await docLaporan.set(json);
  // }
}

// class Laporan {
//   String id;
//   final DateTime _selectedDate;
//   final String _selectedTindakan;
//   final String _deskripsiKronologi;
//   final File _imageFile;

//   Laporan({
//     this.id = '',
//     required this._selectedDate,
//     required this._selectedTindakan,
//     required this._deskripsiKronologi,
//     required this._imageFile,
//   });

//   Map<String, dynamic> to Json() => {
//     'id' : id,
//     'ndate' : _selectedDate,
//     'deskrisi' : _deskripsiKronologi,
//     'imagefile' : _imageFile,
//   };
// }
