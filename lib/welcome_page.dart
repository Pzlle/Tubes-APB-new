import 'package:flutter/material.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showMessage = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(seconds: 3),
            alignment: Alignment(_animation.value * 2 - 1, 0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(238, 102, 102, 1.0),
                    Color.fromRGBO(208, 0, 0, 1.0),
                    Color.fromRGBO(255, 183, 183, 1.0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: const Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "inter",
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: 37,
                    width: 130,
                    decoration: BoxDecoration(
                      color: _showMessage ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        padding: const EdgeInsets.all(0.0),
                      ),
                      child: ScaleTransition(
                        scale: _animation,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: _showMessage ? 1.0 : 0.0,
                          child: Ink(
                            child: Container(
                              constraints: const BoxConstraints(),
                              width: 90,
                              height: 40,
                              alignment: Alignment.center,
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "inter",
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: 1.0,
                    child: Text(
                      'Bersama Saling Melindungi \n"Aplikasi Lapor Ndan adalah sebuah platform untuk melaporkan tindakan kriminal atau pelecehan dengan memperhatikan keamanan data pribadi pelapor"',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "inter",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}