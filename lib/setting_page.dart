import 'package:flutter/material.dart';
import 'package:tubes/welcome_page.dart';
import 'lapor_page.dart';
import 'needhelp_page.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _name = '';
  String _username = '';
  String _email = '';
  String _password = '';

  final _formKey = GlobalKey<FormState>();

  void _needHelp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NeedHelpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 130.0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: IconButton(
            iconSize: 32,
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LaporPage()),
              );
            },
          ),
        ),
        title: Text(
          'Hi, \nAzizi Shafaa Asadel',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "inter",
            fontSize: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(220, 0, 0, 1),Color.fromRGBO(202, 202, 202, 1)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/ehe.jpeg'),
                        radius: 70,
                      ),
                      const SizedBox(width: 16.0),
                      // const Icon(Icons.person, size: 48.0),            
                      // Text(
                      //   'Hello, $_name',
                      //   style: const TextStyle(fontSize: 24.0),
                      // ),
                    ],
                  ),
                ),

                // const SizedBox(height: 16.0),
                // ElevatedButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.cloud_upload),
                //   label: const Text('Upload Image'),
                // ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
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
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            // Do something with the form data
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(238, 102, 102, 1.0),
                        ),
                        icon: const Icon(Icons.save),
                        label: const Text('Save Changes'),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const WelcomePage()));
                        },
                        icon: const Icon(Icons.delete, color: Color.fromRGBO(238, 102, 102, 1.0),),
                        label: const Text('Delete Account', style: TextStyle(color: Color.fromRGBO(238, 102, 102, 1.0)),),

                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: _needHelp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.help_outline, color: Color.fromRGBO(238, 102, 102, 1.0)),
                      SizedBox(width: 8.0),
                      Text(
                        'Need Help?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(238, 102, 102, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}