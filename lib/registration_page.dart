import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'needhelp_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //get docUser => null;
  late var user;

  @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  void _logIn() {
    // TODO: Perform sign up logic
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _needHelp() {
    // TODO: Perform need help logic
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NeedHelpPage()),
    );
  }

  void _signUp() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    String email = _emailController.text;
    if (username.isEmpty || password.isEmpty || name.isEmpty || email.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Data cannot be Empty'),
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
    } else if (!email.contains('@gmail.com')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Email Not Valod'),
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
    } else if (password.length < 6) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
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
    } else {
      //go to home
      _logIn();
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
                text: TextSpan(
                  text: 'Create your\naccount',
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
                      height: 40, // adjust this value as per your requirement
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nama Asli',
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
                      height: 40, // adjust this value as per your requirement
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
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
                      height: 40, // adjust this value as per your requirement
                      child: TextFormField(
                        controller: _usernameController,
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
                      height: 40, // adjust this value as per your requirement
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
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
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
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
                          //_signUp();
                          //createUser(_signUp);
                          setState(() {
                            user = User(
                              id: 'test',
                              name: _usernameController.text,
                              password: _passwordController.text,
                              username: _usernameController.text,
                              email: _emailController.text,
                            );
                          });
                          await createUser(user);
                          _logIn();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(238, 102, 102, 1.0),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          '  Already have an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "inter",
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: _logIn,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color.fromRGBO(238, 102, 102, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 120),
              Column(
                children: [
                  // Widget lain di sini
                  Padding(
                    padding: const EdgeInsets.only(left: 0, bottom: 24),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: _needHelp,
                        child: const Text(
                          'Need Help?',
                          style: TextStyle(
                            color: Color.fromRGBO(238, 102, 102, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createUser(User user) async {
    CollectionReference docUser =
        FirebaseFirestore.instance.collection('users');
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.add(json);
  }
}

class User {
  String id;
  final String name;
  final String password;
  final String username;
  final String email;

  User(
      {this.id = '',
      required this.name,
      required this.password,
      required this.username,
      required this.email});

  Map<String, dynamic> toJson() => {
        id: id,
        name: name,
        password: password,
        username: username,
        email: email,
      };
}
