import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/LOGINPAGE/Function.dart';
import 'package:tracker/LOGINPAGE/forget_password.dart';
import 'package:tracker/LOGINPAGE/mobileverification.dart';
import 'package:tracker/LOGINPAGE/page_Signup.dart';

class mobilenumber extends StatefulWidget {
  mobilenumber({super.key});

  @override
  State<mobilenumber> createState() => _mobilenumberState();
}

class _mobilenumberState extends State<mobilenumber> {
  final _numController = TextEditingController();
  bool isbuttonpressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 40,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
            child: TextFormField(
              controller: _numController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: ",mobile nnumber",
                hintStyle: TextStyle(
                  fontSize: 24,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                registerUser(_numController.text, context);
              },
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.only(
                      left: 150, right: 150, top: 20, bottom: 20)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 98, 0, 255),
                  )),
              child: const Text(
                "send  otp",
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )),
          const SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }

  Future registerUser(String mobile, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 60),
        verificationCompleted: (authCredential) {
          //code for sign in
          // _auth.signInWithCredential(_).then((value) => {});
        },
        verificationFailed: (FirebaseAuthException authException) {
          print(authException.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => mobileVerification(
                        verificationid: verificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        });
  }
}
