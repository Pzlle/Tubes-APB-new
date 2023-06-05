import 'package:flutter/material.dart';

class NeedHelpPage extends StatefulWidget {
  const NeedHelpPage({Key? key}) : super(key: key);

  @override
  _NeedHelpPageState createState() => _NeedHelpPageState();
}

class _NeedHelpPageState extends State<NeedHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan'),
        backgroundColor: Color.fromARGB(255, 222, 75, 75),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cara Menggunakan Aplikasi'),
                  content: const Text(
                      '1. Buka aplikasi.\n2. Masukkan Username dan Password, Password minimal 6 karakter.\n3. Tekan tombol Login.'),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(238, 102, 102, 1),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(Icons.apps, size: 50),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cara Mendaftar Akun'),
                  content: const Text(
                      '1. Buka halaman Registrasi.\n2. Isi formulir registrasi sesuai ketentuan.\n3. Tekan tombol Sign Up.'),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(238, 102, 102, 1),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(Icons.person_add, size: 50),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cara Mengubah Password'),
                  content: const Text(
                      '1. Buka halaman Profil.\n2. Tekan tombol Ubah Password.\n3. Masukkan password lama dan password baru.'),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(238, 102, 102, 1),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(Icons.lock, size: 50),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cara Menghapus Akun'),
                  content: const Text(
                      '1. Buka halaman Pengaturan Akun.\n2. Tekan tombol Hapus Akun.\n3. Masukkan password Anda.\n4. Tekan tombol Hapus Akun.'),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(238, 102, 102, 1),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(Icons.delete, size: 50),
          ),
        ],
      ),
    );
  }
}