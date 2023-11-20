// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
import 'package:tracker/LOGINPAGE/Function.dart';
import 'package:tracker/PAGES/page_home.dart';

class mobileVerification extends StatefulWidget {
  String verificationid;
  mobileVerification({super.key, required this.verificationid});

  @override
  State<mobileVerification> createState() => _mobileVerificationState();
}

class _mobileVerificationState extends State<mobileVerification> {
  bool isbuttonpressed = true;
  final pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
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
            "Verification",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 350,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Enter your\nVerification Code",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 20,
                width: 140,
                child: Pinput(
                    controller: pinController,
                    // obscureText: true,
                    length: 6,
                    cursor: const Text("__")),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      // sendEmailVerification();
                      try {
                        PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.verificationid,
                              smsCode: pinController.text);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential).then(
                          (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(inset: inset))));
                      } catch (e) {
                        print("wrong otp $e.toString()");
                      }
                      

                      // final credential = PhoneAuthProvider.credential(
                      //     verificationId: widget.verificationid,
                      //     smsCode: pinController.text);
                      // print(credential.smsCode);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => HomePage(inset: inset)));
                      // print("//////////////////////////////////");
                    },
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(
                            left: 150, right: 150, top: 20, bottom: 20)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 98, 0, 255),
                        )),
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
