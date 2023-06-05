import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'lapor_page.dart';

class EditLaporanPage extends StatefulWidget {
  const EditLaporanPage({Key? key}) : super(key: key);

  @override
  _EditLaporanPageState createState() => _EditLaporanPageState();
}

class _EditLaporanPageState extends State<EditLaporanPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTindakan;
  String? _deskripsiKronologi;
  File? _imageFile;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        _showSnackBar('Tidak dapat memilih gambar');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: IconButton(
            iconSize: 32,
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LaporPage()),
              );
            },
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 13, right: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Edit\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "inter",
                            fontSize: 27,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Laporan Anda',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "inter",
                            fontSize: 27,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jenis Tindakan',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: "inter",
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 43.0,
                          child: DropdownButtonFormField<String>(
                            value: _selectedTindakan,
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'Tindakan1',
                                child: Text('Tindakan 1',
                                    style: TextStyle(fontSize: 14)),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Tindakan2',
                                child: Text('Tindakan 2',
                                    style: TextStyle(fontSize: 14)),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Tindakan3',
                                child: Text('Tindakan 3',
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              // labelText: 'Jenis Tindakan',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(217, 217, 217, 1)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(217, 217, 217, 1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(217, 217, 217, 1)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "inter",
                              fontSize: 14,
                              color: Colors.black,
                            ), // Adjust the font size
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Jenis tindakan harus diisi';
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              setState(() {
                                _selectedTindakan = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Tanggal Kejadian',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "inter",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      height: 43,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color.fromRGBO(217, 217, 217, 1)),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy').format(_selectedDate),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "inter",
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Deskripsi Kronologi',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "inter",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Deskripsi kronologi kejadian',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelStyle: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi kronologi harus diisi';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _deskripsiKronologi = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Foto Bukti',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "inter",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _getImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(238, 238, 238, 1),
                            width: 60,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: _imageFile == null
                            ? const Icon(
                                Icons.add_a_photo,
                                size: 50.0,
                              )
                            : Image.file(
                                _imageFile!,
                                height: 150.0,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: implement submit function
                          _showSnackBar('Laporan berhasil disimpan');
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LaporPage()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(238, 102, 102, 1.0),
                        ), // Set button color to red
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Set border radius to 15
                          ),
                        ),
                      ),
                      child: const Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
