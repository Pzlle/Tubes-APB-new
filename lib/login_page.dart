import 'package:flutter/material.dart';
import 'package:tubes/needhelp_page.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // Validate username and password
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Username or password cannot be Empty'),
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
    } else if (username == 'a' && password == 'a') {
      // navigate to home page if login success
      Navigator.pushReplacementNamed(context, '/lapor');
    } else {
      // show alert dialog if login failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Username or password is incorrect'),
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

  void _signUp() {
    // TODO: Perform sign up logic
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationPage()),
    );
  }

  void _needHelp() {
    // TODO: Perform need help logic
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NeedHelpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 160),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                children: [
                  const Text(
                    'Hello There!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "inter",
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40, // adjust this value as per your requirement
                    child: TextFormField(
                      controller: _passwordController,
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
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor:
                            const Color.fromRGBO(238, 102, 102, 1.0),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        ' Don’t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "inter",
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: _signUp,
                        child: const Text(
                          'Sign Up',
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 24),
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
      ),
    );
  }
}