import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:tracker/LOGINPAGE/page_Login.dart';
import 'package:tracker/LOGINPAGE/page_Signup.dart';

class SignOrLogin extends StatefulWidget {
  SignOrLogin({super.key});

  @override
  State<SignOrLogin> createState() => _SignOrLoginState();
}

class _SignOrLoginState extends State<SignOrLogin> {
 
  final List<Widget> _slides = [slideone(), slidetwo(), slideothree()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              child: CarouselSlider.builder(
                enableAutoSlider: true,
                unlimitedMode: true,
                autoSliderTransitionTime: const Duration(seconds: 1),
                itemCount: _slides.length,
                slideBuilder: (index) {
                  return _slides[index];
                },
                slideIndicator: CircularSlideIndicator(
                  currentIndicatorColor: const Color.fromARGB(255, 96, 11, 255),
                  indicatorBackgroundColor:
                      const Color.fromARGB(255, 225, 207, 253),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageSignUp()));
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.only(top: 20, bottom: 20)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 96, 11, 255),
                      )),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageLogin()));
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.only(top: 20, bottom: 20)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 225, 207, 253),
                      )),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 96, 11, 255),
                    ),
                  )),
            )
          ],
        ));
  }
}

Widget slideone() {
  return Column(children: [
    const SizedBox(
      height: 30,
    ),
    Image.asset(
      "assets/hand.png",
      width: 300,
      height: 300,
    ),
    const SizedBox(
      height: 50,
    ),
    const Text(
      "Gain total control \n   of your money",
      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 10,
    ),
    const Text(
      "Become your own money manager \n        and make every cent count",
      style: TextStyle(
          color: Colors.grey, fontSize: 21, fontWeight: FontWeight.w400),
    ),
  ]);
}

Widget slidetwo() {
  return Column(children: [
    const SizedBox(
      height: 30,
    ),
    Image.asset(
      "assets/money.png",
      width: 320,
      height: 320,
    ),
    const SizedBox(
      height: 30,
    ),
    const Text(
      "Know where your \n     money goes",
      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 10,
    ),
    const Text(
      "      Track your transaction easilu, \n with categories and financial report",
      style: TextStyle(
          color: Colors.grey, fontSize: 21, fontWeight: FontWeight.w400),
    ),
  ]);
}

Widget slideothree() {
  return Column(children: [
    const SizedBox(
      height: 30,
    ),
    Image.asset(
      "assets/plan.png",
      width: 300,
      height: 300,
    ),
    const SizedBox(
      height: 80,
    ),
    const Text(
      "Planning ahead",
      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 27,
    ),
    const Text(
      "Setup your budget for each category \n                  so you in control",
      style: TextStyle(
          color: Colors.grey, fontSize: 21, fontWeight: FontWeight.w400),
    ),
  ]);
}
