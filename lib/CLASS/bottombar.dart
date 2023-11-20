// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:ccdap/floatingButton.dart';
import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      height: 80,
      shape: CircularNotchedRectangle(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(
          'assets/home.png',
          color: Color.fromARGB(255, 132, 0, 255),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Image.asset(
            'assets/Transaction.png',
            color: Colors.grey,
          ),
        ),
        Image.asset('assets/pie chart.png', color: Colors.grey),
        Image.asset('assets/user.png', color: Colors.grey),
      ]),
    );
  }
}
