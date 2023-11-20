// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';
import 'package:tracker/LOGINPAGE/pageSignOrLogin.dart';
import 'package:tracker/PAGES/page_home.dart';

class Splashscreen extends StatefulWidget {
  final Controller inset;
  Splashscreen({super.key, required this.inset});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    gotonxtPG();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 100),
              child: Image.asset(
                "assets/Ellipse 38.png",
                color: const Color.fromARGB(255, 240, 80, 133),
              ),
            ),
            Center(
              child: Text(
                "montra",
                style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gotonxtPG() async {
    await Future.delayed(Duration(seconds: 2));
    // await  Timer(Duration(seconds: 10), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignOrLogin()));
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => HomePage(inset: widget.inset)));
  }
}
